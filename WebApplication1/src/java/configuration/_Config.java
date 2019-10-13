/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package configuration;
import java.sql.*;
import javax.sql.*;

/**
 *
 * @author ISB-Programer
 */
public class _Config {
    
    //--------------- Config DB Here
    public static String host = "localhost";
    public static String username = "root";
    public static String password = "";
    public static String database = "db_gpax";
    //---------------Config DB Here
    
    
    
    public String UrlSQL = "jdbc:mysql://"+host+"/"+database+"?&serverTimezone=UTC&user="+username+"&password="+password+"";
    public Connection UrlConnect = null;
    public Statement sqlQuery = null;
    
    public Connection getSQLUrl() throws SQLException  {
        UrlConnect = DriverManager.getConnection(UrlSQL);
        return UrlConnect;
    }
    
}
