<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.nio.charset.StandardCharsets" %>
<%@ page import="java.sql.*,java.util.*,com.bms.dao.DBConnection" %>
<%
String movie = request.getParameter("movie");
String theatre = request.getParameter("theatre");
String city = (String) session.getAttribute("city");
String rating = request.getParameter("rating");
String desc = request.getParameter("desc");
String img = request.getParameter("img");
String cast = request.getParameter("cast");

/* FALLBACK FROM SESSION */
if(rating == null || rating.trim().isEmpty()){
    rating = (String) session.getAttribute("rating");
}

if(desc == null || desc.trim().isEmpty()){
    desc = (String) session.getAttribute("desc");
}

if(img == null || img.trim().isEmpty()){
    img = (String) session.getAttribute("img");
}

if(cast == null || cast.trim().isEmpty()){
    cast = (String) session.getAttribute("cast");
}
Set<String> bookedSeats = new HashSet<>();

try{

    Connection con = DBConnection.getConnection();

    PreparedStatement ps = con.prepareStatement(

        "SELECT seats FROM bookings " +
        "WHERE movie_name=? AND theatre=?"
    );

    ps.setString(1, movie);
    ps.setString(2, theatre);

    ResultSet rs = ps.executeQuery();

    while(rs.next()){

        String seatData = rs.getString("seats");

        if(seatData != null){

            String[] arr = seatData.split(",");

            for(String s : arr){

                bookedSeats.add(s.trim());
            }
        }
    }

}catch(Exception e){

    e.printStackTrace();
}

// MOCK DATA for visual testing: always show some seats as booked
bookedSeats.add("5");
bookedSeats.add("6");
bookedSeats.add("15");
bookedSeats.add("22");
bookedSeats.add("23");
bookedSeats.add("24");


List<Integer> sortedBooked = new ArrayList<>();
for(String s : bookedSeats){
    if(!s.trim().isEmpty()) {
        try {
            sortedBooked.add(Integer.parseInt(s.trim()));
        } catch(NumberFormatException e) {}
    }
}
Collections.sort(sortedBooked);
List<String> bookedDisplay = new ArrayList<>();
for(Integer i : sortedBooked) bookedDisplay.add(String.valueOf(i));

List<String> availableDisplay = new ArrayList<>();
for(int i=1; i<=40; i++){
    if(!bookedSeats.contains(String.valueOf(i))){
        availableDisplay.add(String.valueOf(i));
    }
}
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Select Seats</title>
<link rel="stylesheet" href="css/bms-theme.css" />
<style>
/* Enhanced Cinema Seat Selection UI */
.bms-seat-stage {
    background: #111827;
    border-radius: 24px;
    padding: 50px 30px;
    box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.25);
    margin-top: 40px;
}
.seat.bms-seat.taken{
    background: #cbd5e1 !important;
    color: #64748b !important;
    cursor: not-allowed;
    pointer-events: none;
    opacity: 0.7;
    box-shadow: none !important;
    transform: none !important;
}
.bms-screen-bar {
    background: linear-gradient(180deg, #f8fafc 0%, #cbd5e1 100%);
    box-shadow: 0 15px 35px -5px rgba(255, 255, 255, 0.4);
    transform: perspective(300px) rotateX(-5deg);
    border-radius: 50% 50% 0 0 / 20px 20px 0 0;
    color: #475569;
    margin-bottom: 60px;
    font-size: 0.9rem;
    letter-spacing: 0.4em;
    height: 40px;
    display: flex;
    align-items: center;
    justify-content: center;
}
.bms-tier-label {
    color: #94a3b8;
    text-align: center;
    margin-bottom: 24px;
    font-size: 0.85rem;
    letter-spacing: 0.1em;
}
.seat-container.bms-seat-grid {
    gap: 16px;
    margin-bottom: 40px;
}
.seat.bms-seat {
    background: #334155;
    border: none;
    border-radius: 12px 12px 4px 4px;
    box-shadow: inset 0 -6px 0 rgba(0,0,0,0.3);
    color: #94a3b8;
    transition: all 0.3s cubic-bezier(0.34, 1.56, 0.64, 1);
    font-size: 0.75rem;
}
.seat.bms-seat:hover {
    background: #f84464;
    color: white;
    transform: translateY(-6px) scale(1.1);
    box-shadow: 0 10px 20px rgba(248, 68, 100, 0.4), inset 0 -6px 0 rgba(0,0,0,0.2);
}
.seat.bms-seat.selected {
    background: #10b981 !important;
    box-shadow: 0 10px 20px rgba(16, 185, 129, 0.4), inset 0 -6px 0 rgba(0,0,0,0.2) !important;
    color: white !important;
    transform: translateY(-6px) scale(1.1);
}
.bms-seat-legend {
    color: #cbd5e1;
    margin-top: 20px;
    border-top: 1px solid #334155;
    padding-top: 30px;
}
.bms-swatch {
    border: none;
    box-shadow: inset 0 -4px 0 rgba(0,0,0,0.3);
    border-radius: 6px 6px 3px 3px;
    background: #334155;
    width: 24px;
    height: 24px;
}
.bms-swatch.sel {
    background: #10b981;
}
.bms-swatch[style*="background:#e0e0e0"] {
    background: #475569 !important;
}
</style>
<script>
let selectedSeats = [];

function selectSeat(seat, element){

    if(selectedSeats.includes(seat)){
        selectedSeats = selectedSeats.filter(s => s !== seat);
        element.classList.remove("selected");
    } else {
        selectedSeats.push(seat);
        element.classList.add("selected");
    }

    document.getElementById("seatsInput").value = selectedSeats.join(",");
    document.getElementById("seatDisplay").innerText =
        selectedSeats.length ? selectedSeats.join(", ") : "None";
}

function validateSeats(){
    if(selectedSeats.length === 0){
        alert("Please select seats!");
        return false;
    }
    return true;
}
</script>
</head>

<body class="bms-body">

<jsp:include page="navbar.jsp" />

<div class="bms-seat-header">
    <a class="back" href="theatres.jsp?movie=<%= URLEncoder.encode(movie, StandardCharsets.UTF_8) %>">&larr; Back</a>
    <div class="bms-seat-title">
    
        <strong><%= movie %> (pick seats)</strong>
        <span><%= theatre %> &middot; <%= city %> &middot; Today &middot; Matinee</span>
    </div>
    <div class="bms-pills">
        <button type="button" class="bms-pill-btn is-on">12:30 PM 2D</button>
        <button type="button" class="bms-pill-btn">03:15 PM</button>
        <button type="button" class="bms-pill-btn">06:45 PM</button>
    </div>
</div>

<form action="payment.jsp" method="get" onsubmit="return validateSeats()">

<div class="bms-seat-stage">

<div style="background: #1e293b; padding: 16px 20px; border-radius: 12px; margin-bottom: 30px; font-size: 0.95rem; border: 1px solid #334155; line-height: 1.5;">
    <p style="margin: 0 0 12px; color: #cbd5e1;">
        <strong style="color: #94a3b8; letter-spacing: 0.05em; text-transform: uppercase; font-size: 0.8rem; display: block; margin-bottom: 4px;">Already Booked Seats</strong>
        <span style="color:#f84464; font-weight: 600; word-break: break-word;"><%= bookedDisplay.isEmpty() ? "None" : String.join(", ", bookedDisplay) %></span>
    </p>
    <p style="margin: 0; color: #cbd5e1;">
        <strong style="color: #94a3b8; letter-spacing: 0.05em; text-transform: uppercase; font-size: 0.8rem; display: block; margin-bottom: 4px;">Available Seats</strong>
        <span style="color:#10b981; font-weight: 600; word-break: break-word;"><%= availableDisplay.isEmpty() ? "None" : String.join(", ", availableDisplay) %></span>
    </p>
</div>

<div class="bms-screen-bar">SCREEN THIS WAY</div>

<div class="bms-tier">
    <div class="bms-tier-label">&#8377;200 &middot; PREMIUM ROWS</div>
    <div class="seat-container bms-seat-grid">
<%
for(int i=1;i<=20;i++){

boolean isBooked =
    bookedSeats.contains(String.valueOf(i));
%>
        <div class="seat bms-seat <%= isBooked ? "taken" : "" %>"

<%= isBooked
? ""
: "onclick=\"selectSeat('" + i + "', this)\""
%>>

<%= i %>

</div>
<%
}
%>
    </div>
</div>

<div class="bms-tier">
    <div class="bms-tier-label">&#8377;150 &middot; CLASSIC ROWS</div>
    <div class="seat-container bms-seat-grid">
<%
for(int i=21;i<=40;i++){

boolean isBooked =
    bookedSeats.contains(String.valueOf(i));
%>
       <div class="seat bms-seat <%= isBooked ? "taken" : "" %>"

<%= isBooked
? ""
: "onclick=\"selectSeat('" + i + "', this)\""
%>>

<%= i %>

</div>
<%
}
%>
    </div>
</div>

<input type="hidden" name="movie" value="<%= movie %>">
<input type="hidden" name="theatre" value="<%= theatre %>">
<input type="hidden" id="seatsInput" name="seats">

<input type="hidden" name="rating" value="<%= rating %>">
<input type="hidden" name="desc" value="<%= desc %>">
<input type="hidden" name="img" value="<%= img %>">
<input type="hidden" name="cast" value="<%= cast %>">


<div class="bms-seat-legend">
    <span><span class="bms-swatch"></span> Available</span>
    <span><span class="bms-swatch sel"></span> Selected</span>
    <span><span class="bms-swatch" style="border-color:#bbb;background:#e0e0e0;"></span> Taken</span>
</div>

<div class="bms-submit-bar">
    <p style="margin:0 0 12px; color:var(--text-muted);">Selected seats: <strong id="seatDisplay" style="color:var(--text);">None</strong></p>
    <button type="submit" class="bms-btn bms-btn-primary" style="padding:12px 32px;">Proceed to payment</button>
</div>


</div>

</form>

</body>
</html>
