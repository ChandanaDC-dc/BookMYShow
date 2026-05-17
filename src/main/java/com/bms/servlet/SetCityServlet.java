package com.bms.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/setCity")
public class SetCityServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        String city = req.getParameter("city");

        HttpSession session = req.getSession();
        session.setAttribute("city", city);

        // 🔥 Redirect to home page after selecting city
        res.sendRedirect("index.jsp");
    }
}