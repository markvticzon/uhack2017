package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import model.StudentBean;

@WebServlet("/login.html")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	static Connection con;
	static PreparedStatement pstmt;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

			StudentBean sb = new StudentBean();
			
			sb.setName(request.getParameter("studentIdName"));
			sb.setPassword(request.getParameter("password"));	
			
			if(login(sb.getName(), sb.getPassword())){

				HttpSession studentSession = request.getSession();
				studentSession.setAttribute("student", sb.getName());
				
				System.out.println("LOGGED");
				
				request.setAttribute("ss", studentSession);
				request.getRequestDispatcher("dashboard.jsp").forward(request,response);
				
			}else{
				response.sendRedirect("loginfailed.html");
				System.out.println("FAILED");

			}

	}
	
	boolean login(String user, String password){
		
		boolean isLogged = false;
		
		try {
			
			Class.forName("com.mysql.jdbc.Driver");
			
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/uhack", "root", "password");
			pstmt = con.prepareStatement("SELECT * FROM students");
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()){
				if((user.equals(rs.getString("studentNo")) || user.equals(rs.getString("email"))) && password.equals(rs.getString("password"))){
					isLogged = true;
					break;

				}else{
					isLogged = false;
				}
			}
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			System.err.println("LoginServlet - login: class not found");
			
		} catch (SQLException e) {
			System.err.println("LoginServlet - login: SQL exception");
		}
		
		System.out.println(isLogged);
		return isLogged;
	}
}
