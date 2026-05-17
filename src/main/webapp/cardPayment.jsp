<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<%
String movie = request.getParameter("movie");
String seats = request.getParameter("seats");
String theatre = request.getParameter("theatre");
String amount = request.getParameter("amount");

String rating = request.getParameter("rating");
String desc = request.getParameter("desc");
String img = request.getParameter("img");
String cast = request.getParameter("cast");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Card Payment</title>

<link rel="stylesheet" href="css/bms-theme.css" />

<style>

.card-container{
    max-width:500px;
    margin:50px auto;
    background:white;
    padding:35px;
    border-radius:24px;
    box-shadow:0 10px 30px rgba(0,0,0,0.08);
}

.card-container h2{
    margin-bottom:25px;
    color:#111827;
}

.form-group{
    margin-bottom:18px;
}

.form-group label{
    display:block;
    margin-bottom:8px;
    font-weight:600;
    color:#374151;
}

.form-group input,
.form-group select{
    width:100%;
    padding:14px;
    border:1px solid #d1d5db;
    border-radius:12px;
    font-size:15px;
}

.pay-btn{
    width:100%;
    background:#f84464;
    color:white;
    border:none;
    padding:16px;
    border-radius:14px;
    font-size:17px;
    font-weight:700;
    cursor:pointer;
    transition:0.3s;
}

.pay-btn:hover{
    background:#e11d48;
}

.amount-box{
    background:#f8fafc;
    padding:18px;
    border-radius:14px;
    margin-bottom:25px;
    font-size:18px;
    font-weight:700;
    color:#f84464;
    text-align:center;
}

.row{
    display:flex;
    gap:15px;
}

</style>

</head>

<body class="bms-body">

<jsp:include page="navbar.jsp" />

<div class="card-container">

    <h2>Debit / Credit Card Payment</h2>

    <div class="amount-box">
        Total Amount: ₹<%= amount %>
    </div>

<form action="book" method="post">

    <!-- HIDDEN VALUES -->

    <input type="hidden" name="movie" value="<%= movie %>">
    <input type="hidden" name="seats" value="<%= seats %>">
    <input type="hidden" name="theatre" value="<%= theatre %>">
    <input type="hidden" name="amount" value="<%= amount %>">

    <input type="hidden" name="rating" value="<%= rating %>">
    <input type="hidden" name="desc" value="<%= desc %>">
    <input type="hidden" name="img" value="<%= img %>">
    <input type="hidden" name="cast" value="<%= cast %>">

    <!-- CARD TYPE -->

    <div class="form-group">
        <label>Select Card Type</label>

        <select required>
            <option>Debit Card</option>
            <option>Credit Card</option>
        </select>
    </div>

    <!-- CARD NUMBER -->

    <div class="form-group">
        <label>Card Number</label>

        <input
            type="text"
            maxlength="16"
            placeholder="1234 5678 9012 3456"
            required
        >
    </div>

    <!-- CARD HOLDER -->

    <div class="form-group">
        <label>Card Holder Name</label>

        <input
            type="text"
            placeholder="Enter card holder name"
            required
        >
    </div>

    <!-- EXPIRY + CVV -->

    <div class="row">

        <div class="form-group" style="flex:1;">
            <label>Expiry Date</label>

            <input
                type="text"
                placeholder="MM/YY"
                required
            >
        </div>

        <div class="form-group" style="flex:1;">
            <label>CVV</label>

            <input
                type="password"
                maxlength="3"
                placeholder="123"
                required
            >
        </div>

    </div>

    <!-- OTP -->

    <div class="form-group">
        <label>Enter OTP / PIN</label>

        <input
            type="password"
            maxlength="6"
            placeholder="******"
            required
        >
    </div>

    <button type="submit" class="pay-btn">
        Pay ₹<%= amount %>
    </button>

</form>

</div>

</body>
</html>