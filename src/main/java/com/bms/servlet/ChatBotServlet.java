package com.bms.servlet;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/chatbot")
public class ChatBotServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/plain");

        String message = request.getParameter("message");

        if(message == null || message.trim().isEmpty()){

            response.getWriter().write("Please type message");

            return;
        }

        String apiKey =
"AIzaSyDyEh_E1TKoOgpaW9qNO6ykcOAuPw-Hf50";

        URL url = new URL(
"YOUR-API-KEY"
+ apiKey);

        HttpURLConnection conn =
            (HttpURLConnection) url.openConnection();

        conn.setRequestMethod("POST");

        conn.setRequestProperty(
            "Content-Type",
            "application/json"
        );

        conn.setDoOutput(true);

        String prompt =
"You are a smart BookMyShow movie assistant. "
+ "Suggest movies, sports, plays, events and activities. "
+ "Keep replies short.\nUser: "
+ message;

        String jsonInput =
"{"
+ "\"contents\": [{"
+ "\"parts\": [{"
+ "\"text\": \"" 
+ prompt.replace("\"", "\\\"")
+ "\""
+ "}]"
+ "}]"
+ "}";

        OutputStream os =
            conn.getOutputStream();

        os.write(jsonInput.getBytes("UTF-8"));

        os.flush();
        os.close();

        InputStream is;

        if(conn.getResponseCode() >= 400){

            is = conn.getErrorStream();

        }else{

            is = conn.getInputStream();
        }

        BufferedReader br =
            new BufferedReader(
                new InputStreamReader(is));

        StringBuilder result =
            new StringBuilder();

        String line;

        while((line = br.readLine()) != null){

            result.append(line);
        }

        br.close();

        String output = result.toString();

        System.out.println(output);

        String reply = extractText(output);

        response.getWriter().write(reply);
    }

    private String extractText(String json){

        try{

            int textIndex =
                json.indexOf("\"text\"");

            if(textIndex == -1){

                return "AI response not available.";
            }

            int start =
                json.indexOf(":", textIndex) + 1;

            int firstQuote =
                json.indexOf("\"", start);

            int endQuote =
                json.indexOf("\"", firstQuote + 1);

            String text =
                json.substring(
                    firstQuote + 1,
                    endQuote
                );

            text = text
                .replace("\\n", "\n")
                .replace("\\\"", "\"");

            return text;

        }catch(Exception e){

            e.printStackTrace();

            return "Error parsing AI response.";
        }
    }
}
