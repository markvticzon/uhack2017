<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import = "java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet, java.sql.SQLException;" %>
    
    <%
    
		try {
		
			Class.forName("com.mysql.jdbc.Driver");
		
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/", "root", "password");
			PreparedStatement pstmt = con.prepareStatement("SELECT * FROM students");
			ResultSet rs = pstmt.executeQuery();
		
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			System.err.println("LoginServlet - login: class not found");
		
		} catch (SQLException e) {
			System.err.println("LoginServlet - login: SQL exception");
		}
    
    %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<table>
	
		<tr>
		
	</table>

</body>
</html>