<%-- 
    Document   : checkAuthorize
    Created on : Oct 13, 2019, 4:41:09 PM
    Author     : ISB-Programer
--%>

<%
        String Logon = String.valueOf(session.getAttribute("Logon"));
        
        if(Logon.equals("True"))
        {
            
        }
        else{
            session.removeAttribute("Logon");
            session.removeAttribute("sUID");
            session.removeAttribute("sStatus");
            response.sendRedirect("login.jsp");
        }


%>