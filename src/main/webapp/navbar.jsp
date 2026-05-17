<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%
String selectedCity = (String) session.getAttribute("city");
if(selectedCity == null){
    selectedCity = "Bangalore";
}
%>
<div class="bms-header">
    <div class="bms-header-top">
        <a href="index.jsp" class="bms-logo">book<span>my</span>show</a>
        <div class="bms-search-wrap">
            <form id="bms-search-form" action="index.jsp" method="get" class="bms-search-form">
                <label class="bms-search" for="bms-global-search">
                    <span aria-hidden="true">&#128269;</span>
                    <input id="bms-global-search" name="q" type="search" placeholder="Search for Movies, Events, Plays, Sports and Activities" autocomplete="off" />
                </label>
            </form>
        </div>
        <div class="bms-header-actions">
            <div class="bms-location">
                <span aria-hidden="true">&#128205;</span>
                <%= selectedCity %>
                <a href="city.jsp">Change</a>
            </div>
            <a href="login.jsp" class="bms-btn bms-btn-primary">Sign in</a>
            <button type="button" class="bms-icon-btn" aria-label="Menu" id="bms-menu-btn" aria-expanded="false" aria-controls="bms-menu-panel">&#9776;</button>
            <div id="bms-menu-panel" class="bms-menu-panel" role="menu" aria-hidden="true" style="display:none;">
                <a href="index.jsp" role="menuitem">Home</a>
                <a href="history.jsp" role="menuitem">My Bookings</a>
                <a href="city.jsp" role="menuitem">Change City</a>
                <a href="login.jsp" role="menuitem">Login</a>
                <a href="register.jsp" role="menuitem">Register</a>
            </div>
        </div>
    </div>
    <nav class="bms-subnav" aria-label="Categories">
        <div>
            <a href="index.jsp">Movies</a>
            <a href="stream.jsp">Stream</a>
            <a href="events.jsp">Events</a>
            <a href="plays.jsp">Plays</a>
            <a href="sports.jsp">Sports</a>
            <a href="activities.jsp">Activities</a>
        </div>
        <div class="bms-subnav-right">
            <a href="history.jsp">My Bookings</a>
            <a href="index.jsp">ListYourShow</a>
            <a href="corporates.jsp">Corporates</a>
            <a href="offers.jsp">Offers</a>
            <a href="scratchCard.jsp">Gift Cards</a>
        </div>
    </nav>
</div>
<script>
(function () {
    var menuBtn = document.getElementById("bms-menu-btn");
    var menuPanel = document.getElementById("bms-menu-panel");
    var searchInput = document.getElementById("bms-global-search");
    var searchForm = document.getElementById("bms-search-form");

    function setMenu(open) {
        if (!menuBtn || !menuPanel) return;
        menuBtn.setAttribute("aria-expanded", String(open));
        menuPanel.setAttribute("aria-hidden", String(!open));
        menuPanel.classList.toggle("is-open", open);
        menuPanel.style.display = open ? "block" : "none";
    }

    if (menuBtn && menuPanel) {
        menuBtn.addEventListener("click", function () {
            var isOpen = menuBtn.getAttribute("aria-expanded") === "true";
            setMenu(!isOpen);
        });

        document.addEventListener("click", function (event) {
            if (!menuPanel.contains(event.target) && !menuBtn.contains(event.target)) {
                setMenu(false);
            }
        });
    }

    if (searchInput && searchForm) {
        var params = new URLSearchParams(window.location.search);
        var currentQ = params.get("q");
        if (currentQ) {
            searchInput.value = currentQ;
        }

        searchForm.addEventListener("submit", function (event) {
            var query = searchInput.value.trim();
            
            var page = window.location.pathname.split('/').pop();
            var isIndex = page === "" || page === "index.jsp";
            
            if (!isIndex) {
                return;
            }

            event.preventDefault();

            var nextParams = new URLSearchParams(window.location.search);
            if (query) nextParams.set("q", query);
            else nextParams.delete("q");

            var nextUrl = window.location.pathname + (nextParams.toString() ? "?" + nextParams.toString() : "");
            window.history.replaceState({}, "", nextUrl);

            var searchEvent = new CustomEvent("bms-search", { detail: { query: query } });
            window.dispatchEvent(searchEvent);
        });
    }

    Array.prototype.forEach.call(document.querySelectorAll(".bms-card img"), function (img) {
        if (!img.getAttribute("data-fallback-bound")) {
            img.setAttribute("data-fallback-bound", "true");
            img.addEventListener("error", function () {
                img.src = "images/default-card.svg";
            });
        }
    });
})();
</script>
