# 🎬 BookMyShow Clone – Full Stack Movie Ticket Booking System

A full stack web application inspired by BookMyShow, developed using JSP, Servlets, JDBC, MySQL, HTML, CSS, JavaScript, and Apache Tomcat.

This project allows users to browse movies, events, plays, sports, and activities, select theatres and seats, make bookings, and view booking history with a modern UI experience.

---

# 🚀 Features

## 🎥 Movies & Entertainment
- Movies booking
- Stream movies section
- Events booking
- Plays booking
- Sports events booking
- Activities booking

---

## 🎟 Ticket Booking System
- Theatre selection
- Dynamic seat selection
- Payment page
- Booking confirmation
- Booking history
- QR payment integration

---

## 💺 Smart Seat System
- Seat selection UI
- Already booked seats disabled
- Premium & Classic seat categories
- Dynamic seat count and total calculation

---

## 🤖 AI Chat Assistant
- AI chatbot integration using Gemini API
- Movie recommendation support
- User interaction assistant

---

## 🎨 UI Features
- Responsive BookMyShow-inspired design
- Modern card layout
- Search filtering
- Interactive animations
- Enhanced payment UI

---

# 🛠 Technologies Used

| Technology | Purpose |
|---|---|
| Java | Backend programming |
| JSP | Dynamic web pages |
| Servlets | Request handling |
| JDBC | Database connection |
| MySQL | Database |
| HTML/CSS | Frontend design |
| JavaScript | Dynamic interaction |
| Apache Tomcat | Server |
| Git & GitHub | Version control |

---

# 🗄 Database Tables

- users
- movies
- stream_movies
- events
- plays
- sports
- activities
- bookings

---

# 📂 Project Structure

```bash
BookMyShowApp2/
│
├── src/main/java/
│   ├── com.bms.servlet
│   ├── com.bms.dao
│
├── src/main/webapp/
│   ├── index.jsp
│   ├── movies.jsp
│   ├── theatres.jsp
│   ├── selectSeats.jsp
│   ├── payment.jsp
│   ├── confirmation.jsp
│   ├── history.jsp
│   ├── chatbot.jsp
│   └── css/
│
├── pom.xml
└── README.md

⚙️ Setup Instructions
1️⃣ Clone Repository
git clone https://github.com/ChandanaDC-dc/BookMYShow.git
2️⃣ Import into Eclipse
Open Eclipse
Import Existing Maven Project
Select project folder
3️⃣ Configure MySQL Database

Create database:

CREATE DATABASE bookmyshow;

Import required tables.

4️⃣ Configure Tomcat Server
Add Apache Tomcat 9
Run project on server
📸 Screenshots

(Add your screenshots here)

Example:

Home Page
Movies Page
Seat Selection
Payment Page
Booking History
AI Chatbot
🔮 Future Enhancements
Real online payment gateway
Email ticket sending
AI seat recommendation
Voice assistant
Live movie APIs
Admin dashboard
Online deployment
-->👩‍💻 Developer
Chandana DC

Full Stack Java Developer
VTU Student Project

GitHub:
https://github.com/ChandanaDC-dc

ARCHITECTURE



                USER
                  |
                  v
        -------------------
        |   JSP Pages     |
        -------------------
                  |
                  v
        -------------------
        |    Servlets      |
        -------------------
                  |
                  v
        -------------------
        |      JDBC        |
        -------------------
                  |
                  v
        -------------------
        |     MySQL        |
        -------------------

Additional Modules:
-------------------
AI Chatbot -> Gemini API
QR Payment -> QR Generator
Seat System -> Booking Database
