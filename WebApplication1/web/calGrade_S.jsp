<%-- เสร็จแล้วคร้าา คำนวณเกรดนักศึกษา ต้องลงทะเบียนก่อน--%>

<%@page import="configuration._Config"%>
<%@page import="services._SQLServices"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException" %>

<%
    String UserID = session.getAttribute("sUID").toString();
    
    _Config SQLConfig = new _Config();
    Connection UrlConnect =  SQLConfig.getSQLUrl();
    
    _SQLServices SQLServices = new _SQLServices();
    String Name = SQLServices.getUserDetails(UserID, "Name");
    String Student_status = SQLServices.getUserDetails(UserID, "Student_status");
    String Faculty = SQLServices.getUserDetails(UserID, "Faculty");
    String Program = SQLServices.getUserDetails(UserID, "Program");
    String Advisor = SQLServices.getUserDetails(UserID, "Advisor");
    String Year = SQLServices.getUserDetails(UserID, "Year");
    
%>


<html lang="en">
<head>
  <title>Calculation_Grade_S</title>
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
      .center{
          text-align: center;
      }
  </style>
  
</head>

<body ><!-- พื้นที่การทำงาน-->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark" style="margin:24px 0;">
    <a class="navbar-brand" href="javascript:void(0)">CSIT_GPAX_S</a>
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
                <li class="nav-link disabled"><font color=white></font></a>
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
                            <a href="#" class="list-group-item list-group-item-action">ผลการศึกษา</a>
                        </div>
                    </div>
                </div>

                <div class="col-9"> <!-- แบ่งเป็น 9 ของ 12 -->
                    <h2>คำนวณเกรดเฉลี่ย</h2>
                    <hr>
                    <div class="card"><!-- กรอบการทำงาน -->
                        <div class="card-body">
                            <div class="row">
                                <div class="col-2">
                                    ชื่อ-นามสกุล
                                    <br>
                                    สถานภาพ
                                    <br>
                                    คณะ
                                    <br>
                                    สาขาวิชา
                                    <br>
                                    ที่ปรึกษา
                                    <br>
                                    ชั้นปี
                                </div>
                                <div class="col-7">
                                    : <%=Name%><br>
                                    : <%=Student_status%><br>
                                    : <%=Faculty%><br>
                                    : <%=Program%><br>
                                    : <%=Advisor%><br>
                                    : <%=Year%>
                                </div>
                            </div>
                            
                        </div>
                    </div>
                    
                </div>
            </div>
            </div>
      <br>
      <div class="container">
          <div class="row"> <!-- แบ่งเป็น 2 แถว ระหว่างเมนูด้านซ้าย กับด้านขวา -->
              <div class="col-3"> <!-- แบ่งเป็น 3 ของ 12 -->
              </div>
              <div class="col-9"> <!-- แบ่งเป็น 9 ของ 12 -->
                  
                  <%
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection cX = UrlConnect;
                        Statement sX = cX.createStatement();

                        ResultSet rX = sX.executeQuery("SELECT semaster FROM register_subject WHERE UserID = '"+session.getAttribute("sUID")+"' GROUP BY semaster ");
                            while(rX.next()) {
                                
                  %>
                  <table class="table table-bordered table-sm">
                      <thead class="table-success">
                            <tr>
                              <th colspan="7"><center>ภาคการศึกษาที่ <%=rX.getString("semaster")%></center></th>
                            </tr>
                      </thead>
                      <thead class="table-active center">
                          <tr>
                              <th width="20%">รหัสวิชา</th>
                              <th colspan="2" width="50%">ชื่อวิชา</th>
                              <th width="15%">หน่วยกิต</th>
                              <th width="15%">เกรด</th>
                          </tr>
                      </thead>
                      <tbody class="center">
                          
                        <%
                            Class.forName("com.mysql.jdbc.Driver");
                            int totalunit;
                            totalunit = 0;
                            Connection Con_SJ = UrlConnect;
                            Statement St_SJ = Con_SJ.createStatement();
                            ResultSet rSet_SJ = St_SJ.executeQuery("SELECT * FROM register_subject WHERE UserID = '"+session.getAttribute("sUID")+"' AND semaster = '"+rX.getString("semaster")+"' ");
                                while(rSet_SJ.next()) {
                                totalunit += rSet_SJ.getInt("Subject_unit");
                        %>
                          <tr>
                              <td><%=rSet_SJ.getString("Subject_code")%></td>
                              <td colspan="2"><%=rSet_SJ.getString("Subject_name")%></td>
                              <td><%=rSet_SJ.getString("Subject_unit")%></td>
                              <td><%=rSet_SJ.getString("Subject_grade")%><%//if(rSet_SJ.getString("Subject_grade").equals("0")){out.print("");}else{out.print(rSet_SJ.getString("Subject_grade"));}%></td>
                          </tr>
                        <%
                                
                                }
                            rSet_SJ.close();
                            St_SJ.close();
                        %>
                          <tr>
                              <td class="table-secondary"><b>This Semester</b></td>
                              <td class="table-info"><b>หน่วยกิตรวม</b></td>
                              <td><%=totalunit%></td>
                              <td class="table-info"><b>GPA</b></td>
                              <td>4.00</td>
                          </tr>
                          
                      </tbody>
                  </table>
                  <br>
                  <%
                                
                            }
                        rX.close();
                        sX.close();
                  %>
                  
                    
                  <!--<table class="table table-bordered table-sm">
                      <thead class="table-success">
                            <tr>
                              <th colspan="7"><center>ภาคการศึกษาที่ 2</center></th>
                            </tr>
                      </thead>
                      <thead class="table-active center">
                          <tr>
                              <th width="20%">รหัสวิชา</th>
                              <th colspan="2" width="50%">ชื่อวิชา</th>
                              <th width="15%">หน่วยกิต</th>
                              <th width="15%">เกรด</th>
                          </tr>
                      </thead>
                      <tbody class="center">
                          <tr>
                              <td>9999999</td>
                              <td colspan="2">Computer Organization and Architecture</td>
                              <td>3</td>
                              <td>A</td>
                          </tr>
                          <tr>
                              <td>9999999</td>
                              <td colspan="2">Computer Organization and Architecture</td>
                              <td>3</td>
                              <td>A</td>
                          </tr>
                          <tr>
                              <td class="table-secondary"><b>This Semester</b></td>
                              <td class="table-info"><b>หน่วยกิตรวม</b></td>
                              <td>21</td>
                              <td class="table-info"><b>GPA</b></td>
                              <td>4.00</td>
                          </tr>
                          
                      </tbody>
                  </table>
                  <br><table class="table table-bordered table-sm">
                      <thead class="table-success">
                            <tr>
                              <th colspan="7"><center>ภาคการศึกษาที่ 3</center></th>
                            </tr>
                      </thead>
                      <thead class="table-active center">
                          <tr>
                              <th width="20%">รหัสวิชา</th>
                              <th colspan="2" width="50%">ชื่อวิชา</th>
                              <th width="15%">หน่วยกิต</th>
                              <th width="15%">เกรด</th>
                          </tr>
                      </thead>
                      <tbody class="center">
                          <tr>
                              <td>9999999</td>
                              <td colspan="2">Computer Organization and Architecture</td>
                              <td>3</td>
                              <td>A</td>
                          </tr>
                          <tr>
                              <td>9999999</td>
                              <td colspan="2">Computer Organization and Architecture</td>
                              <td>3</td>
                              <td>A</td>
                          </tr>
                          <tr>
                              <td class="table-secondary"><b>This Semester</b></td>
                              <td class="table-info"><b>หน่วยกิตรวม</b></td>
                              <td>21</td>
                              <td class="table-info"><b>GPA</b></td>
                              <td>4.00</td>
                          </tr>
                          
                      </tbody>
                  </table>
                  <br><table class="table table-bordered table-sm">
                      <thead class="table-success">
                            <tr>
                              <th colspan="7"><center>ภาคการศึกษาที่ 4</center></th>
                            </tr>
                      </thead>
                      <thead class="table-active center">
                          <tr>
                              <th width="20%">รหัสวิชา</th>
                              <th colspan="2" width="50%">ชื่อวิชา</th>
                              <th width="15%">หน่วยกิต</th>
                              <th width="15%">เกรด</th>
                          </tr>
                      </thead>
                      <tbody class="center">
                          <tr>
                              <td>9999999</td>
                              <td colspan="2">Computer Organization and Architecture</td>
                              <td>3</td>
                              <td>A</td>
                          </tr>
                          <tr>
                              <td>9999999</td>
                              <td colspan="2">Computer Organization and Architecture</td>
                              <td>3</td>
                              <td>A</td>
                          </tr>
                          <tr>
                              <td class="table-secondary"><b>This Semester</b></td>
                              <td class="table-info"><b>หน่วยกิตรวม</b></td>
                              <td>21</td>
                              <td class="table-info"><b>GPA</b></td>
                              <td>4.00</td>
                          </tr>
                          
                      </tbody>
                  </table>
                  <br><table class="table table-bordered table-sm">
                      <thead class="table-success">
                            <tr>
                              <th colspan="7"><center>ภาคการศึกษาที่ 5</center></th>
                            </tr>
                      </thead>
                      <thead class="table-active center">
                          <tr>
                              <th width="20%">รหัสวิชา</th>
                              <th colspan="2" width="50%">ชื่อวิชา</th>
                              <th width="15%">หน่วยกิต</th>
                              <th width="15%">เกรด</th>
                          </tr>
                      </thead>
                      <tbody class="center">
                          <tr>
                              <td>9999999</td>
                              <td colspan="2">Computer Organization and Architecture</td>
                              <td>3</td>
                              <td>A</td>
                          </tr>
                          <tr>
                              <td>9999999</td>
                              <td colspan="2">Computer Organization and Architecture</td>
                              <td>3</td>
                              <td>A</td>
                          </tr>
                          <tr>
                              <td class="table-secondary"><b>This Semester</b></td>
                              <td class="table-info"><b>หน่วยกิตรวม</b></td>
                              <td>21</td>
                              <td class="table-info"><b>GPA</b></td>
                              <td>4.00</td>
                          </tr>
                          
                      </tbody>
                  </table>
                  <br><table class="table table-bordered table-sm">
                      <thead class="table-success">
                            <tr>
                              <th colspan="7"><center>ภาคการศึกษาที่ 6</center></th>
                            </tr>
                      </thead>
                      <thead class="table-active center">
                          <tr>
                              <th width="20%">รหัสวิชา</th>
                              <th colspan="2" width="50%">ชื่อวิชา</th>
                              <th width="15%">หน่วยกิต</th>
                              <th width="15%">เกรด</th>
                          </tr>
                      </thead>
                      <tbody class="center">
                          <tr>
                              <td>9999999</td>
                              <td colspan="2">Computer Organization and Architecture</td>
                              <td>3</td>
                              <td>A</td>
                          </tr>
                          <tr>
                              <td>9999999</td>
                              <td colspan="2">Computer Organization and Architecture</td>
                              <td>3</td>
                              <td>A</td>
                          </tr>
                          <tr>
                              <td class="table-secondary"><b>This Semester</b></td>
                              <td class="table-info"><b>หน่วยกิตรวม</b></td>
                              <td>21</td>
                              <td class="table-info"><b>GPA</b></td>
                              <td>4.00</td>
                          </tr>
                          
                      </tbody>
                  </table>
                  <br><table class="table table-bordered table-sm">
                      <thead class="table-success">
                            <tr>
                              <th colspan="7"><center>ภาคการศึกษาที่ 7</center></th>
                            </tr>
                      </thead>
                      <thead class="table-active center">
                          <tr>
                              <th width="20%">รหัสวิชา</th>
                              <th colspan="2" width="50%">ชื่อวิชา</th>
                              <th width="15%">หน่วยกิต</th>
                              <th width="15%">เกรด</th>
                          </tr>
                      </thead>
                      <tbody class="center">
                          <tr>
                              <td>9999999</td>
                              <td colspan="2">Computer Organization and Architecture</td>
                              <td>3</td>
                              <td>A</td>
                          </tr>
                          <tr>
                              <td>9999999</td>
                              <td colspan="2">Computer Organization and Architecture</td>
                              <td>3</td>
                              <td>A</td>
                          </tr>
                          <tr>
                              <td class="table-secondary"><b>This Semester</b></td>
                              <td class="table-info"><b>หน่วยกิตรวม</b></td>
                              <td>21</td>
                              <td class="table-info"><b>GPA</b></td>
                              <td>4.00</td>
                          </tr>
                          
                      </tbody>
                  </table>
                  <br><table class="table table-bordered table-sm">
                      <thead class="table-success">
                            <tr>
                              <th colspan="7"><center>ภาคการศึกษาที่ 8</center></th>
                            </tr>
                      </thead>
                      <thead class="table-active center">
                          <tr>
                              <th width="20%">รหัสวิชา</th>
                              <th colspan="2" width="50%">ชื่อวิชา</th>
                              <th width="15%">หน่วยกิต</th>
                              <th width="15%">เกรด</th>
                          </tr>
                      </thead>
                      <tbody class="center">
                          <tr>
                              <td>9999999</td>
                              <td colspan="2">Computer Organization and Architecture</td>
                              <td>3</td>
                              <td>A</td>
                          </tr>
                          <tr>
                              <td>9999999</td>
                              <td colspan="2">Computer Organization and Architecture</td>
                              <td>3</td>
                              <td>A</td>
                          </tr>
                          <tr>
                              <td class="table-secondary"><b>This Semester</b></td>
                              <td class="table-info"><b>หน่วยกิตรวม</b></td>
                              <td>21</td>
                              <td class="table-info"><b>GPA</b></td>
                              <td>4.00</td>
                          </tr>
                          
                      </tbody>
                  </table>-->
                  
                  
                  
                  <hr>

                  <button type="button" class="btn btn-warning btn-block" data-toggle="collapse" data-target="#demo">คำนวณเกรด</button>
                    <div id="demo" class="collapse">
                        <table class="table table-bordered table-sm">
                            <thead class="table-danger">
                                  <tr>
                                    <th colspan="4"><center>คำนวณเกรดเฉลี่ยสะสม</center></th>
                                  </tr>
                            </thead>
                            <tbody class="center">
                                <tr>
                                    <td class="table-danger" width="30%"><b>หน่วยกิตทั้งหมด</b></td>
                                    <td  width="20%"><b>130</b></td>
                                    <td class="table-danger" width="30%">เกรดเฉลี่ยสะสม</td>
                                    <td width="20%"><b>4.00</b></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                  
                  <br>
              </div>
          </div>
      </div>
</body>
</html>
