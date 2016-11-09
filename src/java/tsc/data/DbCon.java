package tsc.data;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author livhu
 */
public class DbCon {
    private static Connection con;
    public static Connection getConnection(){
        try {
            String DB_URL="jdbc:mysql://localhost/tsc_assets";
            String USER="jutu";
            String PASS="jutu1234";
            
            
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Connecting to a selected database...");
            con = DriverManager.getConnection(DB_URL, USER, PASS);
            
            
            
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DbCon.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(DbCon.class.getName()).log(Level.SEVERE, null, ex);
        }
        return con;
    }
    
}
