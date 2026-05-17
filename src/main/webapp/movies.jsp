<%@ page import="java.util.*,com.bms.dao.MovieDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Movies</title>
    <link rel="stylesheet" href="css/bms-theme.css" />
</head>

<body class="bms-body">

<jsp:include page="navbar.jsp" />

<h1 class="bms-page-title">Now showing</h1>
<p class="bms-page-sub">All movies currently on sale</p>

<div class="bms-movie-grid" style="grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));">

<%
List<Map<String, String>> movies = MovieDAO.getAllMovies();

for(Map<String, String> m : movies){
%>

<div class="bms-card">
    <img src="<%= m.get("image") != null ? m.get("image") : "images/default-movie.svg" %>" alt="" />

    <div class="bms-card-body">
    <h3><%= m.get("name") %></h3>

    <a href="movieDetails.jsp?name=<%= m.get("name") %>">
        <button type="button" class="bms-book-btn">View &amp; book</button>
    </a>
    </div>
</div>

<% } %>

</div>

</body>

</html>
