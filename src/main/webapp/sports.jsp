<%@ page import="java.sql.*,com.bms.dao.DBConnection" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
<title>Sports</title>
<link rel="stylesheet" href="css/bms-theme.css" />
</head>

<body class="bms-body">

<jsp:include page="navbar.jsp" />

<h1 class="bms-page-title">Sports Events</h1>

<p class="bms-page-sub">
Book tickets for live sports events
</p>

<div class="bms-movie-grid">

<%
Connection con = DBConnection.getConnection();

PreparedStatement ps =
con.prepareStatement("SELECT * FROM sports");

ResultSet rs = ps.executeQuery();

while(rs.next()){

    String movie = rs.getString("name");
    String desc = rs.getString("description");
    String rating = rs.getString("rating");
    String timing = rs.getString("timing");
    String image = rs.getString("image");
    String cast = rs.getString("cast_name");
%>

<form action="theatres.jsp" method="get">

<input type="hidden" name="movie" value="<%= movie %>">

<input type="hidden" name="rating" value="<%= rating %>">

<input type="hidden" name="desc" value="<%= desc %>">

<input type="hidden" name="img" value="<%= image %>">

<input type="hidden" name="cast" value="<%= cast %>">

<div class="bms-card">

    <img src="<%= image %>" alt="" />

    <div class="bms-card-body">

        <h3><%= movie %></h3>

        <div class="bms-rating">
            ⭐ <%= rating %>
        </div>

        <p>
            <%= desc %>
        </p>

        <p>
            <%= timing %>
        </p>

        <button type="submit"
        class="bms-book-btn">

            Book Now

        </button>

    </div>

</div>

</form>

<%
}
%>

</div>

</body>
</html>