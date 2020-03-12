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
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		String expenseSelect = request.getParameter("expense-select");
		String expenseText = request.getParameter("expense-text");
		String expenseCost = request.getParameter("expense-cost");
		String requestStatus = "pending";
		String reimbAmount="pending";
		Date d1 = new Date();
		String d2 = d1.toString();
		String autopk="Autopk1.nextval";
		HttpSession session = request.getSession();
		Employee emp =(Employee)session.getAttribute("empInfo");
		System.out.println(emp.getFullName());
		try {
			 conn = DBConnection.getInstance().getConnection();
		} catch (SQLException e) {
		}
		//insert new requests to reimbursement table
		String empInsertQuery = "insert into Reimbursement values("+autopk+","+emp.getEmpId()+", '"+expenseSelect+"' , '"+expenseText+"','"+expenseCost+"','"+requestStatus+"','"+reimbAmount+"','"+d2+"', '"+emp.getFullName()+"')";
		DBManipulationImp empUpdate = new DBManipulationImp();
		empUpdate.updateQuery(conn, empInsertQuery);
		if(DBManipulationImp.connStatus ==1) {
		out.print("<html><body style='background-image: linear-gradient(#fff, #2C5364);\r\n" + 
				"    background-repeat: no-repeat;\r\n" + 
				"  	background-attachment: fixed;'>");
		out.print("<div style='text-align:center;'>");
		out.print("<br/><h3>Your reimbursement request has been created</h3>");		
		out.print("<br/>");
		out.print("<form action='./REH' method='POST'> ");
		out.print("<input type='submit' value='Return' />");
		out.print("</form>");
		out.print("</div></body></html>");
		}else {
			out.print("<html><body style='background-image: linear-gradient(#fff, #2C5364);\r\n" + 
					"    background-repeat: no-repeat;\r\n" + 
					"  	background-attachment: fixed;'>");
			out.print("<div style='text-align:center;'>");
			out.print("<br/><h3>Error occured, your request was not submitted</h3>");		
			out.print("<br/>");
			out.print("<form action='./REH' method='POST'> ");
			out.print("<input type='submit' value='Return' />");
			out.print("</form>");
			out.print("</div></body></html>");
			
		}
		//request.getRequestDispatcher("./Employee.jsp").include(request, response);
	}
}
