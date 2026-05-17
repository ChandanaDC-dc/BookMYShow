<%@ page import="java.sql.*,com.bms.dao.DBConnection" %>
<%@ page import="java.util.*,com.bms.dao.MovieDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%
List<Map<String, String>> movies = MovieDAO.getAllMovies();
String[][] streamItems = {
    {"Retro", "Crime Thriller Series", "8.4", "New episode every Friday", "https://via.placeholder.com/400x600/222/ffffff?text=Retro+Series"},
    {"Campus Beats", "Youth Drama", "7.8", "Watch latest season", "https://via.placeholder.com/400x600/4a148c/ffffff?text=Campus+Beats"},
    {"Laugh Lounge", "Stand-up Specials", "8.9", "Top-rated stream picks", "https://via.placeholder.com/400x600/006064/ffffff?text=Laugh+Lounge"},
    {"Night Files", "Mystery", "8.1", "Binge-worthy thriller", "https://via.placeholder.com/400x600/263238/ffffff?text=Night+Files"}
};
String[][] eventItems = {
    {"Moonlit Music Fest", "Live music | Whitefield", "4.6/5", "Sat, 6 PM onwards", "https://via.placeholder.com/400x600/1a237e/ffffff?text=Music+Fest"},
    {"Tech Innovators Expo", "Convention | Koramangala", "4.4/5", "Sun, 10 AM onwards", "https://via.placeholder.com/400x600/0d47a1/ffffff?text=Tech+Expo"},
    {"Food Carnival", "Festival | Indiranagar", "4.7/5", "All weekend", "https://via.placeholder.com/400x600/b71c1c/ffffff?text=Food+Carnival"},
    {"Comedy Night Live", "Arena show | MG Road", "4.5/5", "Fri, 8 PM", "https://via.placeholder.com/400x600/4e342e/ffffff?text=Comedy+Night"}
};
String[][] playItems = {
    {"Andha Yug", "Classic stage drama", "4.8/5", "Today, 7 PM", "https://via.placeholder.com/400x600/311b92/ffffff?text=Andha+Yug"},
    {"The Last Letter", "Emotional theatre play", "4.6/5", "Sat, 6:30 PM", "https://via.placeholder.com/400x600/6a1b9a/ffffff?text=The+Last+Letter"},
    {"Detective Files", "Mystery comedy play", "4.5/5", "Sun, 5 PM", "https://via.placeholder.com/400x600/283593/ffffff?text=Detective+Files"},
    {"Dreams in Monsoon", "Romantic stage play", "4.4/5", "Fri, 7:30 PM", "https://via.placeholder.com/400x600/4527a0/ffffff?text=Dreams+in+Monsoon"}
};
String[][] sportsItems = {
    {"Bengaluru Bulls vs Tigers", "Kabaddi | Kanteerava", "4.7/5", "Tonight, 8 PM", "https://via.placeholder.com/400x600/1b5e20/ffffff?text=Kabaddi+Match"},
    {"City Marathon 2026", "Running event", "4.8/5", "Sun, 5 AM", "https://via.placeholder.com/400x600/2e7d32/ffffff?text=City+Marathon"},
    {"Street Cricket League", "Local tournament", "4.3/5", "Weekend", "https://via.placeholder.com/400x600/33691e/ffffff?text=Cricket+League"},
    {"Table Tennis Open", "Indoor sports", "4.2/5", "Sat, 11 AM", "https://via.placeholder.com/400x600/558b2f/ffffff?text=TT+Open"}
};
String[][] activityItems = {
    {"Pottery Workshop", "Hands-on studio class", "4.8/5", "Sat, 3 PM", "https://via.placeholder.com/400x600/bf360c/ffffff?text=Pottery+Workshop"},
    {"Photography Walk", "Outdoor experience", "4.6/5", "Sun, 6 AM", "https://via.placeholder.com/400x600/e65100/ffffff?text=Photo+Walk"},
    {"Board Game Meetup", "Social games evening", "4.5/5", "Fri, 7 PM", "https://via.placeholder.com/400x600/f57f17/ffffff?text=Board+Game+Meetup"},
    {"Cooking Masterclass", "Chef-led session", "4.7/5", "Sat, 4 PM", "https://via.placeholder.com/400x600/ff6f00/ffffff?text=Cooking+Class"}
};
%>
<%
String city = (String) session.getAttribute("city");

if(city == null){
    city = "Bangalore";
    session.setAttribute("city", city);
}
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>BookMyShow</title>
    <link rel="stylesheet" href="css/bms-theme.css" />
<style>
/* Un-compress the layout */
.bms-hero {
    max-width: 100% !important;
    padding: 0 !important;
    margin: 0 0 40px !important;
    background: #f1f5f9;
}
.bms-hero-banner {
    border-radius: 0 !important;
    min-height: 400px !important;
    display: flex;
    align-items: center;
    justify-content: center;
    text-align: center;
    background: url('https://in.bmscdn.com/promotions/cms/creatives/1714470395759_parsecbengaluruweb.jpg') no-repeat center center / cover !important;
    position: relative;
}
.bms-hero-banner::after {
    content: '';
    position: absolute;
    inset: 0;
    background: linear-gradient(0deg, rgba(0,0,0,0.6) 0%, rgba(0,0,0,0.1) 100%);
}
.bms-hero-content {
    position: relative;
    z-index: 1;
    max-width: 800px;
    padding: 20px;
}
.bms-hero-title {
    font-size: 3.5rem !important;
    text-shadow: 0 4px 10px rgba(0,0,0,0.5);
    margin-bottom: 16px !important;
    color: white !important;
}
.bms-hero-sub {
    font-size: 1.2rem !important;
    color: white !important;
    opacity: 0.9 !important;
    text-shadow: 0 2px 5px rgba(0,0,0,0.5);
}
.bms-hero-kicker {
    color: #ffeb3b !important;
    font-weight: bold;
}
.bms-section-head {
    max-width: 1400px !important;
}
.bms-movie-grid {
    max-width: 1400px !important;
    gap: 24px !important;
    grid-template-columns: repeat(auto-fill, minmax(220px, 1fr)) !important;
}
.bms-card {
    border-radius: 16px !important;
    border: none !important;
    box-shadow: 0 10px 20px rgba(0,0,0,0.05) !important;
}
.bms-card img {
    border-radius: 16px 16px 0 0;
}
</style>
</head>

<body class="bms-body">

<jsp:include page="navbar.jsp" />

<!-- <section class="bms-hero">
    <div class="bms-hero-banner">
        <div class="bms-hero-content">
            <p class="bms-hero-kicker">Now booking</p>
            <h1 class="bms-hero-title">Live entertainment, your city</h1>
            <p class="bms-hero-sub">Pick a film, choose a showtime, and book seats in a few taps.</p>
        </div>
    </div>
</section> -->
<style>
/* Slider CSS */
.bms-slider-container {
    width: 100%;
    max-width: 100% !important;
    padding: 0 !important;
    margin: 0 0 40px !important;
    position: relative;
    overflow: hidden;
    height: 400px;
    background: #f1f5f9;
}
.bms-slides {
    display: flex;
    width: 300%;
    height: 100%;
    transition: transform 0.5s ease-in-out;
}
.bms-slide {
    width: 33.333%;
    height: 100%;
    background-size: cover !important;
    background-position: center !important;
    position: relative;
}
.bms-slide-btn {
    position: absolute;
    top: 50%;
    transform: translateY(-50%);
    background: rgba(0,0,0,0.4);
    color: white;
    border: none;
    padding: 16px 20px;
    font-size: 1.5rem;
    cursor: pointer;
    border-radius: 8px;
    z-index: 10;
    transition: background 0.3s;
}
.bms-slide-btn:hover {
    background: rgba(0,0,0,0.8);
}
.bms-prev { left: 20px; }
.bms-next { right: 20px; }
.bms-dots {
    position: absolute;
    bottom: 20px;
    left: 50%;
    transform: translateX(-50%);
    display: flex;
    gap: 8px;
    z-index: 10;
}
.bms-dot {
    width: 10px;
    height: 10px;
    background: rgba(255,255,255,0.4);
    border-radius: 50%;
    cursor: pointer;
    transition: background 0.3s;
}
.bms-dot.active {
    background: white;
}
</style>

<div class="bms-slider-container">
    <div class="bms-slides" id="bms-slides">
        <!-- Slide 1 -->
        <div class="bms-slide" style="background: linear-gradient(90deg, rgba(30,58,138,0.95) 0%, rgba(30,58,138,0) 100%), url('https://in.bmscdn.com/promotions/cms/creatives/1714470395759_parsecbengaluruweb.jpg');">
            <div class="bms-hero-content" style="position:absolute; top:50%; left:60px; transform:translateY(-50%); text-align:left; max-width:500px;">
                <span style="background: #f84464; color: white; padding: 4px 12px; border-radius: 4px; font-weight: 700; font-size: 0.9rem; text-transform: uppercase; letter-spacing: 1px;">Trending</span>
                <h1 class="bms-hero-title" style="margin: 16px 0; font-size: 3.5rem; text-shadow: 0 4px 10px rgba(0,0,0,0.8); color: white; line-height: 1.1;">ParSEC Museum</h1>
                <p style="color: #cbd5e1; font-size: 1.2rem; margin-bottom: 24px; text-shadow: 0 2px 5px rgba(0,0,0,0.8);">Science you can actually touch! 100+ exhibits and immersive fun.</p>
                <a href="#" class="bms-btn" style="background: white; color: #0f172a; padding: 12px 28px; font-weight: 700; border-radius: 8px; text-decoration: none; border: none; display: inline-block;">Book Now</a>
            </div>
        </div>
        <!-- Slide 2 -->
        <div class="bms-slide" style="background: linear-gradient(90deg, rgba(6,78,59,0.95) 0%, rgba(6,78,59,0) 100%), url('https://images.unsplash.com/photo-1540039155732-d68a9f4fb8e9?ixlib=rb-4.0.3&auto=format&fit=crop&w=2000&q=80');">
            <div class="bms-hero-content" style="position:absolute; top:50%; left:60px; transform:translateY(-50%); text-align:left; max-width:500px;">
                <span style="background: #10b981; color: white; padding: 4px 12px; border-radius: 4px; font-weight: 700; font-size: 0.9rem; text-transform: uppercase; letter-spacing: 1px;">Live Music</span>
                <h1 class="bms-hero-title" style="margin: 16px 0; font-size: 3.5rem; text-shadow: 0 4px 10px rgba(0,0,0,0.8); color: white; line-height: 1.1;">Epic Performances</h1>
                <p style="color: #cbd5e1; font-size: 1.2rem; margin-bottom: 24px; text-shadow: 0 2px 5px rgba(0,0,0,0.8);">Experience the magic of live music festivals happening near you.</p>
                <a href="#" class="bms-btn" style="background: #f84464; color: white; padding: 12px 28px; font-weight: 700; border-radius: 8px; text-decoration: none; border: none; display: inline-block;">Get Tickets</a>
            </div>
        </div>
        <!-- Slide 3 -->
        <div class="bms-slide" style="background: linear-gradient(90deg, rgba(88,28,135,0.95) 0%, rgba(88,28,135,0) 100%), url('https://images.unsplash.com/photo-1440404653325-ab127d49abc1?ixlib=rb-4.0.3&auto=format&fit=crop&w=2000&q=80');">
            <div class="bms-hero-content" style="position:absolute; top:50%; left:60px; transform:translateY(-50%); text-align:left; max-width:500px;">
                <span style="background: #8b5cf6; color: white; padding: 4px 12px; border-radius: 4px; font-weight: 700; font-size: 0.9rem; text-transform: uppercase; letter-spacing: 1px;">Comedy</span>
                <h1 class="bms-hero-title" style="margin: 16px 0; font-size: 3.5rem; text-shadow: 0 4px 10px rgba(0,0,0,0.8); color: white; line-height: 1.1;">Stand-up Nights</h1>
                <p style="color: #cbd5e1; font-size: 1.2rem; margin-bottom: 24px; text-shadow: 0 2px 5px rgba(0,0,0,0.8);">Laugh out loud with the best comedians in the country.</p>
                <a href="#" class="bms-btn" style="background: white; color: #0f172a; padding: 12px 28px; font-weight: 700; border-radius: 8px; text-decoration: none; border: none; display: inline-block;">Explore Shows</a>
            </div>
        </div>
    </div>
    <button class="bms-slide-btn bms-prev" onclick="moveSlide(-1)">&#10094;</button>
    <button class="bms-slide-btn bms-next" onclick="moveSlide(1)">&#10095;</button>
    <div class="bms-dots">
        <div class="bms-dot active" onclick="setSlide(0)"></div>
        <div class="bms-dot" onclick="setSlide(1)"></div>
        <div class="bms-dot" onclick="setSlide(2)"></div>
    </div>
</div>

<script>
let currentSlide = 0;
const totalSlides = 3;
function moveSlide(dir) {
    currentSlide = (currentSlide + dir + totalSlides) % totalSlides;
    updateSlider();
}
function setSlide(index) {
    currentSlide = index;
    updateSlider();
}
function updateSlider() {
    document.getElementById('bms-slides').style.transform = `translateX(-${currentSlide * 33.333}%)`;
    const dots = document.querySelectorAll('.bms-dot');
    dots.forEach((dot, index) => {
        dot.className = index === currentSlide ? 'bms-dot active' : 'bms-dot';
    });
}
setInterval(() => moveSlide(1), 5000);
</script>

<div class="bms-section-head">
    <h2 id="bms-section-title">Recommended Movies</h2>
    <a class="bms-link-red" href="index.jsp">See all &gt;</a>
</div>

<div class="bms-movie-grid" id="bms-movie-grid">

<%
for(Map<String, String> m : movies){
%>

<div class="bms-card" data-section="movies">

    <img src="<%= m.get("image") != null ? m.get("image") : "images/default-movie.svg" %>" alt="" />

    <div class="bms-card-body">
        <h3><%= m.get("name") %></h3>

        <div class="bms-rating">
            &#9733; <%= m.get("rating") != null ? m.get("rating") : "N/A" %>
        </div>

        <p class="bms-card-meta">
            <%= m.get("cast") != null ? m.get("cast") : "" %>
        </p>

        <p class="bms-card-meta">
            <%= m.get("description") != null ? m.get("description") : "" %>
        </p>

        <p class="bms-card-meta">&#128339; <%= m.get("timing") %></p>

      <a href="theatres.jsp?movie=<%= m.get("name") %>">
            <button type="button" class="bms-book-btn">Book tickets</button>
        </a>
    </div>

</div>

<%
}
%>

<%
for (String[] item : streamItems) {
%>
<div class="bms-card" data-section="stream">
    <img src="<%= item[4] %>" alt="" />
    <div class="bms-card-body">
        <h3><%= item[0] %></h3>
        <div class="bms-rating">&#9733; <%= item[2] %></div>
        <p class="bms-card-meta"><%= item[1] %></p>
        <p class="bms-card-meta"><%= item[3] %></p>
        <button type="button" class="bms-book-btn">Watch now</button>
    </div>
</div>
<%
}
for (String[] item : eventItems) {
%>
<div class="bms-card" data-section="events">
    <img src="<%= item[4] %>" alt="" />
    <div class="bms-card-body">
        <h3><%= item[0] %></h3>
        <div class="bms-rating">&#9733; <%= item[2] %></div>
        <p class="bms-card-meta"><%= item[1] %></p>
        <p class="bms-card-meta"><%= item[3] %></p>
        <button type="button" class="bms-book-btn">Book event</button>
    </div>
</div>
<%
}
for (String[] item : playItems) {
%>
<div class="bms-card" data-section="plays">
    <img src="<%= item[4] %>" alt="" />
    <div class="bms-card-body">
        <h3><%= item[0] %></h3>
        <div class="bms-rating">&#9733; <%= item[2] %></div>
        <p class="bms-card-meta"><%= item[1] %></p>
        <p class="bms-card-meta"><%= item[3] %></p>
        <button type="button" class="bms-book-btn">Book play</button>
    </div>
</div>
<%
}
for (String[] item : sportsItems) {
%>
<div class="bms-card" data-section="sports">
    <img src="<%= item[4] %>" alt="" />
    <div class="bms-card-body">
        <h3><%= item[0] %></h3>
        <div class="bms-rating">&#9733; <%= item[2] %></div>
        <p class="bms-card-meta"><%= item[1] %></p>
        <p class="bms-card-meta"><%= item[3] %></p>
        <button type="button" class="bms-book-btn">Book sports</button>
    </div>
</div>
<%
}
for (String[] item : activityItems) {
%>
<div class="bms-card" data-section="activities">
    <img src="<%= item[4] %>" alt="" />
    <div class="bms-card-body">
        <h3><%= item[0] %></h3>
        <div class="bms-rating">&#9733; <%= item[2] %></div>
        <p class="bms-card-meta"><%= item[1] %></p>
        <p class="bms-card-meta"><%= item[3] %></p>
        <button type="button" class="bms-book-btn">Explore</button>
    </div>
</div>
<%
}
%>

</div>

<p id="bms-empty-state" class="bms-empty-state" style="display:none;">No items found for your search/filter.</p>

<script>
(function () {
    var params = new URLSearchParams(window.location.search);
    var currentSection = (params.get("section") || "movies").toLowerCase();
    var searchQuery = (params.get("q") || "").trim().toLowerCase();
    var cards = Array.prototype.slice.call(document.querySelectorAll("#bms-movie-grid .bms-card"));
    var title = document.getElementById("bms-section-title");
    var empty = document.getElementById("bms-empty-state");
    var sectionMap = {
        movies: "Recommended Movies",
        stream: "Trending On Stream",
        events: "Popular Events",
        plays: "Popular Plays",
        sports: "Sports Events",
        activities: "Activities"
    };

    if (!sectionMap[currentSection]) currentSection = "movies";
    if (title) title.textContent = sectionMap[currentSection];

    var visibleCount = 0;
    cards.forEach(function (card) {
        var cardSection = card.getAttribute("data-section") || "movies";
        var searchable = (card.innerText || "").toLowerCase();
        var matchesSection = cardSection === currentSection;
        var matchesSearch = !searchQuery || searchable.indexOf(searchQuery) !== -1;
        var show = matchesSection && matchesSearch;
        card.classList.toggle("is-hidden", !show);
        if (show) visibleCount++;
    });

    if (empty) {
        empty.style.display = visibleCount === 0 ? "block" : "none";
    }

    window.addEventListener("bms-search", function (event) {
        var q = (event.detail && event.detail.query ? event.detail.query : "").toLowerCase().trim();
        var count = 0;
        cards.forEach(function (card) {
            var cardSection = card.getAttribute("data-section") || "movies";
            var searchable = (card.innerText || "").toLowerCase();
            var show = cardSection === currentSection && (!q || searchable.indexOf(q) !== -1);
            card.classList.toggle("is-hidden", !show);
            if (show) count++;
        });
        if (empty) empty.style.display = count === 0 ? "block" : "none";
        if (title) title.textContent = "Search Results";
    });
})();
</script>
<footer class="bms-footer" style="background: var(--bg); border-top: 1px solid var(--border); padding: 40px 24px; margin-top: 40px; text-align: center; color: var(--text-muted); font-size: 0.9rem;">
    <div style="max-width: 1280px; margin: 0 auto; display: flex; flex-direction: column; align-items: center; gap: 16px;">
        <div style="font-size: 1.5rem; font-weight: 800; color: var(--text);">
            book<span style="color: var(--bms-red);">my</span>show
        </div>
        <div style="display: flex; gap: 24px; flex-wrap: wrap; justify-content: center;">
            <a href="#" style="text-decoration: none; color: inherit; transition: color 0.2s;">About Us</a>
            <a href="#" style="text-decoration: none; color: inherit; transition: color 0.2s;">Contact Us</a>
            <a href="#" style="text-decoration: none; color: inherit; transition: color 0.2s;">Terms of Use</a>
            <a href="#" style="text-decoration: none; color: inherit; transition: color 0.2s;">Privacy Policy</a>
        </div>
        <div style="margin-top: 16px; font-size: 0.8rem; opacity: 0.8;">
            &copy; 2026 BookMyShow App. All rights reserved.
        </div>
    </div>
</footer>

</body>
</html>
