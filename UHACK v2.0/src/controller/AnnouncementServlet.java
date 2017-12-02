package controller;

import java.io.IOException;
import java.sql.DriverManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Announcements;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

import utility.CookieHelper;

@WebServlet("/announcementservlet")
public class AnnouncementServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Cookie foundCookie = CookieHelper.getCookie(request.getCookies());
		
		if(foundCookie.getValue() == null){
			
			try{
				Announcements an = new Announcements();
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/uhack", "root", "password");
				String sql = "insert into announcements "
						+ "(date, time, description)" + "values(?, ?, ?, ?)";
				
				PreparedStatement stmt = (PreparedStatement) con.prepareStatement(sql);
				
				
				
				stmt.setString(1, an.getDate());
				stmt.setString(2, an.getTime());
				stmt.setString(3, an.getDescription());
	
				stmt.executeUpdate();
				
				response.sendRedirect("dashboard.jsp");
		
			}catch(Exception e){
				response.sendRedirect("errorannouncement.html");
				System.out.println("error in creating announcement");
				e.printStackTrace();
			}
			response.sendRedirect("dashboard.jsp");
		
		}else{
			response.sendRedirect("login.html");
		}
		
	}

}
