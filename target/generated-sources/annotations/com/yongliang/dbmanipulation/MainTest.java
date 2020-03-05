package com.yongliang.dbmanipulation;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.yongliang.java.*;
public class MainTest {

	public static void main(String[] args) {
		Connection conn = null;
		try {
			 conn = DBConnection.getInstance().getConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		System.out.println("testing main");
//		String insertManager="insert into manager values(6,'newAccount1','188New1')";
//		DBManipulationImp insert= new DBManipulationImp();
//		insert.updateQuery(conn, insertManager);
		
		DBManipulationImp select = new DBManipulationImp();
		String selectQuery = "select * from manager";
		ResultSet result = select.executeQuery(conn, selectQuery);
		try {
			while(result.next()) {
				System.out.println(result.getInt(1)+" "+result.getString(2)+" "+result.getString(3));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		result = select.executeQuery(conn, selectQuery);
		try {
			while(result.next()) {
				System.out.println(result.getInt(1)+" "+result.getString(2)+" "+result.getString(3));
			}
		} catch (SQLException e) {
			e.printStackTrace();}
		

	}

}
