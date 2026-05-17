<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Get Started | BookMyShow</title>
    <link rel="stylesheet" href="css/bms-theme.css" />
<style>
/* Premium Login UI */
.bms-auth-page {
    background: url('https://images.unsplash.com/photo-1536440136628-849c177e76a1?ixlib=rb-4.0.3&auto=format&fit=crop&w=1925&q=80') no-repeat center center / cover !important;
    position: relative;
    display: flex;
    align-items: center;
    justify-content: center;
}
.bms-auth-page::before {
    content: '';
    position: absolute;
    inset: 0;
    background: rgba(15, 23, 42, 0.7);
    backdrop-filter: blur(10px);
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
.bms-btn-oauth {
    background: white !important;
    border: 1px solid #e2e8f0 !important;
    border-radius: 12px !important;
    color: #334155 !important;
    font-weight: 600 !important;
    transition: all 0.3s !important;
}
.bms-btn-oauth:hover {
    background: #f8fafc !important;
    border-color: #cbd5e1 !important;
    box-shadow: 0 4px 12px rgba(0,0,0,0.05) !important;
    transform: translateY(-2px);
}
.bms-input {
    background: #f8fafc !important;
    border: 1px solid #e2e8f0 !important;
    border-radius: 12px !important;
    padding: 16px !important;
    font-size: 1rem !important;
    transition: all 0.3s !important;
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
}
.bms-btn-primary:hover {
    transform: translateY(-2px);
    box-shadow: 0 15px 30px rgba(248, 68, 100, 0.3) !important;
}
.bms-or {
    color: #94a3b8 !important;
    font-weight: 600;
}
</style>
    <style>
        .bms-get-started {
            text-align: center;
        }
        .bms-get-started .bms-btn-oauth {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
            width: 100%;
            padding: 12px 16px;
            margin-bottom: 10px;
            border: 1px solid var(--border);
            border-radius: 10px;
            background: var(--bg);
            font: inherit;
            font-weight: 600;
            cursor: pointer;
            transition: background 0.2s, border-color 0.2s;
        }
        .bms-get-started .bms-btn-oauth:hover {
            background: var(--bg-page);
            border-color: #ccc;
        }
        .bms-or {
            color: var(--text-muted);
            font-size: 0.8rem;
            margin: 16px 0;
        }
    </style>
</head>

<body class="bms-body">

<div class="bms-auth-backdrop" aria-hidden="true"></div>

<div class="bms-auth-page">
    <div class="bms-auth-card bms-get-started">
        <h2>Get Started</h2>
        <p class="bms-auth-sub">Sign in to book faster and track your tickets.</p>

        <button type="button" class="bms-btn-oauth" id="bms-google-btn">&#128269; Continue with Google</button>
        <button type="button" class="bms-btn-oauth" id="bms-email-btn">&#9993; Continue with Email</button>
        <button type="button" class="bms-btn-oauth" id="bms-apple-btn">&#63743; Continue with Apple</button>

        <p class="bms-or">OR</p>

    <%
    String error = request.getParameter("error");
    if ("invalid".equals(error)) {
    %>
        <div class="bms-error">Invalid username or password. Try again.</div>
    <%
    }
    %>

    <form action="login" method="post" id="bms-email-form">

        <input class="bms-input" id="bms-username" type="text" name="username" placeholder="Username" required autocomplete="username" />

        <input class="bms-input" id="bms-password" type="password" name="password" placeholder="Password" required autocomplete="current-password" />

        <button type="submit" class="bms-btn bms-btn-primary" style="width:100%; margin-top:4px;">Sign in</button>

    </form>

        <p class="bms-auth-footer" style="margin-top:20px; font-size:0.75rem; color:var(--text-muted);">
            I agree to <a href="index.jsp">Terms &amp; Conditions</a> and <a href="index.jsp">Privacy Policy</a>
        </p>

        <p class="bms-auth-footer">New here? <a href="register.jsp">Create an account</a></p>
    </div>
</div>

<script>
(function () {
    var googleBtn = document.getElementById("bms-google-btn");
    var emailBtn = document.getElementById("bms-email-btn");
    var appleBtn = document.getElementById("bms-apple-btn");
    var username = document.getElementById("bms-username");
    var password = document.getElementById("bms-password");

    if (emailBtn && username) {
        emailBtn.addEventListener("click", function () {
            username.focus();
            username.scrollIntoView({ behavior: "smooth", block: "center" });
        });
    }

    if (googleBtn) {
        googleBtn.addEventListener("click", function () {
            window.location.href = "https://accounts.google.com/";
        });
    }

    if (appleBtn && password) {
        appleBtn.addEventListener("click", function () {
            password.focus();
        });
    }
})();
</script>

</body>
</html>
