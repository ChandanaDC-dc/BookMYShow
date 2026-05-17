<%@ page import="java.sql.*,com.bms.dao.DBConnection" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<%
String movie = request.getParameter("movie");
String rating = request.getParameter("rating");
String desc = request.getParameter("desc");
String img = request.getParameter("img");
String cast = request.getParameter("cast");

/* SAVE DETAILS IN SESSION */
session.setAttribute("rating", rating);
session.setAttribute("desc", desc);
session.setAttribute("img", img);
session.setAttribute("cast", cast);
boolean isPlay = false;


String[] plays = {
    "Andha Yug", "The Last Letter", "Detective Files",
    "Dreams in Monsoon", "City Monologues"
};

for(String p : plays){
    if(p.equalsIgnoreCase(movie)){
        isPlay = true;
        break;
    }
}

if(movie == null || movie.trim().isEmpty()){
    movie = "Unknown";
}

String city = (String) session.getAttribute("city");

if(city == null){
    city = "Bangalore";
    session.setAttribute("city", city);
}

ResultSet rs = null;

if(!isPlay){
    Connection con = DBConnection.getConnection();
    PreparedStatement ps = con.prepareStatement(
        "SELECT * FROM theatres WHERE city=?"
    );
    ps.setString(1, city);
    rs = ps.executeQuery();
}

Calendar cal = Calendar.getInstance();
SimpleDateFormat dowFmt = new SimpleDateFormat("EEE");
SimpleDateFormat dayFmt = new SimpleDateFormat("dd MMM");
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Select showtime</title>
<link rel="stylesheet" href="css/bms-theme.css" />
<style>
/* Enhanced Theatres UI */
.bms-page-pad {
    background: #ffffff;
    border-radius: 20px;
    box-shadow: 0 10px 30px rgba(0,0,0,0.04);
    padding: 30px 40px;
    margin: 30px auto;
    max-width: 1100px;
    border: 1px solid #f1f5f9;
}
.bms-date-strip {
    gap: 16px;
    padding: 10px 0 20px;
}
.bms-date-item {
    padding: 16px 20px;
    border-radius: 16px;
    border: 2px solid #e2e8f0;
    transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
    background: #f8fafc;
    min-width: 85px;
}
.bms-date-item:hover {
    border-color: #cbd5e1;
    transform: translateY(-2px);
}
.bms-date-item.is-active {
    background: #f84464;
    color: white;
    border-color: #f84464;
    box-shadow: 0 10px 25px rgba(248, 68, 100, 0.3);
    transform: scale(1.05);
}
.bms-cinema-row {
    background: #ffffff;
    border: 1px solid #e2e8f0;
    border-radius: 16px;
    padding: 24px;
    margin-bottom: 20px;
    transition: all 0.3s;
    box-shadow: 0 4px 15px rgba(0,0,0,0.03);
}
.bms-cinema-row:hover {
    border-color: #cbd5e1;
    box-shadow: 0 12px 30px rgba(0,0,0,0.08);
    transform: translateY(-3px);
}
.bms-cinema-name {
    font-size: 1.25rem;
    color: #0f172a;
    font-weight: 800;
}
.bms-showtimes button[type="submit"] {
    background: #ffffff;
    border: 1px solid #e2e8f0;
    color: #10b981;
    border-left: 4px solid #10b981;
    padding: 12px 20px;
    border-radius: 10px;
    font-weight: 600;
    transition: all 0.2s;
}
.bms-showtimes button[type="submit"]:hover {
    background: #10b981;
    color: white;
    transform: translateY(-2px);
    box-shadow: 0 8px 16px rgba(16, 185, 129, 0.25);
}
</style>
</head>

<body class="bms-body">

<jsp:include page="navbar.jsp" />

<div class="bms-page-pad">
    <h1 class="bms-page-title" style="margin-top:8px;"><%= movie %></h1>
    <p class="bms-page-sub">Showing in <%= city %> &middot; Pick a cinema and showtime</p>

    <div class="bms-date-strip">
    <%
    for (int i = 0; i < 7; i++) {
        boolean active = (i == 0);
    %>
        <div class="bms-date-item <%= active ? "is-active" : "" %>">
            <%= dowFmt.format(cal.getTime()).toUpperCase() %><br />
            <%= dayFmt.format(cal.getTime()) %>
        </div>
    <%
        cal.add(Calendar.DATE, 1);
    }
    %>
    </div>
</div>

<div class="bms-page-pad" style="padding-top:0;">

<%
boolean found = false;

/* ================= PLAY FLOW ================= */
if(isPlay){

    String[][] theatres = {
        {"Rangayana Theatre", "Mysore"},
        {"Town Hall", "Mysore"},
        {"Kalamandir", "Bangalore"}
    };

    for(String[] t : theatres){
        found = true;
        String theatre = t[0];
        String location = t[1];
%>

<form action="selectSeats.jsp" method="get">

    <input type="hidden" name="movie" value="<%= movie %>">
    <input type="hidden" name="theatre" value="<%= theatre %>">

    <input type="hidden" name="rating" value="<%= rating %>">
    <input type="hidden" name="desc" value="<%= desc %>">
    <input type="hidden" name="img" value="<%= img %>">
    <input type="hidden" name="cast" value="<%= cast %>">

    <div class="bms-cinema-row">
        <div>
            <p class="bms-cinema-name"><%= theatre %></p>
            <p class="bms-cinema-loc"><%= location %></p>
        </div>
        <div class="bms-showtimes">
            <button type="submit">05:00 PM</button>
            <button type="submit">07:30 PM</button>
        </div>
    </div>
</form>

<%
    }

/* ================= MOVIE FLOW ================= */
} else {

    while(rs.next()){
        found = true;
        String theatre = rs.getString("name");
        String location = rs.getString("location");
%>

<form action="selectSeats.jsp" method="get">
    <input type="hidden" name="movie" value="<%= movie %>">
    <input type="hidden" name="theatre" value="<%= theatre %>">
   

<input type="hidden" name="rating" value="<%= rating %>">
<input type="hidden" name="desc" value="<%= desc %>">
<input type="hidden" name="img" value="<%= img %>">
<input type="hidden" name="cast" value="<%= cast %>">

<input type="hidden" id="seatsInput" name="seats">

    <div class="bms-cinema-row">
        <div>
            <p class="bms-cinema-name"><%= theatre %></p>
            <p class="bms-cinema-loc"><%= location %></p>
        </div>
        <div class="bms-showtimes">
            <button type="submit">09:45 AM</button>
            <button type="submit">12:30 PM</button>
            <button type="submit">03:15 PM</button>
            <button type="submit">06:45 PM</button>
            <button type="submit">09:30 PM</button>
        </div>
    </div>
</form>

<%
    }
}

if(!found){
%>
<p class="bms-page-sub">No theatres available.</p>
<%
}
%>

</div>

</body>
</html>