package com.bms.dao;

import java.sql.*;
import java.util.*;

public class BookingDAO {

    public static Set<String> getBookedSeats(String movie) {

        Set<String> booked = new HashSet<>();

        try {
            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
                "SELECT seats FROM bookings WHERE movie_name=?"
            );

            ps.setString(1, movie);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                String seats = rs.getString("seats");

                if (seats != null) {
                    String[] arr = seats.split(",");
                    for (String s : arr) {
                        booked.add(s.trim());
                    }
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return booked;
    }
}