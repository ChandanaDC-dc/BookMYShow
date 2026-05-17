<%@ page import="java.sql.*,com.bms.dao.DBConnection" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
<title>Stream</title>
<link rel="stylesheet" href="css/bms-theme.css" />
</head>

<body class="bms-body">

<jsp:include page="navbar.jsp" />

<h1 class="bms-page-title">Trending on Stream</h1>

<div class="bms-movie-grid">

<%
Connection con = DBConnection.getConnection();

PreparedStatement ps =
con.prepareStatement("SELECT * FROM stream_movies");

ResultSet rs = ps.executeQuery();

while(rs.next()){

    String movie = rs.getString("name");
    String desc = rs.getString("description");
    String rating = rs.getString("rating");
    String tagline = rs.getString("tagline");
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

    <img src="<%= image %>" />

    <div class="bms-card-body">

        <h3><%= movie %></h3>

        <div class="bms-rating">
            ⭐ <%= rating %>
        </div>

        <p><%= desc %></p>

        <p><%= tagline %></p>

        <button class="bms-book-btn">
            Watch Now
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