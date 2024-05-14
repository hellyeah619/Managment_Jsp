<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file = "cdn.jsp" %>
<style>
	button{margin-top: 10px}
	h2{background-color: #f2f2f2;
	padding: 10px
	}
</style>
</head>
<body>
	<div class = "row">
	<div class = "col-md-4"></div>
	<div class = "col-md-4">
		<h2 >Login </h2>
		<form method = "post" action = "login.jsp" >
			<div class = "form-group">
				<label for = "username">Username:</label>
				<input type = "text" class = "form-control" id = "username" name = "username" placeholder = "Enter the username">
			</div>
			<div class = "form-group">
				<label for = "password">Password:</label>
				<input type = "password" class = "form-control" id = "password" name = "password" placeholder = "Enter the password">
			</div>
			<div>
				<label for = "department">Department</label>
				<select class = "form-control" id = "department" name = "department">
					<option value="" disabled selected>Select an option</option>
					<option value = "Managment">Managment</option>
					<option value = "Finance">Finance</option>
					<option value = "Legal">Legal</option>
				</select>
			</div>
			<button type = "submit" class = "btn btn-primary">Login</button>
		</form>
	</div></div>
</body>
</html>