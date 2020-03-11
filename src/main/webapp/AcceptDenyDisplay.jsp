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
<body>
          <%   
          	ArrayList<Reimbursement> requestList = new ArrayList<Reimbursement>();
        	Connection conn = DBConnection.getInstance().getConnection();
        	
    		String reimbQuery = "select * from Reimbursement where status='pending'";
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
          
          <div class="text-center container-fluid">
		   
                <table class="table table-bordered table-hover" >
                    <thead>               
                        <tr >
                        	<th scope="col">Employee</th>
                        	<th scope="col">Date</th>      
                            <th scope="col">Expense</th>                         
                            <th scope="col">Type</th> 
                            <th scope="col">Reimburse</th>
                            <th scope="col">Action</th>
                            <th scope="col">Confirm</th>                       
                        </tr>
                    </thead>
                    <tbody>
                    <% for(Reimbursement reimb: requestList){ 
                    	                	
                    %>
                    <tr>
                    	  <td ><%= reimb.getCreatedBy() %></td>
                          <td title="Reason: <%= reimb.getExpenseDescription()%>"><%=reimb.getDateTime() %></td>
                          <td>$<%= reimb.getExpenseCost()%></td>
                          <td><%= reimb.getExpenseType()%></td> 
                          <form action="ADS" method="POST">
                          <td>$<input name="reimb-amount" type="number" placeholder="<%= reimb.getReimbAmount()%>" min="0" required></td>
                          <td>
                          <select name="accept-deny" id="emp-type" required class="bg-light rounded">
             				<option  value="accpet">Accept</option>
             				<option  value="deny">Deny</option>
         				  </select>          
                          </td>
                          <td><input type="submit" value="Submit"></td>
                          </form>                                              
                        </tr>    
                        <%} %>                   
                      </tbody>
                </table>
                 <%if(requestList.isEmpty()){ %>
                        	<p class="text-danger font-italic" style="font-size: 130%;">No reimbursement requests available</p>
                        <%} %>
             <form action="RMH" method="POST">
                	<button type="submit" class="btn btn-dark">Return</button>
                </form>
            </div>
          
</body>
</html>