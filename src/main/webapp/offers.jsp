<%@ page language="java" contentType="text/html; charset=UTF-8" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <title>Offers & Promotions | BookMyShow</title>
        <link rel="stylesheet" href="css/bms-theme.css" />
        <style>
            .offers-container {
                display: flex;
                max-width: 1280px;
                margin: 40px auto;
                gap: 30px;
                padding: 0 20px;
            }

            .offers-sidebar {
                flex: 0 0 250px;
                background: var(--card-bg);
                border-radius: 12px;
                padding: 20px 0;
                box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
                height: fit-content;
            }

            .offers-sidebar .search-box {
                padding: 0 20px 15px;
                border-bottom: 1px solid var(--border);
                margin-bottom: 10px;
            }

            .offers-sidebar input {
                width: 100%;
                padding: 10px 15px;
                background: rgba(255, 255, 255, 0.05);
                border: 1px solid var(--border);
                border-radius: 8px;
                color: var(--text);
                box-sizing: border-box;
            }

            .offers-sidebar ul {
                list-style: none;
                padding: 0;
                margin: 0;
            }

            .offers-sidebar li {
                padding: 15px 20px;
                cursor: pointer;
                color: var(--text-muted);
                transition: 0.3s;
                border-left: 4px solid transparent;
            }

            .offers-sidebar li:hover {
                background: rgba(255, 255, 255, 0.03);
                color: var(--text);
            }

            .offers-sidebar li.active {
                background: rgba(248, 68, 100, 0.1);
                color: var(--bms-red);
                border-left: 4px solid var(--bms-red);
                font-weight: bold;
            }

            .offers-main {
                flex: 1;
                display: grid;
                grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
                gap: 20px;
            }

            .offer-card {
                background: var(--card-bg);
                border-radius: 12px;
                padding: 24px;
                box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
                transition: transform 0.3s, box-shadow 0.3s;
                display: flex;
                flex-direction: column;
                border: 1px solid var(--border);
                position: relative;
                overflow: hidden;
            }

            .offer-card:hover {
                transform: translateY(-5px);
                box-shadow: 0 10px 25px rgba(0, 0, 0, 0.3);
                border-color: rgba(248, 68, 100, 0.3);
            }

            .offer-card::before {
                content: '';
                position: absolute;
                top: 0;
                left: 0;
                right: 0;
                height: 4px;
                background: linear-gradient(90deg, var(--bms-red), #ff7b93);
                opacity: 0;
                transition: opacity 0.3s;
            }

            .offer-card:hover::before {
                opacity: 1;
            }

            .offer-header {
                display: flex;
                align-items: center;
                gap: 15px;
                margin-bottom: 20px;
            }

            .bank-logo {
                width: 48px;
                height: 48px;
                border-radius: 8px;
                background: white;
                display: flex;
                align-items: center;
                justify-content: center;
                font-weight: bold;
                color: #333;
                font-size: 0.8rem;
                text-align: center;
                line-height: 1.2;
                padding: 4px;
                box-sizing: border-box;
            }

            .bank-logo.au {
                background: #5c2069;
                color: white;
            }

            .bank-logo.aurum {
                background: #111;
                color: #d4af37;
            }

            .bank-logo.axis {
                background: #97144d;
                color: white;
            }

            .offer-title {
                font-size: 1.1rem;
                font-weight: 600;
                color: var(--text);
                line-height: 1.3;
            }

            .offer-desc {
                color: var(--text-muted);
                font-size: 0.95rem;
                line-height: 1.5;
                flex-grow: 1;
                margin-bottom: 20px;
            }

            .offer-footer {
                display: flex;
                justify-content: space-between;
                align-items: center;
                border-top: 1px solid var(--border);
                padding-top: 15px;
            }

            .offer-validity {
                font-size: 0.8rem;
                color: #94a3b8;
            }

            .view-details {
                color: var(--bms-red);
                font-size: 0.9rem;
                font-weight: 600;
                text-decoration: none;
                transition: 0.3s;
            }

            .view-details:hover {
                color: #ff7b93;
            }
        </style>
    </head>

    <body class="bms-body">
        <jsp:include page="navbar.jsp" />

        <div class="offers-container">
            <!-- Sidebar -->
            <div class="offers-sidebar">
                <div class="search-box">
                    <input type="text" placeholder="Search by card name">
                </div>
                <ul>
                    <li class="active">Credit Card</li>
                    <li>Debit Card</li>
                    <li>BookMyShow</li>
                    <li>UPI</li>
                    <li>Cinema</li>
                    <li>Wallet</li>
                    <li>Pay Later</li>
                </ul>
            </div>

            <!-- Main Content -->
            <div class="offers-main">
                <!-- Offer 1 -->
                <div class="offer-card">
                    <div class="offer-header">
                        <div class="bank-logo au">AU</div>
                        <div class="offer-title">AU Zenith+ Credit Card</div>
                    </div>
                    <div class="offer-desc">
                        Buy One ticket and Get One Free up to INR 500* with AU Zenith+ Credit Card.
                    </div>
                    <div class="offer-footer">
                        <div class="offer-validity">Processing fee applicable</div>
                        <a href="#" class="view-details">View details &gt;</a>
                    </div>
                </div>

                <!-- Offer 2 -->
                <div class="offer-card">
                    <div class="offer-header">
                        <div class="bank-logo aurum">AURUM</div>
                        <div class="offer-title">AURUM Card</div>
                    </div>
                    <div class="offer-desc">
                        Get 4 movie tickets or INR 1000 once a month with AURUM credit card.
                    </div>
                    <div class="offer-footer">
                        <div class="offer-validity">Processing fee applicable</div>
                        <a href="#" class="view-details">View details &gt;</a>
                    </div>
                </div>

                <!-- Offer 3 -->
                <div class="offer-card">
                    <div class="offer-header">
                        <div class="bank-logo axis">AXIS</div>
                        <div class="offer-title">Axis Bank Indigo Credit Card</div>
                    </div>
                    <div class="offer-desc">
                        Buy One Ticket, Get One Free using Axis Bank Indigo Credit Card.
                    </div>
                    <div class="offer-footer">
                        <div class="offer-validity">Processing fee applicable</div>
                        <a href="#" class="view-details">View details &gt;</a>
                    </div>
                </div>

                <!-- Offer 4 -->
                <div class="offer-card">
                    <div class="offer-header">
                        <div class="bank-logo axis">AXIS</div>
                        <div class="offer-title">Axis Bank Neo Card</div>
                    </div>
                    <div class="offer-desc">
                        Get 10% discount on movie tickets when you transact using your Axis Bank Neo and IndianOil Axis
                        Bank Credit Card.
                    </div>
                    <div class="offer-footer">
                        <div class="offer-validity">Processing fee applicable</div>
                        <a href="#" class="view-details">View details &gt;</a>
                    </div>
                </div>

                <!-- Offer 5 -->
                <div class="offer-card">
                    <div class="offer-header">
                        <div class="bank-logo axis">AXIS</div>
                        <div class="offer-title">Axis Bank Olympus Credit Card</div>
                    </div>
                    <div class="offer-desc">
                        Buy One Ticket, Get One Free using Axis Bank Olympus Credit Card.
                    </div>
                    <div class="offer-footer">
                        <div class="offer-validity">Processing fee applicable</div>
                        <a href="#" class="view-details">View details &gt;</a>
                    </div>
                </div>

                <!-- Offer 6 -->
                <div class="offer-card">
                    <div class="offer-header">
                        <div class="bank-logo axis">AXIS</div>
                        <div class="offer-title">Axis Reserve Credit Card</div>
                    </div>
                    <div class="offer-desc">
                        Buy 1 ticket and Get 1 ticket free with Axis Bank Burgundy Private and Axis Reserve Credit
                        cards.
                    </div>
                    <div class="offer-footer">
                        <div class="offer-validity">Processing fee applicable</div>
                        <a href="#" class="view-details">View details &gt;</a>
                    </div>
                </div>
            </div>
        </div>
    </body>

    </html>