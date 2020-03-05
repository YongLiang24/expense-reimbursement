package com.yongliang.dbmanipulation;

import java.sql.Connection;
import java.sql.ResultSet;

public interface DBManipulationDao {
	//this method requests a read to the database and returns a result set
	public  ResultSet executeQuery(Connection conn, String query);
	//this method will be implemented for insert, update and delete from the database
	public void updateQuery(Connection conn, String query);
	
	
}
