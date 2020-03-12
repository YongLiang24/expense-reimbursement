package com.yongliang.dbmanipulation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBManipulationImp implements DBManipulationDao{
	public static int connStatus=0;
	@Override
	public ResultSet executeQuery(Connection conn, String query) {
		ResultSet tempResult=null;
		PreparedStatement preSt=null;
		ResultSet resultSet=null;
		try {
			preSt=conn.prepareStatement(query);
			resultSet = preSt.executeQuery();
			tempResult = resultSet;
			resultSet =null;
			tempResult.getString(1);
			//conn.close();
		} catch (SQLException e) {
		
		}
		return tempResult;
	}


	@Override
	public void updateQuery(Connection conn, String query) {
		PreparedStatement preSt=null;
		try {
			preSt=conn.prepareStatement(query);
			int checkUpdate =preSt.executeUpdate();
			System.out.println("UpdateQuery status:" +checkUpdate);
			connStatus =1;
		} catch (SQLException e) {
			System.out.println("update failed");
		}
		
	}
	

}
