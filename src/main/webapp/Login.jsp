<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@ include file="ExternalLinks.jsp" %>
<title>Insert title here</title>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
        <div class="container">
        <a class="navbar-brand" id="brand">ER-System</a>
    	</div>
      </nav>
      <br/><br/><br/>
<div class="card border-dark mb-3 mx-auto shadow p-3 mb-5 bg-white rounded" style="max-width: 18rem;" id="login-card">
    <div class="card-body text-dark mx-auto">
     <form action="ELS" method="POST">
         <label for="email" class="login-input" >Email address</label>
         <input name="email" type="email" id="email" class="form-control" placeholder="Email" required>
         <label  for="password" class="login-input">Password</label>
         <input name="password" type="password" id="password"class="form-control" required placeholder="Password"><br/>
         <label for="emp-type" id="user-dropdown">Log in as:</label>
         <select name="loginSelect" id="emp-type" required>
             <option value="default" selected disabled hidden>Select an option</option>
             <option  value="employee">Employee</option>
             <option  value="manager">Manager</option>
         </select><hr/>
         <button type="submit" class="btn btn-primary btn-sm btn-block">Log in</button>
        </form>
    </div>
  </div>
</body>
</html>