<%@ page import="java.net.URLEncoder" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
String rating = request.getParameter("rating");
String desc = request.getParameter("desc");
String img = request.getParameter("img");
String cast = request.getParameter("cast");
String theatre = request.getParameter("theatre");
String movie = request.getParameter("movie");
String seats = request.getParameter("seats");
String amount = request.getParameter("amount");
String success = request.getParameter("success");

if(movie == null) movie = "Unknown";
if(seats == null) seats = "";
if(amount == null) amount = "0";

String upi = "yourupi@upi";

String qrData = "upi://pay?pa=" + upi +
                "&pn=BookMyShowClone" +
                "&am=" + amount +
                "&cu=INR" +
                "&tn=" + movie + " seats " + seats;

String encoded = URLEncoder.encode(qrData, "UTF-8");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Scan &amp; pay</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="css/bms-theme.css" />
</head>

<body class="bms-body">
<jsp:include page="navbar.jsp" />

<style>
.bms-qr-container {
    max-width: 450px;
    margin: 60px auto;
    padding: 40px;
    background: #ffffff;
    border-radius: 24px;
    box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.1);
    text-align: center;
    border: 1px solid #e2e8f0;
}
.qr-header {
    margin-bottom: 24px;
}
.qr-header h2 {
    font-size: 1.8rem;
    color: #0f172a;
    font-weight: 800;
    margin: 0 0 8px;
}
.qr-details {
    background: #f8fafc;
    border-radius: 16px;
    padding: 20px;
    margin-bottom: 30px;
    text-align: left;
    border: 1px solid #f1f5f9;
}
.qr-details p {
    margin: 8px 0;
    display: flex;
    justify-content: space-between;
    font-size: 0.95rem;
    color: #64748b;
}
.qr-details b {
    color: #0f172a;
}
.qr-image-wrapper {
    background: #ffffff;
    padding: 24px;
    border-radius: 20px;
    box-shadow: 0 10px 25px rgba(0,0,0,0.05);
    display: inline-block;
    margin-bottom: 30px;
    border: 2px dashed #cbd5e1;
}
.btn-paid {
    background: linear-gradient(135deg, #10b981 0%, #059669 100%);
    color: white;
    font-size: 1.1rem;
    padding: 16px;
    border-radius: 12px;
    font-weight: 700;
    transition: all 0.3s;
    box-shadow: 0 10px 20px rgba(16, 185, 129, 0.2);
    width: 100%;
    border: none;
    cursor: pointer;
}
.btn-paid:hover {
    transform: translateY(-2px);
    box-shadow: 0 15px 30px rgba(16, 185, 129, 0.3);
}
</style>

<div class="bms-qr-container">

    <div class="qr-header">
        <h2>Scan &amp; Pay</h2>
        <p style="color:var(--text-muted); font-size:0.9rem; margin:0;">Open your UPI app and scan the code below</p>
    </div>

    <% if("true".equals(success)) { %>
        <div style="background:#d1fae5; color:#065f46; padding:12px; border-radius:8px; margin-bottom:20px; font-weight:600;">
            ✅ Payment successful
        </div>
    <% } %>

    <div class="qr-details">
        <p><b>Movie</b> <span><%= movie %></span></p>
        <p><b>Seats</b> <span><%= seats %></span></p>
        <div style="height:1px; background:#e2e8f0; margin:12px 0;"></div>
        <p style="font-size:1.1rem; color:#f84464;"><b>Amount</b> <span style="font-weight:800;">&#8377;<%= amount %></span></p>
    </div>

    <div class="qr-image-wrapper">
        <img
    src="images/myqr.jpg"
    alt="UPI Scanner"
    style="
        border-radius:12px;
        width:220px;
        height:220px;
        object-fit:cover;
    "
/>
    </div>

    <form action="book" method="post" style="margin-top:10px;">
    <input type="hidden" name="rating" value="<%= rating %>">
<input type="hidden" name="desc" value="<%= desc %>">
<input type="hidden" name="img" value="<%= img %>">
<input type="hidden" name="cast" value="<%= cast %>">
<input type="hidden" name="theatre" value="<%= theatre %>">
        <input type="hidden" name="movie" value="<%= movie %>">
        <input type="hidden" name="seats" value="<%= seats %>">
        <input type="hidden" name="amount" value="<%= amount %>">

        <button type="submit" class="btn-paid">
            I have paid
        </button>
    </form>

</div>

</body>
</html>
