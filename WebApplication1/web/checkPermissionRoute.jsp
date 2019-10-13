<%-- 
    Document   : checkPermissionRoute
    Created on : Oct 13, 2019, 8:36:37 PM
    Author     : ISB-Programer
--%>




<%

        //String sStatus = null;
        
        String sStatus = String.valueOf(session.getAttribute("sStatus"));


        
        String STUDENT = "STUDENT";
        String TEACHER = "TEACHER";
        


        if(session.getAttribute("Logon").equals("True"))
        {
            //When Login Sucessful Will do This
            if(sStatus.equals(STUDENT)) {
                response.sendRedirect("index_student.jsp");
            }
            else if (sStatus.equals(TEACHER)) {
                response.sendRedirect("index_teacher.jsp");
            }
            else {
                response.sendRedirect("logout.jsp");
            }
            
        }
        else{
            response.sendRedirect("logout.jsp");
        }

%>