<%@ page import="java.sql.*,com.bms.dao.DBConnection" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Activities | BookMyShow</title>
<link rel="stylesheet" href="css/bms-theme.css">
</head>


<body class="bms-body">

<jsp:include page="navbar.jsp" />

<h1 class="bms-page-title">Activities</h1>

<p class="bms-page-sub">
Discover fun experiences around you
</p>

<div class="bms-movie-grid" id="bms-card-grid">

<%
Connection con = DBConnection.getConnection();

PreparedStatement ps =
con.prepareStatement("SELECT * FROM activities");

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

    <img src="<%= image %>" alt="">

    <div class="bms-card-body">

        <h3><%= movie %></h3>

        <div class="bms-rating">
            &#9733; <%= rating %>
        </div>

        <p class="bms-card-meta">
            <%= desc %>
        </p>

        <p class="bms-card-meta">
            <%= timing %>
        </p>

        <button type="submit" class="bms-book-btn">
            Explore
        </button>

    </div>

</div>

</form>

<%
}
%>

</div>

<p id="bms-empty-state"
class="bms-empty-state"
style="display:none;">
No items found.
</p>

<script>
(function () {

    var params =
        new URLSearchParams(window.location.search);

    var initialQ =
        (params.get("q") || "")
        .toLowerCase()
        .trim();

    var cards =
        Array.from(
            document.querySelectorAll(".bms-card")
        );

    var empty =
        document.getElementById("bms-empty-state");

    function applyFilter(q) {

        var count = 0;

        cards.forEach(function (card) {

            var text =
                card.innerText.toLowerCase();

            var show =
                !q || text.includes(q);

            card.style.display =
                show ? "block" : "none";

            if(show) count++;
        });

        empty.style.display =
            count === 0 ? "block" : "none";
    }

    applyFilter(initialQ);

    window.addEventListener(
        "bms-search",
        function (e) {

            applyFilter(
                (e.detail.query || "")
                .toLowerCase()
            );
        }
    );

})();
</script>

</body>
</html>