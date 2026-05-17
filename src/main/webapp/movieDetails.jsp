<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Movie Details</title>
    <link rel="stylesheet" href="css/bms-theme.css" />
</head>

<body class="bms-body">
<jsp:include page="navbar.jsp" />


<%
    String movie = request.getParameter("name");
    if (movie == null) movie = "";
%>
<div class="bms-detail-hero">
    <div class="bms-detail-inner">
        <div class="bms-detail-poster">
            <img src="https://via.placeholder.com/300x450/1a1a1a/ffffff?text=Poster" alt="" />
        </div>
        <div>
            <h1 class="bms-detail-title"><%= movie %></h1>
            <div class="bms-engage">
                <span>&#128077; <strong>Book on BookMyShow</strong> &middot; Easy cancellations on select venues</span>
            </div>
            <p class="bms-meta-line">2h 15m &middot; Drama, Action &middot; U/A &middot; In cinemas now</p>
            <div class="bms-pill-row">
                <span class="bms-pill">2D</span>
                <span class="bms-pill">Multiple languages</span>
            </div>
            <a href="selectSeats.jsp?name=<%= request.getParameter("name") != null ? request.getParameter("name") : "" %>">
                <button type="button" class="bms-cta-lg">Book tickets</button>
            </a>
        </div>
    </div>
</div>

<div class="bms-about">
    <h2>About the movie</h2>
    <p style="color:var(--text-muted); line-height:1.6; margin:0;">Show timings: 10 AM | 2 PM | 6 PM. Select your preferred show when you pick seats.</p>
</div>
</body>
</html>
