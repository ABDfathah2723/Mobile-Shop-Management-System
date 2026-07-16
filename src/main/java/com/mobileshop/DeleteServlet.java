package com.mobileshop;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/delete")
public class DeleteServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response)
			throws ServletException, IOException {

		int id = Integer.parseInt(request.getParameter("id"));

		try {
			Connection con = DBConnection.getConnection();

			PreparedStatement ps =
					con.prepareStatement("delete from mobiles where id=?");

			ps.setInt(1, id);
			ps.executeUpdate();

			con.close();

			response.sendRedirect("view.jsp");

		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}