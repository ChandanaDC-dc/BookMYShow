package com.bms.dao;

import java.sql.*;
import java.util.*;

public class MovieDAO {

    public static List<Map<String, String>> getAllMovies() {

        List<Map<String, String>> list = new ArrayList<>();

        try {
            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement("SELECT * FROM movies");
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Map<String, String> movie = new HashMap<>();

                movie.put("name", rs.getString("name"));
                movie.put("image", rs.getString("image"));
                movie.put("timing", rs.getString("timing"));

                // ✅ NEW FIELDS
                movie.put("rating", rs.getString("rating"));
                movie.put("cast", rs.getString("cast_name"));
                movie.put("description", rs.getString("description"));

                list.add(movie);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
}