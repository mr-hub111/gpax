<%-- 
    Document   : index
    Created on : Oct 13, 2019, 1:23:51 PM
    Author     : ISB-Programer
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%
    String Logon = String.valueOf(session.getAttribute("Logon"));
    
    if(Logon.equals("True"))
    {
        response.sendRedirect("checkPermissionRoute.jsp");
    }
    else {
        response.sendRedirect("logout.jsp");
    }
%>
