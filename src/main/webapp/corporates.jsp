<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Corporate Booking | BookMyShow</title>
    <link rel="stylesheet" href="css/bms-theme.css" />
    <style>
        .corp-hero {
            background: linear-gradient(rgba(15, 23, 42, 0.8), rgba(15, 23, 42, 0.95)), url('https://images.unsplash.com/photo-1540575467063-178a50c2df87?auto=format&fit=crop&w=2000&q=80') center/cover;
            padding: 100px 20px;
            text-align: center;
            color: white;
            border-bottom: 1px solid var(--border);
        }
        .corp-hero h1 {
            font-size: 3.5rem;
            margin-bottom: 20px;
            background: linear-gradient(90deg, #fff, #cbd5e1);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }
        .corp-hero p {
            font-size: 1.2rem;
            color: #94a3b8;
            max-width: 600px;
            margin: 0 auto 40px;
            line-height: 1.6;
        }
        .corp-features {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 30px;
            max-width: 1200px;
            margin: -50px auto 60px;
            padding: 0 20px;
            position: relative;
            z-index: 10;
        }
        .corp-feature-card {
            background: var(--card-bg);
            border: 1px solid var(--border);
            padding: 30px;
            border-radius: 16px;
            text-align: center;
            box-shadow: 0 20px 40px rgba(0,0,0,0.3);
            transition: transform 0.3s;
        }
        .corp-feature-card:hover {
            transform: translateY(-10px);
        }
        .corp-feature-card .icon {
            font-size: 2.5rem;
            margin-bottom: 20px;
            color: var(--bms-red);
        }
        .corp-feature-card h3 {
            font-size: 1.2rem;
            margin-bottom: 15px;
            color: var(--text);
        }
        .corp-feature-card p {
            color: var(--text-muted);
            font-size: 0.95rem;
            line-height: 1.5;
        }
        .corp-form-section {
            max-width: 800px;
            margin: 0 auto 80px;
            padding: 40px;
            background: var(--card-bg);
            border-radius: 20px;
            border: 1px solid var(--border);
            box-shadow: 0 10px 30px rgba(0,0,0,0.2);
        }
        .corp-form-section h2 {
            text-align: center;
            margin-bottom: 30px;
            font-size: 2rem;
            color: var(--text);
        }
        .corp-form {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
        }
        .corp-form .full-width {
            grid-column: 1 / -1;
        }
        .corp-form label {
            display: block;
            margin-bottom: 8px;
            color: var(--text-muted);
            font-size: 0.9rem;
        }
        .corp-form input, .corp-form select, .corp-form textarea {
            width: 100%;
            padding: 12px 15px;
            background: rgba(255,255,255,0.05);
            border: 1px solid var(--border);
            border-radius: 8px;
            color: var(--text);
            font-family: inherit;
            box-sizing: border-box;
            transition: border-color 0.3s;
        }
        .corp-form input:focus, .corp-form select:focus, .corp-form textarea:focus {
            outline: none;
            border-color: var(--bms-red);
        }
        .corp-btn {
            background: linear-gradient(90deg, var(--bms-red), #e11d48);
            color: white;
            border: none;
            padding: 15px 30px;
            border-radius: 8px;
            font-size: 1.1rem;
            font-weight: bold;
            cursor: pointer;
            transition: transform 0.3s, box-shadow 0.3s;
            width: 100%;
            margin-top: 20px;
        }
        .corp-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 20px rgba(248, 68, 100, 0.3);
        }
    </style>
</head>
<body class="bms-body">
    <jsp:include page="navbar.jsp" />

    <section class="corp-hero">
        <h1>Elevate Your Corporate Events</h1>
        <p>From exclusive movie screenings to large-scale conferences, we provide end-to-end solutions for your corporate entertainment needs.</p>
        <button class="corp-btn" style="width: auto;" onclick="document.getElementById('inquiry').scrollIntoView({behavior: 'smooth'})">Enquire Now</button>
    </section>

    <div class="corp-features">
        <div class="corp-feature-card">
            <div class="icon">&#127916;</div>
            <h3>Exclusive Screenings</h3>
            <p>Book an entire auditorium for your team. Perfect for product launches, townhalls, or rewarding employees.</p>
        </div>
        <div class="corp-feature-card">
            <div class="icon">&#127903;</div>
            <h3>Bulk Ticketing</h3>
            <p>Get special discounted rates on bulk bookings for movies, plays, and events across the country.</p>
        </div>
        <div class="corp-feature-card">
            <div class="icon">&#127873;</div>
            <h3>Corporate Gift Cards</h3>
            <p>The perfect gift for employees and clients. Customizable and available in both physical and digital formats.</p>
        </div>
    </div>

    <div class="corp-form-section" id="inquiry">
        <h2>Submit an Inquiry</h2>
        <form class="corp-form" onsubmit="event.preventDefault(); alert('Inquiry submitted successfully! Our team will contact you soon.');">
            <div>
                <label>First Name</label>
                <input type="text" required placeholder="John">
            </div>
            <div>
                <label>Last Name</label>
                <input type="text" required placeholder="Doe">
            </div>
            <div>
                <label>Email Address</label>
                <input type="email" required placeholder="john@company.com">
            </div>
            <div>
                <label>Phone Number</label>
                <input type="tel" required placeholder="+91 98765 43210">
            </div>
            <div class="full-width">
                <label>Company Name</label>
                <input type="text" required placeholder="Acme Corp">
            </div>
            <div class="full-width">
                <label>Inquiry Type</label>
                <select required style="background: var(--card-bg); color: var(--text);">
                    <option value="" disabled selected>Select an option</option>
                    <option value="screening">Exclusive Screening</option>
                    <option value="bulk">Bulk Tickets</option>
                    <option value="gift">Corporate Gifting</option>
                    <option value="other">Other Events</option>
                </select>
            </div>
            <div class="full-width">
                <label>Message / Requirements</label>
                <textarea rows="4" placeholder="Tell us more about your event..." required></textarea>
            </div>
            <div class="full-width">
                <button type="submit" class="corp-btn">Submit Inquiry</button>
            </div>
        </form>
    </div>
</body>
</html>
