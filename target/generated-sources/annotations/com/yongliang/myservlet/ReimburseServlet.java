package com.yongliang.myservlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yongliang.dbmanipulation.DBManipulationImp;
import com.yongliang.java.DBConnection;
import com.yongliang.java.Employee;

/**
 * Servlet implementation class ReimburseServlet
 */
public class ReimburseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection conn=null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReimburseServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String expenseSelect = request.getParameter("expense-select");
		String expenseText = request.getParameter("expense-text");
		String expenseCost = request.getParameter("expense-cost");
		String requestStatus = "false";
		int reimbAmount=0;
		Date d1 = new Date();
		String d2 = d1.toString();
		String autopk="Autopk1.nextval";
		HttpSession session = request.getSession();
		Employee emp =(Employee)session.getAttribute("empInfo");
		try {
			 conn = DBConnection.getInstance().getConnection();
		} catch (SQLException e) {
		}
		//insert new requests to reimbursement table
		String empInsertQuery = "insert into Reimbursement values("+autopk+","+emp.getEmpId()+", '"+expenseSelect+"' , '"+expenseText+"','"+expenseCost+"','"+requestStatus+"','"+reimbAmount+"','"+d2+"')";
		DBManipulationImp empUpdate = new DBManipulationImp();
		empUpdate.updateQuery(conn, empInsertQuery);		
		request.getRequestDispatcher("./Employee.jsp").forward(request, response);
	}
}
