package com.yongliang.jackson;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import com.yongliang.dbmanipulation.DBManipulationImp;
import com.yongliang.java.DBConnection;
import com.yongliang.java.*;

@Path("/emp")
public class EmpJackson {
	@GET
	@Path("/{id}")
	@Produces(MediaType.APPLICATION_JSON)
	
	public ArrayList<Employee> showEmployee() {
		ArrayList<Employee> empList = new ArrayList<Employee>();
		Employee emp;
		Connection conn = null;
		try {
			 conn = DBConnection.getInstance().getConnection();
		} catch (SQLException e) {
		}
		//select reimbursement information from employee table then add them to an arraylist of employee type
		String empQuery = "select * from employees";
		DBManipulationImp select = new DBManipulationImp();
		ResultSet result = select.executeQuery(conn, empQuery);
		try {
			while(result.next()) {

				emp = new Employee(result.getInt(1), result.getString(3), result.getString(4),result.getString(5),result.getString(6),result.getString(7),result.getString(8),result.getString(9), result.getString(10));
				empList.add(emp);
			}
		} catch (SQLException e) {
		}

		return empList;
	}
}
