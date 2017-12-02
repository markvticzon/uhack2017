package controller;

import java.io.IOException;
import java.sql.DriverManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

/**
 * Servlet implementation class AnnouncementServlet
 */
@WebServlet("/announcement.html")
public class AnnouncementServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession sessionUser  = (HttpSession) request.getSession(false).getAttribute("student");
		System.out.println(sessionUser);
		if(sessionUser == null){
			response.sendRedirect("index.jsp");
		}else {
			//query here :)
			try{
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/uhack", "root", "password");
				String sql = "insert into announcements "
						+ "(announcements, date, time, description)" + "values(?, ?, ?, ?, ?)";
				
				PreparedStatement stmt = con.prepareStatement(sql);
				
				stmt.setString(1, ub.getUsername());
				stmt.setString(2, name);
				stmt.setString(3, ub.getEmail());
				stmt.setString(4, ub.getMobileNumber());
				stmt.setString(5, ub.getPassword());
				stmt.setString(6, ub.getVehicleType());
				stmt.setString(7, vehicle);
				stmt.setString(8, ub.getPlateNo());
				stmt.executeUpdate();
				
				response.sendRedirect("registersuccess.html");
		
			}catch(Exception e){
				response.sendRedirect("errorsignup.html");
				System.out.println("error in signup");
				e.printStackTrace();
			}
			response.sendRedirect("dashboard.jsp");
		}
	}

}
