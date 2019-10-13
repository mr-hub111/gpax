<%@page import="services._loginServices"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException" %>
<!DOCTYPE html>


<%
    String username = request.getParameter("txtUsername");
    String txtpassowrd = request.getParameter("txtPassword");

    _loginServices loginServices = new _loginServices();
    
    boolean CheckLogin = loginServices.CheckLogin_(username,txtpassowrd);
    //out.println(CheckLogin);
    //out.println(loginServices.SQLCommand);
    String falseLogin = null;
    
    if (request.getParameter("txtUsername")!= null & request.getParameter("txtPassword")!= null)
    {
        if (CheckLogin == true){
            //out.println("Login Sucessfuly");
            session.setAttribute("Logon", "True");
            session.setAttribute("sUID", loginServices.UserID.toString());
            session.setAttribute("sStatus", loginServices.Status.toString());
            response.sendRedirect("checkPermissionRoute.jsp");
        }
        else {
            //out.println("Login Failed");
            falseLogin = "True";
            session.removeAttribute("Logon");
            session.removeAttribute("sUID");
            session.removeAttribute("sStatus");
        }
    }
%>

<html lang="en">
    <head>
        <title>Login</title>
        <meta charset="tis-620"> <!-- เป็นภาษาไทย -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"> <!-- ดึงcssของbootstrapมาใช้ -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <script src="https://kit.fontawesome.com/a076d05399.js"></script>        
    <style>
      .bgcolor{
          background-color: #f2f2f2;
      }
    </style>
    </head>
<body>
    
    
    
        <div class="bgcolor"> 
    <div class="sansserif">
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark" style="margin:24px 0;">
        <a class="navbar-brand" href="javascript:void(0)">CSIT_GPAX</a>
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navb">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navb">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item"></li>
            </ul>
            <form class="form-inline my-2 my-lg-0">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="#">เข้าสู่ระบบ</a>
                    </li>
                </ul>
            </form>
        </div>
    </nav>
    <br>
    
    <!--card ของ Login-->
    <div class="container">
        <div class="col-12">
            <div class="card">
                <div class="card-body">
                    <h4><center>เข้าสู่ระบบ</center></h4>
                    <div class="row">
                        <div class="col-4"></div>  
                        <div class="col-4">
                            <div class="card">
                                <div class="card-body">
                                    <form name="frmLogin" method="post" action="login.jsp?Action=Login">
                                        <%
                                            if(falseLogin == "True")
                                            {
                                                out.print("<font color=red>Username and Password Incorrect!</font>");
                                            }
                                        %>
                                        <div class="form-group">
                                            <label for="txtUsername">UserID:</label>
                                            <input type="text" class="form-control" id="txtUsername" placeholder="กรุณาใส่ UserID" name="txtUsername">
                                        </div>
                                        <div class="form-group">
                                            <label for="txtPassword">Password:</label>
                                            <input type="password" class="form-control" id="pswd" placeholder="กรุณาใส่ password" name="txtPassword" required>
                                        </div>
                                        <button type="submit" name="submit" value="login" class="btn btn-primary">เข้าสู่ระบบ</button>
                                    </form>
                                </div>  
                            </div>
                        </div>
                        <div class="col-4"></div>
                    </div>
                </div>
                                        


            </div>
        </div>
    </div>


</div>
</div>
                                        
                                        
</body>
</html>