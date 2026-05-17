<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Booking confirmed</title>
    <link rel="stylesheet" href="css/bms-theme.css" />
</head>

<body class="bms-body">
<jsp:include page="navbar.jsp" />

<style>
/* Enhanced Confirmation UI */
.bms-success-wrapper {
    max-width: 500px;
    margin: 60px auto;
    background: #ffffff;
    padding: 40px;
    border-radius: 24px;
    box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.1);
    text-align: center;
    border: 1px solid #e2e8f0;
    animation: popIn 0.5s cubic-bezier(0.175, 0.885, 0.32, 1.275);
}
@keyframes popIn {
    0% { transform: scale(0.9); opacity: 0; }
    100% { transform: scale(1); opacity: 1; }
}
.bms-success-icon {
    font-size: 4rem;
    margin-bottom: 16px;
    display: inline-block;
    animation: bounce 2s infinite;
}
@keyframes bounce {
    0%, 20%, 50%, 80%, 100% { transform: translateY(0); }
    40% { transform: translateY(-15px); }
    60% { transform: translateY(-7px); }
}
.bms-success-wrapper h1 {
    margin: 0 0 12px;
    color: #0f172a;
    font-size: 2rem;
    font-weight: 800;
}
.bms-scratch-promo {
    background: linear-gradient(135deg, #fff0f3 0%, #ffe4e6 100%);
    border: 2px dashed #f84464;
    padding: 24px;
    border-radius: 16px;
    margin-bottom: 30px;
    transition: transform 0.3s;
}
.bms-scratch-promo:hover {
    transform: translateY(-4px);
    box-shadow: 0 10px 25px rgba(248, 68, 100, 0.15);
}
.bms-scratch-btn {
    background: linear-gradient(135deg, #f84464 0%, #ff9800 100%);
    border: none;
    font-size: 1.1rem;
    padding: 14px 28px;
    border-radius: 12px;
    font-weight: 700;
    color: white;
    text-decoration: none;
    display: inline-block;
    box-shadow: 0 8px 16px rgba(248, 68, 100, 0.2);
    transition: all 0.3s;
}
.bms-scratch-btn:hover {
    transform: scale(1.05);
    box-shadow: 0 12px 24px rgba(248, 68, 100, 0.3);
}
.btn-home {
    padding: 12px 24px;
    border-radius: 10px;
    font-weight: 600;
    border: 1px solid #e2e8f0;
    color: #475569;
    text-decoration: none;
    display: inline-block;
    transition: all 0.2s;
}
.btn-home:hover {
    background: #f1f5f9;
}
</style>

<div class="bms-success-wrapper">
    <div class="bms-success-icon">✅</div>
    <h1>Booking Confirmed!</h1>
    <p style="color:#64748b; margin:0 0 30px; font-size:1.05rem;">Your tickets have been booked successfully. Check your email or SMS for details.</p>
    
    <div class="bms-scratch-promo">
        <h3 style="color: #e12e4e; margin: 0 0 10px 0; font-size: 1.3rem;">🎉 You've unlocked a Scratch Card!</h3>
        <p style="color: #475569; font-size: 0.95rem; margin-bottom: 20px;">As a thank you for booking with us, scratch a card to win exciting prizes.</p>
        <a href="scratchCard.jsp" class="bms-scratch-btn">Scratch Now</a>
    </div>

    <a href="index.jsp" class="btn-home">Back to home</a>
</div>

</body>
</html>
