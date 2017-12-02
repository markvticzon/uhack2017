<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>
<%@ page import = "utility.CookieHelper" %>

<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<h1 align = "center"><\ACCOUTN BALANCE HERE\></h1>
	
	<hr>
	
	<table align = "center">
	
		<tr>
			<td>Time stamp</td>
			<td>Service bought</td>
			<td>Price</td>
			<td>Merchant</td>
		</tr>
		
		<tr>
	<%
	
	Cookie foundCookie = CookieHelper.getCookie(request.getCookies());
	
	String studentID = foundCookie.getValue();
	String studentName;
	String serviceBought;
	double price;
	String merchantName;
	String timeStamp;
	
	try {
		
		Class.forName("com.mysql.jdbc.Driver");
		
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/uhack", "root", "password");
		PreparedStatement pstmtName = con.prepareStatement("SELECT * FROM students where name = 'studentID'");
		
		ResultSet rs = pstmtName.executeQuery();
		while(rs.next()){
			studentName = rs.getString("studentName");
			break;
		}
		
		PreparedStatement pstmt = con.prepareStatement("SELECT * FROM transactionHistory WHERE studentName = studentName");
		
		rs = pstmt.executeQuery(); 
		while(rs.next()){
			serviceBought = rs.getString("service");
			price = rs.getDouble("price");
			merchantName = rs.getString("merchantName");
			timeStamp = rs.getString("timestamp");
			
			out.println("<td>"+ price +"<td>");
			out.println("<td>"+ merchantName +"<td>");
			out.println("<td>"+ timeStamp +"<td>");
		}	
%>
		</tr>
			
	</table>
	
	<%
	
	
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			System.err.println("LoginServlet - login: class not found");
	
		} catch (SQLException e) {
			e.printStackTrace();
			System.err.println("LoginServlet - login: SQL exception");
	}
	
	%>

</body>
</html>