<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@ include file="ExternalLinks.jsp" %>
 <link rel="stylesheet" href="Style.css">
<title>ER-Solutions</title>
</head>
<body class="body_">
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
        <div class="container">
        <a class="navbar-brand" id="brand">ER-Solutions</a>
    	</div>
      </nav>
      <br/><br/>
<div class="card mx-auto  body_" id="login-card">
    <div class="card-body text-dark mx-auto">
     <form action="EH" method="POST">
         <label for="email" class="login-input font-weight-bold" >Account Name</label>
         <input name="email" type="text" id="email" class="form-control bg-light" required placeholder="account name">
         <label  for="password" class="login-input font-weight-bold">Password</label>
         <input name="password" type="password" id="password"class="form-control bg-light" required placeholder="password"><br/>
         <label for="emp-type" id="user-dropdown" class="font-weight-bold">Log in as:</label>
         <select name="loginSelect" id="emp-type" required class="bg-light rounded">
             <option  value="employee">Employee</option>
             <option  value="manager">Manager</option>
         </select><hr/>
         <button type="submit" class="btn btn-primary btn-sm btn-block" title="admin/123, email/123">Log in</button>
        </form>
    </div>
  </div>
</body>
</html>