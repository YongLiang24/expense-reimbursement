package com.yongliang.myservlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.yongliang.java.*;
import com.yongliang.dbmanipulation.*;

/**
 * Servlet implementation class EmpLoginServlet
 */
public class EmpLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    Manager manager;
    Employee employee;
    Connection conn=null;
    ArrayList<Employee> empList = new ArrayList<Employee>();
    ArrayList<Manager> managerList= new ArrayList<Manager>();
    static final Logger logger = LogManager.getLogger(EmpLoginServlet.class);
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmpLoginServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		response.setContentType("text/html");
//		PrintWriter out=response.getWriter();
		//retrieving data from database, then add each row to employee and manager objects
		try {
			 conn = DBConnection.getInstance().getConnection();
		} catch (SQLException e) {
		}
		//select employee information from employee table then add them to an arraylist of employee type
		String empQuery = "select * from Employees";
		DBManipulationImp select = new DBManipulationImp();
		ResultSet result1 = select.executeQuery(conn, empQuery);
		try {
			while(result1.next()) {
				employee = new Employee(result1.getInt(1), result1.getString(2),result1.getString(3),result1.getString(4),result1.getString(5),result1.getString(6),result1.getString(7),result1.getString(8),result1.getString(9),result1.getString(10));
				empList.add(employee);
			}
		} catch (SQLException e) {
		}
		
		//select manager information and add them to an arraylist
		String managerQuery="select * from Manager";
		ResultSet result2 = select.executeQuery(conn, managerQuery);
		try {
			while(result2.next()) {
				manager= new Manager(result2.getInt(1), result2.getString(2),result2.getString(3));
				managerList.add(manager);
			}
		} catch (SQLException e) {
		}

		//saving the empList and managerList to sessions
		HttpSession session =request.getSession();
		session.setAttribute("empAll", empList);
		session.setAttribute("managerAll", managerList);

		logger.info("adds employee and manager lists to session variables");
		try {
			conn.close();
		} catch (SQLException e) {
		}
		
		
		request.getRequestDispatcher("./Login.jsp").forward(request, response);
		
	}

}
