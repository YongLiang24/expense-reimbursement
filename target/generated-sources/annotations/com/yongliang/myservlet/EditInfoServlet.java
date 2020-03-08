package com.yongliang.myservlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yongliang.dbmanipulation.DBManipulationImp;
import com.yongliang.java.DBConnection;

/**
 * Servlet implementation class EditInfoServlet
 */
public class EditInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 Connection conn=null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditInfoServlet() {
        super();
        // TODO Auto-generated constructor stub
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
		String fullname = request.getParameter("fullname");
		String phone= request.getParameter("phone");
		String street = request.getParameter("street");
		String city= request.getParameter("city");
		String state = request.getParameter("state");
		String country= request.getParameter("country");
		String zip = request.getParameter("zip");
		String empId = request.getParameter("empId");
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		try {
			 conn = DBConnection.getInstance().getConnection();
		} catch (SQLException e) {
		}
		//update employee information from employee table
		String empUpdateQuery = "update employees set full_name='"+fullname+"', telephone='"+phone+"', street='"+street+"', city='"+city+"', state='"+state+"', zip_code='"+zip+"', country='"+country+"' where employee_id="+empId;
		DBManipulationImp empUpdate = new DBManipulationImp();
		empUpdate.updateQuery(conn, empUpdateQuery);
		
		out.print("<html><body style='background-image: linear-gradient(#fff, #2C5364);\r\n" + 
				"    background-repeat: no-repeat;\r\n" + 
				"  	background-attachment: fixed;'>");
		out.print("<div style='text-align:center;'>");
		out.print("<br/><h3>Your profile has updated</h3>");		
		out.print("<br/>");
		out.print("<form action='REH' method='POST'> ");
		out.print("<input type='submit' value='Return' />");
		out.print("</form>");
		out.print("</div></body></html>");
		
	}

}
