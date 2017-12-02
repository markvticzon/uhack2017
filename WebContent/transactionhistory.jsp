<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>

<html>
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
			<td>Merchant</td>
		</tr>
		
		<tr>
	<%
	
	String studentName = request.getSession().getAttribute("student").toString();
	String serviceBought;
	double price;
	String merchantName;
	String timeStamp;
	
	try {
		
		Class.forName("com.mysql.jdbc.Driver");
		
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/uhack", "root", "password");
		PreparedStatement pstmtService = con.prepareStatement("SELECT service FROM transaction history WHERE 'studentName == studentName'");
		PreparedStatement pstmtPrice = con.prepareStatement("SELECT service FROM transaction history WHERE 'studentName == studentName'");
		PreparedStatement pstmtMerchantName = con.prepareStatement("SELECT merchantName FROM transaction history WHERE 'studentName == studentName'");;
		PreparedStatement pstmtTimeStamp = con.prepareStatement("SELECT timestamp FROM transaction history WHERE 'studentName == studentName'");;
		
		ResultSet rs = pstmtService.executeQuery(); 
		while(rs.next()){
			serviceBought = rs.getString("service");
			out.println("<td>"+ serviceBought +"<td>");
		}
		
		rs = pstmtPrice.executeQuery();
		while(rs.next()){
			price = rs.getDouble("price");
			out.println("<td>"+ price +"<td>");
		}
		
		rs = pstmtMerchantName.executeQuery();
		while(rs.next()){
			merchantName = rs.getString("merchantName");
			out.println("<td>"+ merchantName +"<td>");
		}
		
		rs = pstmtTimeStamp.executeQuery();
		while(rs.next()){
			timeStamp = rs.getString("timestamp");
			out.println("<td>"+ timeStamp +"<td>");
		}
		
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
		System.err.println("LoginServlet - login: class not found");
		
	} catch (SQLException e) {
		System.err.println("LoginServlet - login: SQL exception");
	}
	
	

%>
		</tr>
			
	
	</table>

</body>
</html>