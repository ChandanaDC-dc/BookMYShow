package com.bms.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.bms.dao.DBConnection;

@WebServlet("/book")
public class BookingServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        try {

            HttpSession session = req.getSession(false);

            if (session == null || session.getAttribute("user") == null) {
                res.sendRedirect("login.jsp");
                return;
            }

            String username = (String) session.getAttribute("user");

            String movie = req.getParameter("movie");
            String seats = req.getParameter("seats");
            String theatre = req.getParameter("theatre");
            String amount = req.getParameter("amount");

            String image = req.getParameter("img");
            String rating = req.getParameter("rating");
            String cast = req.getParameter("cast");
            String desc = req.getParameter("desc");

            if (movie == null || seats == null ||
                movie.trim().isEmpty() || seats.trim().isEmpty()) {

                res.sendRedirect("selectSeats.jsp");
                return;
            }

            if (amount == null || amount.isEmpty()) {
                amount = "0";
            }

            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO bookings(username, movie_name, theatre_name, seats, payment_status, amount, image, rating, cast_name, description) VALUES (?,?,?,?,?,?,?,?,?,?)"
            );

            ps.setString(1, username);
            ps.setString(2, movie);
            ps.setString(3, theatre);
            ps.setString(4, seats);
            ps.setString(5, "PAID");
            ps.setInt(6, Integer.parseInt(amount));

            ps.setString(7, image);
            ps.setString(8, rating);
            ps.setString(9, cast);
            ps.setString(10, desc);
            

            ps.executeUpdate();
            

            res.sendRedirect("confirmation.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}