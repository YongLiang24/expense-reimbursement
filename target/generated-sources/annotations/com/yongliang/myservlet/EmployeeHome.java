package com.yongliang.myservlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yongliang.java.Employee;
import com.yongliang.java.Manager;

/**
 * Servlet implementation class EmployeeHome
 */
public class EmployeeHome extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmployeeHome() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//get login information from user inputs
		String loginSelect = request.getParameter("loginSelect");
		String userEmail = request.getParameter("email");
		String userPass = request.getParameter("password");
		HttpSession session = request.getSession();
		ArrayList<Employee> empList = (ArrayList)session.getAttribute("empAll");
		ArrayList<Manager> managerList = (ArrayList)session.getAttribute("managerAll");
		switch(loginSelect) {
		case "employee":
			
			for(Employee emp: empList) {
				if(emp.getEmail().toLowerCase().equals(userEmail.toLowerCase()) && emp.getEmpPass().equals(userPass)) {
					System.out.println("Login success");
					//save this particular user to a session
					Employee emp1 = new Employee(emp.getEmpId(), emp.getEmpPass(), emp.getFullName(), emp.getTelephone(), emp.getEmail(),emp.getStreet(),emp.getCity(),emp.getState(),emp.getZipcode(),emp.getCountry());
					session.setAttribute("empInfo", emp1);
					request.getRequestDispatcher("./Employee.jsp").forward(request, response);
				}else {
					request.getRequestDispatcher("./LoginFail.jsp").forward(request, response);
				}
			}
			break;
		case "manager":
			
			for(Manager manager: managerList) {
				if(manager.getManagerAccount().toLowerCase().equals(userEmail.toLowerCase()) && manager.getManagerPass().toLowerCase().equals(userPass)) {
					System.out.println("manager login success");
					//save this particular user to a session
					Manager manager1 = new Manager(manager.getManagerId(), manager.getManagerAccount(), manager.getManagerPass());
					session.setAttribute("managerInfo", manager1);
					request.getRequestDispatcher("./Manager.jsp").forward(request, response);
				}
				else {
					request.getRequestDispatcher("./LoginFail.jsp").forward(request, response);
				}
			}
		break;
		default: 
			break;
	}
	}

}
