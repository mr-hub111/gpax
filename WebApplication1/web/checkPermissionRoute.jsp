<%-- 
    Document   : checkPermissionRoute
    Created on : Oct 13, 2019, 8:36:37 PM
    Author     : ISB-Programer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%
    if(session.getAttribute("Logon") != null)
    {
        //String sStatus = null;
        String sStatus = String.valueOf(session.getAttribute("sStatus"));
        if
        String STUDENT = "STUDENT";
        String TEACHER = "TEACHER";
        if(session.getAttribute("Logon") == "True")
        {
            //When Login Sucessful Will do This
            if(sStatus == STUDENT) {
                response.sendRedirect("index_student.jsp");
            }
            else if (sStatus == TEACHER) {
                response.sendRedirect("index_teacher.jsp");
            }
            else {
                response.sendRedirect("logout.jsp");
            }
        }
        else{
            response.sendRedirect("logout.jsp");
        }
    }
    else {
        response.sendRedirect("logout.jsp");
    }
%>