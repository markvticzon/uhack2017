<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	
	<%
	
		if(request.getSession(false) == null){
	
	%>

	<form action = "login.html" method = "POST">
	
		<table>
		
			<tr>
				<td>Email/Student No: </td>
				<td><input type = "text" name = "studentIdName" required></td>
			</tr>
			
			<tr>
				<td>Password: </td>
				<td><input type = "password" name = "password" required></td>
			</tr>
			
			<tr>
				<td><input type = "submit" value = "Login"></td>
				<td><input type = "reset" value = "Clear"></td> 
			</tr>
		
		</table>
	
	</form>
	
	<%
		}else{
			response.sendRedirect("dashboard.html");
		}

	%>

</body>
</html>