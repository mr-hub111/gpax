/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services;

import configuration._Config;
import java.sql.*;
/**
 *
 * @author ISB-Programer
 */
public class _loginServices extends _Config {
    
    
    public String UserID;
    public String Status = null;
    public String sUsername = null;
    private String sPassword = null;
    public String sName = null;
    public int sYear = 0;
    public String sFaculty = null;
    public String sProgram = null;
    public String sAdvisor = null;
    public String sStudent_status = null;
    
    private String SQLCommand = null;
    
    
    public boolean CheckLogin_ (String GetUsername, String GetPassword) throws ClassNotFoundException, SQLException {
    Class.forName("com.mysql.jdbc.Driver");
    UrlConnect = DriverManager.getConnection("jdbc:mysql://"+host+"/"+database+"?&serverTimezone=UTC&user="+username+"&password="+password+"");
    sqlQuery = UrlConnect.createStatement();
    SQLCommand = " SELECT * FROM member WHERE Username = '"+GetUsername+"' AND Password = '"+GetPassword+"' ";
    ResultSet recordSet_ = sqlQuery.executeQuery(SQLCommand);
        if(recordSet_.next()){
            this.UserID = recordSet_.getString("UserID");
            this.Status = recordSet_.getString("Status");
            this.sUsername = recordSet_.getString("Username");
            this.sPassword = recordSet_.getString("Password");
            this.sName = recordSet_.getString("Name");
            this.sYear = recordSet_.getInt("Year");
            this.sFaculty = recordSet_.getString("Faculty");
            this.sProgram = recordSet_.getString("Program");
            this.sAdvisor = recordSet_.getString("Advisor");
            this.sStudent_status = recordSet_.getString("Student_status");
            
            sqlQuery.close();
            UrlConnect.close();
            return true;
        }
        else{
            sqlQuery.close();
            UrlConnect.close();
            return false;
        }
        
    }
    
    
}
