package com.mobileshop;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response)
			throws ServletException, IOException {

		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String role = request.getParameter("role");

		try {

			Connection con = DBConnection.getConnection();

			PreparedStatement ps =
			con.prepareStatement(
			"select * from users where username=? and password=? and role=?");

			ps.setString(1, username);
			ps.setString(2, password);
			ps.setString(3, role);

			ResultSet rs = ps.executeQuery();

			if(rs.next()){

				HttpSession session = request.getSession();

				session.setAttribute("admin", username);

				session.setAttribute("role", role);

				if(role.equals("admin")){

					response.sendRedirect("dashboard.jsp");

				}else{

					response.sendRedirect("userdashboard.jsp");

				}

			}else{

				response.sendRedirect("login.jsp?error=invalid");

			}

			con.close();

		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}