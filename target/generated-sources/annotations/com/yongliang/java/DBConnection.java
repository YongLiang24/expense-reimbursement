package com.yongliang.java;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	
	private static DBConnection instance;
    private Connection connection;
    private String url = "jdbc:oracle:thin:@localhost:1521:yong";
    private String username = "yongliang";
    private String password = "yl";
    //private constructor
    private DBConnection() throws SQLException {
            this.connection = DriverManager.getConnection(url, username, password);     
    }
    //this method can be call when getInstance method returns an instance of this class
    public Connection getConnection() {
        return connection;
    }
    //this method creates an instance of this class without public constructor
    public static DBConnection getInstance() throws SQLException {
        if (instance == null) {
            instance = new DBConnection();
        } else if (instance.getConnection().isClosed()) {
            instance = new DBConnection();
        }
        return instance;
    }

}
