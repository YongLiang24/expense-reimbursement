<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="Style.css">
<script src="Employee.js" defer></script>
<%@ include file="ExternalLinks.jsp" %>
<%@ page import="java.util.List,java.util.Collections,java.sql.SQLException,java.sql.ResultSet,com.yongliang.dbmanipulation.*,
com.yongliang.java.Employee, javax.servlet.http.HttpSession, 
java.util.ArrayList, java.sql.Connection, com.yongliang.java.*" %>
<title>ER-Solutions</title>
</head>
<body id="body_">
          <%   
          	ArrayList<Reimbursement> requestList = new ArrayList<Reimbursement>();
  			Employee empSession = (Employee) session.getAttribute("empInfo");
        	Connection conn = DBConnection.getInstance().getConnection();
        	int index=0;
        	boolean isEmptyList =true;
    		String reimbQuery = "select * from Reimbursement where employee_id="+empSession.getEmpId();
    		DBManipulationImp select = new DBManipulationImp();
    		ResultSet result = select.executeQuery(conn, reimbQuery);   
    		try {
    			while(result.next()) {
    				Reimbursement reimb = new Reimbursement(result.getInt(1), result.getInt(2),result.getString(3),result.getString(4),result.getString(5),result.getString(6),result.getString(7),result.getString(8), result.getString(9));	
    				requestList.add(reimb);
    			}
    		} catch (SQLException e) {
    		} 
    		Collections.sort(requestList);	 		
          %>
		<div class="text-center">
		   
                <table class="table table-bordered table-hover" >
                    <thead>               
                        <tr >
                        	<th scope="col">#</th>
                        	<th scope="col">Date</th>      
                            <th scope="col">Expense Amount</th>
                            <th scope="col">Reimburse Amount</th>
                            <th scope="col">Type</th> 
                            <th scope="col">Status</th>                       
                        </tr>
                    </thead>
                    <tbody>
                    <% for(Reimbursement reimb: requestList){ 
                    	index++;                 	
                    %>
                    <%if(reimb.getRequestStatus().equals(request.getParameter("status1"))){ 
                    isEmptyList =false;
                    %>
                    <tr>
                    	  <th scope="row" ><%= index %>.</th>
                          <td title="Reason: <%= reimb.getExpenseDescription()%>"><%=reimb.getDateTime() %></td>
                          <td>$<%= reimb.getExpenseCost()%></td>
                          <td>$<%= reimb.getReimbAmount()%></td>
                          <td><%= reimb.getExpenseType()%></td>
                          <td><%=reimb.getRequestStatus() %></td>                                                    
                        </tr>   
                             <%} %>    
                        <%} %>                   
                      </tbody>
                </table>
                 <%if(isEmptyList){ %>
                        	<p class="text-danger font-italic" style="font-size: 130%;">No reimbursement requests available</p>
                        <%} %>
             <form action="REH" method="POST">
                	<button type="submit" class="btn btn-dark">Return</button>
                </form>
            </div>
</body>
</html>