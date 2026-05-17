<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<%
String city = request.getParameter("city");

if(city != null){
    session.setAttribute("city", city);
}

/* ✅ REDIRECT TO HOME */
response.sendRedirect("index.jsp");
%>