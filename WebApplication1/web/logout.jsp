<%-- 
    Document   : logout.jsp
    Created on : Oct 13, 2019, 8:26:22 PM
    Author     : ISB-Programer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
        session.removeAttribute("Logon");
        session.removeAttribute("sUID");
        session.removeAttribute("sStatus");
        response.sendRedirect("login.jsp");
%>
