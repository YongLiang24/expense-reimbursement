<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<script src="Employee.js" defer></script>
<%@ include file="ExternalLinks.jsp" %>
<%@ page import="java.sql.SQLException,java.sql.ResultSet,com.yongliang.dbmanipulation.*,
com.yongliang.java.Employee, javax.servlet.http.HttpSession, 
java.util.ArrayList, java.sql.Connection, com.yongliang.java.*" %>
<title>Insert title here</title>
</head>
<body>
<!-- Nav bar components -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
        <div class="container">
            <a href="" class="invisible">xxxxxxxx</a>
        <a class="navbar-brand" id="brand">ER-System</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <a href="" class="invisible">xxx</a>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <!-- Emp ul buttons -->
          <ul class="navbar-nav mr-auto" id="emp-nav" >
              <a href="" class="invisible">xxx</a>
            <li class="nav-item active"><a class="nav-link" href="#" id="nav01">My Home</a></li>
            <a ref="" class="invisible">xxx</a>
            <li class="nav-item"><a class="nav-link" href="#" id="nav02">Submit Requests</a></li>
            <a ref="" class="invisible">xxx</a>
            <li class="nav-item"><a class="nav-link" href="#" id="nav03">View Requests</a></li>
            <a ref="" class="invisible">xxx</a>
            <li class="nav-item"><a class="nav-link" href="#" id="nav04">My Profile</a></li>
          </ul>
         
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
		<form>
          <button type="button" class="btn btn-dark" id="logout" >Logout</button>
		</form>
        </div>
    </div>
      </nav>
      
      <div>
      <!-- Personal Information -->
            <div class="card text-center " id="personal-info">
              <div class="card-header">Personal Information</div>
              <div class="card-body">
                <form action="EIS" method="POST">
                  <div class="form-group">
                  <label for="first-name">Full Name:</label>
                  <input type="text" value="<%=emp.getFullName() %>" name="fullname">
                  <br/>
                  <label for="email">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspEmail:</label>
                  <input type="email" value="<%=emp.getEmail() %>" name="email" readonly>
                  <br/>
                  <label for="phone">&nbsp&nbsp&nbspPhone #:</label>
                  <input type="tel" value="<%= emp.getTelephone() %>" name="phone">
                  <br/>
                  <label for="street">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspStreet:</label>
                  <input type="text" value="<%= emp.getStreet() %>" name="street">
                  <br/>
                  <label for="city">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspCity:</label>
                  <input type="text" value="<%= emp.getCity() %>" name="city">
                  <br/>
                  <label for="state">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspState:</label>
                  <input type="text" value="<%= emp.getState() %>" name="state">
                  <br/>
                  <label for="country">&nbsp&nbsp&nbsp&nbspCountry</label>
                  <input type="text" value="<%= emp.getCountry() %>" name="country">
                  <br/>
                  <label for="zip">&nbsp&nbspZip Code:</label>
                  <input type="number" value="<%=emp.getZipcode() %>" name="zip">
                  <br/>    
                  <input type="hidden" value="<%= emp.getEmpId()%>" name="empId">
                  <input type="submit" id="info-submit" value="Update">
                </div>
                </form>
              </div>
            </div>
      
      </div>
</body>
</html>