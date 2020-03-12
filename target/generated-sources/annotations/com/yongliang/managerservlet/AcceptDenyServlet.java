package com.yongliang.managerservlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yongliang.dbmanipulation.DBManipulationImp;
import com.yongliang.java.DBConnection;

/**
 * Servlet implementation class AcceptDenyServlet
 */
public class AcceptDenyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 Connection conn=null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AcceptDenyServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String reimbAmount = request.getParameter("reimb-amount");
		String acceptDeny = request.getParameter("accept-deny");
		String reimbId = request.getParameter("reimb-id");
		
		try {
			 conn = DBConnection.getInstance().getConnection();
		} catch (SQLException e) {
		}
		//update employee information from employee table
		String empUpdateQuery = "update reimbursement set status='"+acceptDeny+"', reimb_amount='"+reimbAmount+"'  where reimb_id="+reimbId;
		DBManipulationImp empUpdate = new DBManipulationImp();
		empUpdate.updateQuery(conn, empUpdateQuery);
		PrintWriter out=response.getWriter();
		out.print("<html><body style='background-repeat: no-repeat; background-attachment: fixed;'>");
		out.print("<div style='text-align:center;'>");
		out.print("<br/><h3>Request submmited successfully</h3>");		
		out.print("<br/>");
		out.print("<form action='RMH' method='POST'> ");
		out.print("<input type='submit' value='Return' />");
		out.print("</form>");
		out.print("</div></body></html>");
	}

}
