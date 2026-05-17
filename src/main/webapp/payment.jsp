<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<%
String movie = request.getParameter("movie");
String seats = request.getParameter("seats");
String theatre = request.getParameter("theatre");
String rating = request.getParameter("rating");
String desc = request.getParameter("desc");
String img = request.getParameter("img");
String cast = request.getParameter("cast");

/* FALLBACK SESSION VALUES */
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

int seatCount = seats.isEmpty() ? 0 : seats.split(",").length;
int total = seatCount * 150;
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Payment</title>
<link rel="stylesheet" href="css/bms-theme.css" />
<style>
/* Enhanced Payment UI */
.bms-pay-layout {
    background: #f8fafc;
    border-radius: 24px;
    padding: 32px;
    box-shadow: inset 0 2px 4px rgba(0,0,0,0.02);
    margin: 40px auto;
    border: 1px solid #e2e8f0;
}
.bms-pay-nav {
    background: white;
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.03);
    border: none;
    border-radius: 16px;
}
.bms-pay-nav h3 {
    background: #f1f5f9;
    color: #334155;
    font-size: 1rem;
    font-weight: 700;
}
.bms-pay-nav-item {
    padding: 16px;
    border-left: 4px solid transparent;
    transition: all 0.2s;
    cursor: pointer;
}
.bms-pay-nav-item:hover {
    background: #f8fafc;
}
.bms-pay-nav-item.is-active {
    background: #fff0f3;
    border-left-color: #f84464;
    color: #e12e4e;
}
.bms-pay-main {
    background: white;
    border-radius: 16px;
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.05);
    border: none;
    padding: 32px;
}
.bms-pay-main h3 {
    font-size: 1.4rem;
    color: #0f172a;
    margin-bottom: 24px;
}
.bms-pay-card {
    background: #ffffff;
    border: 2px solid #e2e8f0;
    border-radius: 16px;
    padding: 20px 24px;
    transition: all 0.3s;
    margin-bottom: 16px;
}
.bms-pay-card:hover {
    border-color: #f84464;
    box-shadow: 0 12px 24px rgba(248, 68, 100, 0.1);
    transform: translateY(-3px);
}
.bms-pay-card strong {
    font-size: 1.1rem;
    color: #1e293b;
}
.bms-sidebar-card {
    background: white;
    border-radius: 16px;
    box-shadow: 0 8px 20px rgba(0,0,0,0.04);
    border: 1px solid #e2e8f0;
}
.bms-sidebar-card h4 {
    color: #0f172a;
    font-size: 1.1rem;
}
.bms-total {
    font-size: 1.3rem;
    color: #f84464;
}
</style>
</head>

<body class="bms-body">

<jsp:include page="navbar.jsp" />

<div class="bms-seat-header" style="border-bottom:none;">
    <a class="back" href="selectSeats.jsp?movie=<%= movie %>&theatre=<%= theatre %>">&larr; Back</a>
    <div class="bms-seat-title">
        <strong><%= movie %></strong>
        <span><%= theatre.isEmpty() ? "Your cinema" : theatre %> &middot; Select seats &middot; Pay securely</span>
    </div>
</div>

<div class="bms-pay-layout">

    <aside class="bms-pay-nav">
        <h3>Payment options</h3>
        <div class="bms-pay-nav-item is-active">&#128241; Pay by any UPI App</div>
        <div class="bms-pay-nav-item">&#128179; Debit / Credit Card</div>
        <div class="bms-pay-nav-item">&#128188; Mobile Wallets</div>
        <div class="bms-pay-nav-item">&#127873; Gift Voucher</div>
        <div class="bms-pay-nav-item">&#127974; Net Banking</div>
    </aside>

    <section class="bms-pay-main">
        <h3>Pay by any UPI App</h3>

<!-- UPI -->
<form action="qr.jsp" method="get" style="margin:0;">
    <input type="hidden" name="movie" value="<%= movie %>">
    <input type="hidden" name="seats" value="<%= seats %>">
    <input type="hidden" name="amount" value="<%= total %>">

<input type="hidden" name="rating" value="<%= rating %>">
<input type="hidden" name="desc" value="<%= desc %>">
<input type="hidden" name="img" value="<%= img %>">
<input type="hidden" name="cast" value="<%= cast %>">
    
    <button type="submit" class="bms-pay-card" style="width:100%; cursor:pointer; font-family:inherit;">
        <div style="text-align:left;">
            <strong>Scan QR code</strong>
            <p style="margin:4px 0 0; font-size:0.85rem; color:var(--text-muted);">Pay with any UPI app on your phone</p>
        </div>
        <span style="color:var(--text-muted);">&rsaquo;</span>
    </button>
</form>

<!-- Card -->
<form action="cardPayment.jsp" method="post" style="margin:0;">
    <input type="hidden" name="movie" value="<%= movie %>">
    <input type="hidden" name="seats" value="<%= seats %>">
    <input type="hidden" name="amount" value="<%= total %>">
    <input type="hidden" name="rating" value="<%= rating %>">
<input type="hidden" name="desc" value="<%= desc %>">
<input type="hidden" name="img" value="<%= img %>">
<input type="hidden" name="cast" value="<%= cast %>">
    <input type="hidden" name="theatre" value="<%= theatre %>">
    <button type="submit" class="bms-pay-card" style="width:100%; text-align:left; cursor:pointer; font-family:inherit;">
        <div>
            <strong>Debit / Credit Card</strong>
            <p style="margin:4px 0 0; font-size:0.85rem; color:var(--text-muted);">Visa, Mastercard, RuPay</p>
        </div>
        <span style="color:var(--text-muted);">&rsaquo;</span>
    </button>
</form>

<!-- Cash -->
<form action="book" method="post" style="margin:0;">
    <input type="hidden" name="movie" value="<%= movie %>">
    <input type="hidden" name="seats" value="<%= seats %>">
    <input type="hidden" name="theatre" value="<%= theatre %>">
    <input type="hidden" name="amount" value="<%= total %>">
    <input type="hidden" name="rating" value="<%= rating %>">
<input type="hidden" name="desc" value="<%= desc %>">
<input type="hidden" name="img" value="<%= img %>">
<input type="hidden" name="cast" value="<%= cast %>">
    <button type="submit" class="bms-pay-card" style="width:100%; text-align:left; cursor:pointer; font-family:inherit;">
        <div>
            <strong>Pay at cinema / Skip</strong>
            <p style="margin:4px 0 0; font-size:0.85rem; color:var(--text-muted);">Complete booking without online payment</p>
        </div>
        <span style="color:var(--text-muted);">&rsaquo;</span>
    </button>
</form>

    </section>

    <aside>
        <div class="bms-sidebar-card">
            <h4>Booking summary</h4>
            <p style="margin:0 0 8px; font-weight:600;"><%= movie %> &middot; <%= seatCount %> ticket(s)</p>
            <p style="margin:0; font-size:0.85rem; color:var(--text-muted); line-height:1.5;">
                Seats: <%= seats.isEmpty() ? "-" : seats %><br />
                <%= theatre.isEmpty() ? "" : theatre + "<br />" %>
                M-Ticket available after payment
            </p>
        </div>
        <div class="bms-sidebar-card" style="background:var(--green-soft); border-color:#c8e6c9;">
            <p style="margin:0; font-size:0.85rem; color:#1b5e20;">Cancellation may be available depending on venue policy.</p>
        </div>
        <div class="bms-sidebar-card">
            <div class="bms-price-row"><span>Ticket(s) price</span><span>&#8377;<%= seatCount * 150 %>.00</span></div>
            <div class="bms-price-row"><span>Convenience fees</span><span>&#8377;0.00</span></div>
            <div class="bms-total"><span>Total</span><span>&#8377;<%= total %>.00</span></div>
        </div>
        <p style="font-size:0.75rem; color:var(--text-muted); margin:0;">By proceeding, you agree to complete this transaction.</p>
    </aside>

</div>

</body>
</html>
