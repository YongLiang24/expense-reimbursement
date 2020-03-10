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
          <button class="btn btn-dark" ><a class="nav-link" href="http://localhost:8080/Project01" id="logout">Logout</a></button>
        </div>
    </div>
      </nav>
      <!--Main Content  -->
      <div class="container" style="margin-top: 55px;">
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
         
      	    <div id="welcome-page">
            <br/><br/>
                <h2 class="time">Welcome admin</h2><br/>
                <h2 class="time" id="time" ></h2><br/><hr/>
                <h5 class="time">What would you like to do today?</h3>
            </div>
      	
      
      </div>
      
      
      
      
      
      
      
      
      
</body>
</html>