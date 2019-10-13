/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services;

import configuration._Config;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author ISB-Programer
 */
public class _SQLServices extends _Config {
    
    private String SQLCommand = null;
    
    Connection UrlConnect;

    //Constructor
    public _SQLServices() throws SQLException {
        this.UrlConnect = DriverManager.getConnection(UrlSQL);
    }
    
    public String getUserDetails (String UserID, String GetRequest) throws ClassNotFoundException, SQLException {
        
        String Status = null;
        String Year = null;
        String Name = null;
        String Faculty = null;
        String Program = null;
        String Advisor = null;
        String Student_status = null;
        String gpax = null;
        
        Class.forName("com.mysql.jdbc.Driver");
        sqlQuery = UrlConnect.createStatement();
        SQLCommand = "SELECT * FROM member WHERE UserID = '"+UserID+"' ";
        ResultSet recordSet = sqlQuery.executeQuery(SQLCommand);
            while(recordSet.next()) {
                Status = recordSet.getString("Status");
                Year = recordSet.getString("Year");
                Name = recordSet.getString("Name");
                Faculty = recordSet.getString("Faculty");
                Program = recordSet.getString("Program");
                Advisor = recordSet.getString("Advisor");
                Student_status = recordSet.getString("Student_status");
                gpax = recordSet.getString("gpax");
            }
        sqlQuery.close();
        
        if (GetRequest.equals("Status")) {
            return Status;
        }
        else if (GetRequest.equals("Year")) {
            return Year;
        }
        else if (GetRequest.equals("Name")) {
            return Name;
        }
        else if (GetRequest.equals("Faculty")) {
            return Faculty;
        }
        else if (GetRequest.equals("Program")) {
            return Program;
        }
        else if (GetRequest.equals("Advisor")) {
            return Advisor;
        }
        else if (GetRequest.equals("Student_status")) {
            return Student_status;
        }
        else if (GetRequest.equals("gpax")) {
            return gpax;
        }
        else {
            return null;
        }
        
        
    }
    
    
    
    public void registerSubject (String UserID, String Subject_Code, String Subject_name,String semaster, String Subject_unit) throws ClassNotFoundException, SQLException{
        Class.forName("com.mysql.jdbc.Driver");
        sqlQuery = UrlConnect.createStatement();
        SQLCommand = " INSERT "
                + " INTO register_subject (UserID,Subject_code,Subject_name,semaster,Subject_unit) "
                + " VALUES ('"+UserID+"','"+Subject_Code+"','"+Subject_name+"','"+semaster+"','"+Subject_unit+"')";
               
        sqlQuery.execute(SQLCommand);
        sqlQuery.close();
    }
    
    public void deleteSubject (String reg_number) throws ClassNotFoundException, SQLException{
        Class.forName("com.mysql.jdbc.Driver");
        sqlQuery = UrlConnect.createStatement();
        SQLCommand = " DELETE FROM register_subject WHERE reg_number = '"+reg_number+"'; ";
                
        sqlQuery.execute(SQLCommand);
        sqlQuery.close();
    }
    
    public void SetGrade (String UserID, String Subject_code, String Subject_Grade, String Subject_Vgrage) throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.jdbc.Driver");
        sqlQuery = UrlConnect.createStatement();
        SQLCommand = " UPDATE register_subject "
                + " SET "
                + " Subject_Grade = '"+Subject_Grade+"', "
                + " Subject_Vgrage = '"+Subject_Vgrage+"' "
                + " WHERE "
                + " UserID = '"+UserID+"' "
                + " AND Subject_code = '"+Subject_code+"' ";
        sqlQuery.execute(SQLCommand);
        sqlQuery.close();
    }
    
    

    
    
}
