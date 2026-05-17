<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Register | BookMyShow</title>
    <link rel="stylesheet" href="css/bms-theme.css" />
<style>
/* Premium Registration UI */
.bms-auth-page {
    background: url('https://images.unsplash.com/photo-1517604931442-7e0c8ed2963c?ixlib=rb-4.0.3&auto=format&fit=crop&w=1925&q=80') no-repeat center center / cover !important;
    position: relative;
    display: flex;
    align-items: center;
    justify-content: center;
}
.bms-auth-page::before {
    content: '';
    position: absolute;
    inset: 0;
    background: rgba(15, 23, 42, 0.75);
    backdrop-filter: blur(12px);
}
.bms-auth-card {
    background: rgba(255, 255, 255, 0.95) !important;
    border-radius: 24px !important;
    padding: 48px 40px !important;
    max-width: 440px !important;
    box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.5) !important;
    border: 1px solid rgba(255,255,255,0.2);
    position: relative;
    z-index: 10;
    text-align: center;
}
.bms-auth-card h2 {
    font-size: 2rem;
    color: #0f172a;
    font-weight: 800;
    margin-bottom: 8px;
}
.bms-auth-sub {
    color: #64748b !important;
    margin-bottom: 30px !important;
}
.bms-input {
    background: #f8fafc !important;
    border: 1px solid #e2e8f0 !important;
    border-radius: 12px !important;
    padding: 16px !important;
    font-size: 1rem !important;
    transition: all 0.3s !important;
    margin-bottom: 16px !important;
}
.bms-input:focus {
    background: white !important;
    border-color: #f84464 !important;
    box-shadow: 0 0 0 4px rgba(248, 68, 100, 0.1) !important;
}
.bms-btn-primary {
    background: linear-gradient(135deg, #f84464 0%, #ff9800 100%) !important;
    padding: 16px !important;
    border-radius: 12px !important;
    font-size: 1.1rem !important;
    font-weight: 700 !important;
    border: none !important;
    box-shadow: 0 10px 20px rgba(248, 68, 100, 0.2) !important;
    transition: all 0.3s !important;
    margin-top: 8px !important;
}
.bms-btn-primary:hover {
    transform: translateY(-2px);
    box-shadow: 0 15px 30px rgba(248, 68, 100, 0.3) !important;
}
.bms-auth-footer {
    margin-top: 24px !important;
    font-size: 0.95rem;
    color: #475569 !important;
}
.bms-auth-footer a {
    color: #f84464 !important;
    font-weight: 700 !important;
    text-decoration: none;
}
.bms-auth-footer a:hover {
    text-decoration: underline;
}
</style>
</head>
<jsp:include page="chatbot.jsp" />
<body class="bms-body">

<div class="bms-auth-backdrop" aria-hidden="true"></div>

<div class="bms-auth-page">
    <div class="bms-auth-card">
        <h2>Create account</h2>
        <p class="bms-auth-sub">Join to book shows and save your preferences.</p>

    <form action="register" method="post">

        <input class="bms-input" type="text" name="username" placeholder="Choose username" required autocomplete="username" />

        <input class="bms-input" type="password" name="password" placeholder="Create password" required autocomplete="new-password" />

        <button type="submit" class="bms-btn bms-btn-primary" style="width:100%;">Register</button>

    </form>

        <p class="bms-auth-footer">Already have an account? <a href="login.jsp">Sign in</a></p>
    </div>
</div>

</body>
</html>
