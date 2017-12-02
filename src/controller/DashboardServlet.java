package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class DashboardServlet
 */
@WebServlet("/dashboard.html")
public class DashboardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static Connection con;
	static PreparedStatement pstmt;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		if(request.getSession() == null){
			response.sendRedirect("index.html");
		}else {
			response.sendRedirect("dashboard.jsp");
		}
	}

}
