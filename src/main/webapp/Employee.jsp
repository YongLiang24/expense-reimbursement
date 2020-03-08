<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="Style.css">
<script src="Employee.js" defer></script>
<%@ include file="ExternalLinks.jsp" %>
<%@ page import="java.sql.SQLException,java.sql.ResultSet,com.yongliang.dbmanipulation.*,
com.yongliang.java.Employee, javax.servlet.http.HttpSession, 
java.util.ArrayList, java.sql.Connection, com.yongliang.java.*" %>
<title>ER-Solutions</title>
</head>
<body class="body_">
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
            <li class="nav-item" id="navli02"><a class="nav-link" href="#" id="nav02">Submit Requests</a></li>
            <a ref="" class="invisible">xxx</a>
            <li class="nav-item" id="navli03"><a class="nav-link" href="#" id="nav03">View Requests</a></li>
            <a ref="" class="invisible">xxx</a>
            <li class="nav-item" id="navli04"><a class="nav-link" href="#" id="nav04">My Profile</a></li>
          </ul>
          <button class="btn btn-dark" ><a class="nav-link" href="http://localhost:8080/Project01" id="logout">Logout</a></button>
        </div>
    </div>
      </nav>
      
      <div id="main-content">
                <%        
  			Employee empSession = (Employee) session.getAttribute("empInfo");
        	Connection conn = DBConnection.getInstance().getConnection();
        	Employee emp=null;
    		String empQuery = "select * from Employees";
    		DBManipulationImp select = new DBManipulationImp();
    		ResultSet result1 = select.executeQuery(conn, empQuery);
    		try {
    			while(result1.next()) {
    				if(result1.getInt(1)==empSession.getEmpId()){
        				emp = new Employee(result1.getInt(1), result1.getString(2),result1.getString(3),result1.getString(4),result1.getString(5),result1.getString(6),result1.getString(7),result1.getString(8),result1.getString(9),result1.getString(10));
    				}				
    			}
    		} catch (SQLException e) {
    		}      
    		
          %>
      <!-- Welcome page -->
            <div id="welcome-page">
            <br/><br/>
                <h2 class="time">Welcome <%=emp.getFullName() %></h2><br/>
                <h2 class="time" id="time" ></h2><br/><hr/>
                <h5 class="time">What would you like to do today?</h3>
            </div>
            
      <!-- Personal Information -->
            <div class="card text-center body_" id="personal-info">
              <div class="card-body">    
              <br/>        
              <div class="font-weight-bold text-dark"><h4>Personal Information</h4></div>
                <form action="EIS" method="POST">
                  <div class="form-group ">
                  <label for="first-name" class="text-dark font-weight-bold ">Full Name:</label>
                  <input type="text" value="<%=emp.getFullName() %>" name="fullname" class="body_ text-dark font-weight-bold">
                  <br/>
                  <label for="email" class="text-dark font-weight-bold">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspEmail:</label>
                  <input type="email" value="<%=emp.getEmail() %>" name="email" readonly class="body_ text-dark font-weight-bold">
                  <br/>
                  <label for="phone" class="text-dark font-weight-bold">&nbsp&nbsp&nbspPhone #:</label>
                  <input type="tel" value="<%= emp.getTelephone() %>" name="phone" class="body_ text-dark font-weight-bold">
                  <br/>
                  <label for="street" class="text-dark font-weight-bold">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspStreet:</label>
                  <input type="text" value="<%= emp.getStreet() %>" name="street" class="body_ text-dark font-weight-bold">
                  <br/>
                  <label for="city" class="text-dark font-weight-bold">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspCity:</label>
                  <input type="text" value="<%= emp.getCity() %>" name="city" class="body_ text-dark font-weight-bold">
                  <br/>
                  <label for="state" class="text-dark font-weight-bold">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspState:</label>
                  <input type="text" value="<%= emp.getState() %>" name="state" class="body_ text-dark font-weight-bold">
                  <br/>
                  <label for="country" class="text-dark font-weight-bold">&nbsp&nbsp&nbsp&nbspCountry</label>
                  <input type="text" value="<%= emp.getCountry() %>" name="country" class="body_ text-dark font-weight-bold">
                  <br/>
                  <label for="zip" class="text-dark font-weight-bold">&nbsp&nbspZip Code:</label>
                  <input type="number" value="<%=emp.getZipcode() %>" name="zip" class="body_ text-dark font-weight-bold">
                  <br/>    
                  <input type="hidden" value="<%= emp.getEmpId()%>" name="empId" class="body_ text-dark font-weight-bold">
                  <input type="submit" id="info-submit" value="Update" class="btn-info btn font-weight-bold text-dark">
                </div>
                </form>
              </div>
            </div>
      <br/>
              <!-- Submit Card -->
              <div class="card border-dark mb-3 mx-auto shadow p-3 mb-5 bg-white rounded" style="max-width: 38rem;" id="request-card">
                
                <div class="card-body text-dark mx-auto">
                <div class=" mx-auto"><strong>Reimbursement Request</strong></div><hr/>
                 <form action="RBS" id="request-form" method="POST">
                     <label for="emp-type" id="user-dropdown"><strong>Expense Type</strong></label>
                     <select name="expense-select" id="reimb-type" required>
                         <option value="">Choose</option>
                         <option value="travel">Travel</option>
                         <option value="lodging">Lodging</option>
                         <option value="meals">Meals</option>
                         <option value="certification">Certification</option>
                         <option value="other">Other</option>
                     </select><hr/>
                     <label for="spent-reason" class="login-input" ><strong>1. What did you spend on?</strong></label>
                     <textarea name="expense-text" maxlength="200" rows="4" id="spent-reason" class="form-control" placeholder="200 characters max" required></textarea>
                     <label for="cost" class="login-input"><strong> How much did you spend?</strong></label>
                     <input name="expense-cost" type="number" min="0" id="cost"class="form-control" required placeholder="Amount"><br/>
<!--                      <label for="file-attachment" class="font-weight-bold">Receipt</label> -->
<!--                      <input type="file" class="form-control-file" id="file-attachment"><br/> -->
                     <button type="submit" class="btn btn-primary btn-sm btn-block">Submit</button>
                    </form>
                </div>
                </div>
      
      
      <!-- Requsts form -->
                <div id="table_" class="text-center"></br>             
                <form action="RDR" method="POST">
                <input type="radio" value="pending" name="status1" id="pending" checked>
                <label for="pending" style="font-size: 120%; font-style:italic;">Pending</label>
                <input type="radio" value="resolved" name="status1" id="resolved">
                <label for="resolved" style="font-size: 120%; font-style:italic;">Resolved</label>
                 <input type="radio" value="declined" name="status1" id="declined">
                <label for="resolved" style="font-size: 120%; font-style:italic;">Declined</label>
                <hr/>
                <button type="submit" class="btn btn-dark" style="font-size: 120%; font-style:italic;">Show</button>
                </form> <br/>
                </div>
        
      
      
      
      </div>
</body>
</html>