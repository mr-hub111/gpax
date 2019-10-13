/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services;

import configuration._Config;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author ISB-Programer
 */
public class _SQLServices extends _Config {
    
    public void _SQLServices () throws SQLException {
        UrlConnect = DriverManager.getConnection("jdbc:mysql://"+host+"/"+database+"?&serverTimezone=UTC&user="+username+"&password="+password+"");
    }
    
    private String SQLCommand = null;
    
    
    private void registerSubject_ (String UserID, String Subject_Code) throws ClassNotFoundException, SQLException{
        Class.forName("com.mysql.jdbc.Driver");
        sqlQuery = UrlConnect.createStatement();
        SQLCommand = " INSERT register_subject "
                + " INTO (UserID,Subject_code,Subject_name,Subject_unit) "
                + " VALUES "
                + "("
                + "'"+UserID+"',"
                + "'"+Subject_Code+"',"
                + "(SELECT Subject_name FROM gpax_subject WHERE Subject_Code = '"+Subject_Code+"' LIMIT 1),"
                + "(SELECT Subject_unit FROM gpax_subject WHERE Subject_Code = '"+Subject_Code+"' LIMIT 1)"
                + ")";
        sqlQuery.execute(SQLCommand);
        sqlQuery.close();
    }
    
    private void _SetGrade (String UserID, String Subject_code, String Subject_Grade, String Subject_Vgrage) throws ClassNotFoundException, SQLException {
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
