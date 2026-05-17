<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Select city</title>
<link rel="stylesheet" href="css/bms-theme.css" />
<style>
/* Premium City Selection UI */
.bms-body {
    background: #f8fafc;
}
.bms-page-pad {
    background: white;
    max-width: 500px;
    margin: 60px auto;
    padding: 40px;
    border-radius: 24px;
    box-shadow: 0 20px 40px -10px rgba(0,0,0,0.08);
    text-align: center;
    border: 1px solid #e2e8f0;
}
.bms-page-title {
    font-size: 1.8rem;
    color: #0f172a;
    font-weight: 800;
    margin-bottom: 8px;
}
.bms-page-sub {
    color: #64748b;
    font-size: 1rem;
    margin-bottom: 30px;
}
.bms-city-grid {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 16px;
}
.bms-city-grid button {
    background: white;
    border: 2px solid #e2e8f0;
    padding: 20px;
    border-radius: 16px;
    font-size: 1.1rem;
    font-weight: 700;
    color: #334155;
    cursor: pointer;
    transition: all 0.3s;
    display: flex;
    align-items: center;
    justify-content: center;
}
.bms-city-grid button:hover {
    border-color: #f84464;
    color: #f84464;
    background: #fff0f3;
    transform: translateY(-3px);
    box-shadow: 0 10px 20px rgba(248, 68, 100, 0.1);
}
/* Optional icons for cities */
.bms-city-grid button[value="Bangalore"]::before {
    content: '🏙️';
    margin-right: 8px;
    font-size: 1.3rem;
}
.bms-city-grid button[value="Mysore"]::before {
    content: '🏯';
    margin-right: 8px;
    font-size: 1.3rem;
}
</style>
</head>

<body class="bms-body">
<jsp:include page="navbar.jsp" />
<div class="bms-page-pad">
    <h1 class="bms-page-title">Select your city</h1>
    <p class="bms-page-sub">We will show movies and showtimes for your city.</p>
    <form action="setCity.jsp" method="post" class="bms-city-grid">
        <button type="submit" name="city" value="Bangalore">Bangalore</button>
        <button type="submit" name="city" value="Mysore">Mysore</button>
    </form>
</div>
</body>
</html>
