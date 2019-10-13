 <%@page import="services._SQLServices"%>
<%@ include file="checkAuthorize.jsp" %> 
 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*"%>


<%
    String action = request.getParameter("action");
    String Subject_code = request.getParameter("Subject_code");
    String Subject_name = request.getParameter("Subject_name");
    String semaster = request.getParameter("semaster");
    String Subject_unit = request.getParameter("Subject_unit");
    String reg_number = request.getParameter("reg_number");
%>
    

<% //action="add"
    
   
	if( ("add").equals(action) & Subject_code != null )
        {
            _SQLServices SetRegister = new _SQLServices();
            SetRegister.registerSubject(session.getAttribute("sUID").toString(), Subject_code,Subject_name,semaster,Subject_unit);
		
	}
	
%>

<% //action="delete"
    if( ("delete").equals(action) & reg_number != null )
        {
            _SQLServices SetRegister = new _SQLServices();
            SetRegister.deleteSubject(reg_number);
	}
%>



<%
    int unit_total = 130;
    int unit_avaliable = 0;
    int unit_left = 0;
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection cX = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_gpax" + "?user=root&password=&serverTimezone=UTC");
    Statement sX = cX.createStatement();
    ResultSet rX = sX.executeQuery("SELECT Subject_unit FROM register_subject WHERE UserID = '"+session.getAttribute("sUID")+"' ");
        while(rX.next()) {
            unit_avaliable += rX.getInt("Subject_unit");
        }
    rX.close();
    sX.close();
    unit_left = unit_total - unit_avaliable;
    

if( unit_left <= 0 )
{
    out.println("หน่วยเกิจเกิน");
}
 
    
                            
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Index_student</title>
  <meta charset="tis-620"> <!-- เป็นภาษาไทย -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>


<body><!-- พื้นที่การทำงาน-->
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
                        <form class="form-inline my-2 my-lg-0">
                            <input class="form-control mr-sm-2" id="myInput" type="text" placeholder="ค้นหารายวิชา">
                            <button class="btn btn-success my-2 my-sm-0" type="button">ค้นหา</button>
                        </form>
                        <div>
                            <table class="table">
    <thead>
      <tr>
        <th>หน่วยกิตที่ต้องลง <label id="txt_unit_total"><%=unit_total%></label> 
                            <input type="hidden" id="unit_total" name="unit_total"></th>
        <th>หน่วยกิตที่ใช้ไป <label id="txt_unit_avaliable"><%=unit_avaliable%></label>
                            <input type="hidden" id="unit_avaliable" name="unit_avaliable"> </th>
        <th>หน่วยกิตที่เหลือ <label id="txt_unit_left"><%=unit_left%></label>
                            <input type="hidden" id="unit_left" name="unit_left"></th>
      </tr>
    </thead>
  </table>
                            
                            
                            
                        </div>
                
                        <table class="table table-bordered">
                            <thead>
                            <tr>
                              <th>รหัสวิชา</th>
                              <th>ชื่อวิชา</th>
                              <th>หน่วยกิต</th>
                              <th>คำสั่ง</th>
                            </tr>
                          </thead>
                          <tbody id="myTable">
<%
    Connection connect = null;
    Statement s = null;
    try {
                            Class.forName("com.mysql.jdbc.Driver");

                            connect =  DriverManager.getConnection("jdbc:mysql://localhost:3306/db_gpax" + "?user=root&password=&serverTimezone=UTC");


                            s = connect.createStatement(); //Start Open SQL Connection from Object s

                            String sql = "SELECT a.*,b.* FROM gpax_subject AS a LEFT JOIN register_subject AS b ON a.Subject_code = b.Subject_code WHERE UserID = '"+session.getAttribute("sUID")+"' OR UserID IS NULL";
//out.println(sql);
                            ResultSet rec = s.executeQuery(sql);

                            
                                int Count = 0;
                                    while(rec.next())
                                    {
                                        Count = Count+1;
                                        out.println("<tr>");
                                        out.println("<td>" + rec.getString("Subject_code") + "</td>");
                                        out.println("<td>" + rec.getString("Subject_name") + "</td>");
                                        out.println("<td>" + rec.getString("Subject_unit") + "</td>");
                                        if(rec.getString("userID") == null)
                                        {
                                            %>
                                        <td>
                                            <button type="button" class="btn btn-success" data-toggle="modal" data-target="#myModal_<%out.print(Count);%>">
                                            เพิ่มรายวิชา
                                            </button>

                                            <div class="modal" id="myModal_<%out.print(Count);%>">
                                              <div class="modal-dialog">
                                                <div class="modal-content">

                                                  <!-- Modal Header -->
                                                  <div class="modal-header">
                                                    <h4 class="modal-title"><h3>เลือก ปี/เทอมการศึกษา</h3></h4>
                                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                  </div>

                                                  <div class="modal-body">
                                                      <h5>ชื่อวิชา : <%=rec.getString("Subject_name")%></h5>
                                                      <form method="post" action="std_CalGrade.jsp?action=add">
                                                        <div class="form-inline">
                                                            เทอมการศึกษา : &nbsp; 
                                                          
                                                          <input type="hidden" name="Subject_code" value="<%=rec.getString("Subject_code")%>" >
                                                          <input type="hidden" name="Subject_name" value="<%=rec.getString("Subject_name")%>" >
                                                          <input type="hidden" name="Subject_unit" value="<%=rec.getString("Subject_unit")%>" >
                                                          
                                                          <select class="form-control" id="sel1" name="semaster">
                                                            <option>1</option>
                                                            <option>2</option>
                                                            <option>3</option>
                                                            <option>4</option>
                                                            <option>5</option>
                                                            <option>6</option>
                                                            <option>7</option>
                                                            <option>8</option>
                                                          </select> &nbsp;
                                                          <button type="submit" class="btn btn-primary">ตกลง</button>
                                                        </div>
                                                      </form>
                                                  </div>

                                                  <!-- Modal footer -->
                                                  <div class="modal-footer">
                                                        <button type="button" class="btn btn-danger" data-dismiss="modal">ยกเลิก</button>
                                                  </div>

                                                </div>
                                              </div>
                                            </div>
                                        </td>
                                            <%
                                            /*out.println("<td>" 
                                                    + "<form method='post' action='std_CalGrade.jsp' >"
                                                        + "<input name='action' type='hidden' value='add'> "
                                                        + "<input name='Subject_code' type='hidden' value='" + rec.getString("Subject_code") + "'> "
                                                        + "<button>เพิ่มรายวิชา</button>"
                                                    + "</form>" 
                                                + "</td>");*/
                                        }
                                        else
                                        {
                                               /* out.println("<td>" 
                                                    + "<form method='post' action='std_CalGrade.jsp' >"
                                                        + "<input name='action' type='hidden' value='delete'> "
                                                        + "<input name='Subject_code' type='hidden' value='" + rec.getString("Subject_code") + "'> "
                                                        + "-"
                                                    + "</form>" 
                                                + "</td>");*/
                                                out.println("<td>"
+ "<form method='post' action='std_CalGrade.jsp?action=delete'>"
+ "<input type='hidden' name='reg_number' value='"+rec.getString("reg_number")+"' >"
+ "<button type='submit' class='btn btn-danger' >ยกเลิกรายวิชา</button>"
+ "</form>"
+ "</td>");
                                        }
                                        
                                        out.println("</tr>");
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
                          </tbody>
                        </table>
                        
                        
                        
                    
                    </div>
                </div>
            </div>
</div>
</div>
      
  <script>
    $(document).ready(function(){
        $("#myInput").on("keyup", function() {
            var value = $(this).val().toLowerCase();
            $("#myTable tr").filter(function() {
                $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
            });
        });
    });
</script>      
      
      
      
</body>

</html>