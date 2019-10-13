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
    public static String host = "localhost";
    public static String username = "root";
    public static String password = "";
    public static String database = "db_gpax";
    
    public Connection UrlConnect = null;
    
    public Statement sqlQuery = null;
    
    
}
