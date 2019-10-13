 <%@ include file="checkAuthorize.jsp" %> 

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>




<%
    Connection connect = null;
    Statement s = null;
    String name ="";
    String stdid = "";
    try {
                            Class.forName("com.mysql.jdbc.Driver");

                            connect =  DriverManager.getConnection("jdbc:mysql://localhost:3306/db_gpax" + "?user=root&password=&serverTimezone=UTC");


                            s = connect.createStatement(); //Start Open SQL Connection from Object s

                            String sql = "SELECT * FROM  member WHERE " + "UserID = '" + String.valueOf(session.getAttribute("sUID")) + "'";

                            ResultSet rec = s.executeQuery(sql);

                            if(!rec.next())
                            {
                                    //Do something when no of result
                            } else {
                                    //Do something when one or more of results
                                    rec.first();
                                            name = rec.getString("Name");
                                            stdid = rec.getString("Username");
                                            /*String lastname = rec.getString("lastname");*/
                                    s.close();
                                    connect.close();
                            }

                            } catch (Exception e) {
                                    // TODO Auto-generated catch block
                                    out.println(e.getMessage());
                                    e.printStackTrace();
                            }

    try {
            if(s!=null){
                    s.close();
                    connect.close();
            }
    } catch (SQLException e) {
            // TODO Auto-generated catch block
            out.println(e.getMessage());
            e.printStackTrace();
    }
                            
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Index_student</title>
  <meta charset="tis-620"> <!-- เป็นภาษาไทย -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"> <!-- ดึงcssของbootstrapมาใช้ -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  <style>
      .bgcolor{
          background-color: #f2f2f2;
      }
  </style>
</head>


<body ><!-- พื้นที่การทำงาน-->
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
                <li class="nav-link disabled"><font color=white><%/*=rec.getString("Name") */%></font></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link " href="logout.jsp">ออกจากระบบ</a>
                </li>
              
            </ul>
        </form>
    </div>
    </nav>
      <br>

        <div class="container">
            <div class="row"> <!-- แบ่งเป็น 2 แถว ระหว่างเมนูด้านซ้าย กับด้านขวา -->
                <div class="col-3"> <!-- แบ่งเป็น 3 ของ 12 -->
                    <div class="card"><!-- กรอบเมนู -->
                        <div class="list-group">
                            <a href="index_student.jsp" class="list-group-item list-group-item-action">หน้าแรก</a>
                            <a href="std_CalGrade.jsp" class="list-group-item list-group-item-action">ลงทะเบียนรายวิชา</a>
                            <a href="calGrade_S.jsp" class="list-group-item list-group-item-action">คำนวณเกรด</a>
                            <a href="#" class="list-group-item list-group-item-action">รายชื่อนักศึกษา</a>
                        </div>
                    </div>
                </div>

                <div class="col-9"> <!-- แบ่งเป็น 9 ของ 12 -->
                    <div class="card"><!-- กรอบการทำงาน -->
                        <div class="card-body">
                            <h1>ยินดีต้อนรับเข้าสู่ระบบ GPAX [Student]</h1>
                            <hr>
                            ชื่อ : <%= name%>
                            <BR>
                            รหัสนักศึกษา : <%=stdid%> 

                        </div>
                    </div>
                </div>
            </div>
        </div>
      
      
    
</body>
</html>