package com.yongliang.jackson;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import com.yongliang.dbmanipulation.DBManipulationImp;
import com.yongliang.java.*;
@Path("/reim")
public class RestJackson {
	@GET
	@Path("/{id}")
	@Produces(MediaType.APPLICATION_JSON)
	
	public ArrayList<Reimbursement> request() {
		ArrayList<Reimbursement> reimbList = new ArrayList<Reimbursement>();
		Reimbursement reimb;
		Connection conn = null;
		try {
			 conn = DBConnection.getInstance().getConnection();
		} catch (SQLException e) {
		}
		//select reimbursement information from employee table then add them to an arraylist of employee type
		String reimbQuery = "select * from reimbursement";
		DBManipulationImp select = new DBManipulationImp();
		ResultSet result = select.executeQuery(conn, reimbQuery);
		try {
			while(result.next()) {
				reimb = new Reimbursement(result.getInt(1), result.getInt(2), result.getString(3),result.getString(4),result.getString(5),result.getString(6),result.getString(7),result.getString(8), result.getString(9));
				reimbList.add(reimb);
			}
		} catch (SQLException e) {
		}

		return reimbList;
	}
}
