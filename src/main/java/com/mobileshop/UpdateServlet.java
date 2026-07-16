package com.mobileshop;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/update")
public class UpdateServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response)
			throws ServletException, IOException {

		try {

			int id =
			Integer.parseInt(request.getParameter("id"));

			Connection con =
			DBConnection.getConnection();

			PreparedStatement ps =
			con.prepareStatement(
			"update mobiles set brand=?,model=?,price=?,quantity=?,ram=?,storage=?,color=? where id=?");

			ps.setString(1, request.getParameter("brand"));
			ps.setString(2, request.getParameter("model"));
			ps.setDouble(3,
			Double.parseDouble(request.getParameter("price")));
			ps.setInt(4,
			Integer.parseInt(request.getParameter("quantity")));
			ps.setString(5, request.getParameter("ram"));
			ps.setString(6, request.getParameter("storage"));
			ps.setString(7, request.getParameter("color"));
			ps.setInt(8, id);

			ps.executeUpdate();

			con.close();

			response.sendRedirect("view.jsp");

		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}