<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ER-Solutions</title>
<%@ include file="ExternalLinks.jsp" %>
<link rel="stylesheet" href="Style.css">
<%@ page import="java.sql.SQLException,java.sql.ResultSet,com.yongliang.dbmanipulation.*,
com.yongliang.java.*, javax.servlet.http.HttpSession, 
java.util.ArrayList, java.sql.Connection, com.yongliang.java.*" %>
<script src="Manager.js" defer></script>
</head>
<body>
<!-- Nav bar components -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
        <div class="container">
            <a href="" class="invisible">xxxxxxxx</a>
        <a class="navbar-brand" id="brand">ER-Solutions</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <a href="" class="invisible">xxx</a>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <!-- Emp ul buttons -->
          <ul class="navbar-nav mr-auto" id="emp-nav" >
              <a href="" class="invisible">xxx</a>
            <li class="nav-item " id="navli01"><a class="nav-link" href="#" id="nav01">My Home</a></li>
            <a ref="" class="invisible">xxx</a>
            <li class="nav-item" id="navli02"><a class="nav-link" href="#" id="nav02">Manage Requests</a></li>
            <a ref="" class="invisible">xxx</a>
            <li class="nav-item" id="navli03"><a class="nav-link" href="#" id="nav03">View Requests</a></li>
            <a ref="" class="invisible">xxx</a>
            <li class="nav-item" id="navli04"><a class="nav-link" href="#" id="nav04">View Employees</a></li>
          </ul>
          <form action="ELSS"  method="POST">
          <button class="btn btn-dark" type="submit" id="emp-logout" style="font-style: italic">Logout</button>
          </form>
        </div>
    </div>
      </nav>
      <!--Main Content  -->
      <div class="container-fluid" style="margin-top: 55px;">
                      <%        
  			Employee empSession = (Employee) session.getAttribute("empInfo");
        	Connection conn = DBConnection.getInstance().getConnection();
        	Employee emp=null;
    		String empQuery = "select * from Employees";
    		DBManipulationImp select = new DBManipulationImp();
    		ResultSet result1 = select.executeQuery(conn, empQuery);
    		try {
    			while(result1.next()) {
        				emp = new Employee(result1.getInt(1), result1.getString(2),result1.getString(3),result1.getString(4),result1.getString(5),result1.getString(6),result1.getString(7),result1.getString(8),result1.getString(9),result1.getString(10));
    						
    			}
    		} catch (SQLException e) {
    		}  		
          %>
         <!--Welcome Page  -->
      	    <div id="welcome-page">
            <br/><br/>
                <h2 class="time">Welcome admin</h2><br/>
                <h2 class="time" id="time" ></h2><br/><hr/>
                <h5 class="time">What would you like to do today?</h3>
            </div>
           
           <!--Show Reimbursement  --> 
            <div id="reimb-table">        
            <div class="text-center">
		   <br/>
		   <form id="request-filter">
		   Filter: <a ref="" class="invisible">x</a>
		   	<input type="radio" id="approve" name="resolved" value="approve">
  			<label for="approve">Approved</label>
  			<input type="radio" id="reject" name="resolved" value="reject">
  			<label for="reject">Denied</label><br>
		   </form>
                <table class="table table-bordered table-hover" >
                    <thead >               
                        <tr >
                        	<th scope="col">Created By</th>
                        	<th scope="col">Date</th>      
                            <th scope="col">Expense Amount</th>
                            <th scope="col">Reimb Amount</th>
                            <th scope="col">Reason</th> 
                            <th scope="col">Status</th>                       
                        </tr>
                    </thead>
                    <tbody id="table-body">                                          
                    </tbody>
                </table>
            </div>
      	</div>
      	
      	<!--Show All Employees  --> 
            <div id="emp-table">        
            <div class="text-center">
		   <br/>
                <table class="table table-bordered table-hover" >
                    <thead >               
                        <tr >
                        	<th scope="col">ID</th>
                        	<th scope="col">Name</th>      
                            <th scope="col">Phone</th>
                            <th scope="col">Email</th>
                            <th scope="col">Address</th>
                            <th scope="col">View Requests</th>                       
                        </tr>
                    </thead>
                    <tbody id="empTable-body">                                          
                    </tbody>
                </table>
            </div>
      	</div>

  
  <!-- Modal -->
<div class="modal fade " id="view-modal" tabindex="-1" role="dialog" >
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header text-center">
        <h5 class="modal-title" id="Modal-Label">My Reimbursements</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body container" id="modal_">

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Dismiss</button>
      </div>
    </div>
  </div>
</div>
  <!--Manage Request Section  -->
  <div class="text-center" id="manage-request">
  <br/>
  <form action="MRS" method="POST">
  	<input type="submit" value="Display Requests">
  </form>
  </div>
  
      
      </div>   
</body>
</html>