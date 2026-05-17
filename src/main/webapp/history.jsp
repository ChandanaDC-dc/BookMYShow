<%@ page import="java.sql.*,javax.servlet.http.*,com.bms.dao.DBConnection" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>My Bookings</title>
    <link rel="stylesheet" href="css/bms-theme.css" />
</head>

<body class="bms-body">


<jsp:include page="navbar.jsp" />

<h1 class="bms-page-title">My booking history</h1>
<p class="bms-page-sub">Your past and upcoming shows</p>

<%
    HttpSession session1 = request.getSession(false);
    String user = (session1 != null) ? (String) session1.getAttribute("user") : null;

    if(user == null){
%>
        <p class="bms-page-sub" style="margin-top:32px;">Please <a href="login.jsp" class="bms-link-red">sign in</a> to see your bookings.</p>
<%
    } else {

        Connection con = DBConnection.getConnection();

        PreparedStatement ps = con.prepareStatement(

        		"SELECT " +
        		"b.movie_name, " +
        		"b.seats, " +
        		"b.payment_status, " +

        		"COALESCE(m.image, sm.image, e.image, p.image, s.image, a.image, b.image) AS image, " +

        		"COALESCE(m.rating, sm.rating, e.rating, p.rating, s.rating, a.rating, b.rating) AS rating, " +

        		"COALESCE(m.cast_name, sm.cast_name, e.cast_name, p.cast_name, s.cast_name, a.cast_name, b.cast_name) AS cast_name, " +

        		"COALESCE(m.description, sm.description, e.description, p.description, s.description, a.description, b.description) AS description " +

        		"FROM bookings b " +

        		"LEFT JOIN movies m ON b.movie_name = m.name " +

        		"LEFT JOIN stream_movies sm ON b.movie_name = sm.name " +

        		"LEFT JOIN events e ON b.movie_name = e.name " +

        		"LEFT JOIN plays p ON b.movie_name = p.name " +

        		"LEFT JOIN sports s ON b.movie_name = s.name " +

        		"LEFT JOIN activities a ON b.movie_name = a.name " +

        		"WHERE b.username=?"
        		);
        ps.setString(1, user);

        ResultSet rs = ps.executeQuery();
%>

<div class="bms-history-grid">

<%
        while(rs.next()){

            String movie = rs.getString("movie_name");
            String seats = rs.getString("seats");
            String status = rs.getString("payment_status");

            String image = rs.getString("image");
            String rating = rs.getString("rating");
            String cast = rs.getString("cast_name");
            String desc = rs.getString("description");

            if(movie == null) movie = "Unknown";
            if(seats == null) seats = "-";
            if(image == null) image = "images/default-movie.svg";
            if(rating == null) rating = "N/A";
            if(cast == null) cast = "Not available";
            if(desc == null) desc = "No description available";
%>

    <div class="bms-history-card">

        <img src="<%= image %>" class="poster" alt="" style="width:100%; height:200px; object-fit:cover;" />

        <div class="bms-card-body">

            <div style="font-size:1.05rem; font-weight:700; color:var(--text); margin-bottom:6px;"><%= movie %></div>

            <div class="bms-rating">&#9733; <%= rating %></div>

            <p class="bms-card-meta" style="margin:8px 0;"><b>Cast:</b> <%= cast %></p>

            <p class="bms-card-meta" style="margin:0 0 8px;"><%= desc %></p>

            <p class="bms-card-meta" style="margin:0;"><b>Seats:</b> <%= seats %></p>

            <p style="margin:10px 0 0; color:var(--green); font-weight:600; font-size:0.9rem;"><%= status %></p>

        </div>

    </div>

<%
        } // end while
%>

</div>

<%
    } // end else
%>

</body>

</html>
