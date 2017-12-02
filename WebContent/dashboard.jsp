<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Dashboard</title>
</head>

	<!-- Annoucnements retrieval -->
	<!-- Admin -->
	<a href='logout.html'>Logout</a>
	 <h3>Upload poster:</h3>
      Select a file to upload: <br />
      <form action = "Announcements" method = "post"
         enctype = "multipart/form-data">
         
         <!-- File upload -->
         <input type = "file" name = "file" size = "50" />
         <br />
         <input type = "submit" value = "Upload File" />
      </form>
      
      <form action = "Announcements" method = "post">
      	<p>Announcements</p>
     	Place: <input type = "text" name="venue"/>
     	Date: <input type = "date" name="date"/>
     	Time: <input type ="time" name = "time"/>
     	Description: <input type = "description" name ="description"/>
      
      </form>
	

<body>

</body>
</html>