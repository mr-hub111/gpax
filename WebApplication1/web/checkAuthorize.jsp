<%-- 
    Document   : checkAuthorize
    Created on : Oct 13, 2019, 4:41:09 PM
    Author     : ISB-Programer
--%>

<%
    if(session.getAttribute("Logon") != null)
    {
        if(session.getAttribute("Logon") == "True")
        {
            
        }
        else{
            session.removeAttribute("Logon");
            session.removeAttribute("sUID");
            session.removeAttribute("sStatus");
            response.sendRedirect("login.jsp");
        }
    }
    else {
        session.removeAttribute("Logon");
        session.removeAttribute("sUID");
        session.removeAttribute("sStatus");
        response.sendRedirect("login.jsp");
    }
%>