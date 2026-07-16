package com.mobileshop;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/order")
public class OrderServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response)
			throws ServletException, IOException {

		try {

			HttpSession session =
			request.getSession();

			String username =
			(String)session.getAttribute("admin");

			String mobile =
			request.getParameter("mobile_name");

			double price =
			Double.parseDouble(
			request.getParameter("price"));

			int quantity =
			Integer.parseInt(
			request.getParameter("quantity"));
			
			int mobileId =
			Integer.parseInt(
			request.getParameter("mobile_id"));

			double total = price * quantity;

			Connection con =
			DBConnection.getConnection();

			PreparedStatement ps =
			con.prepareStatement(
			"insert into orders(username,mobile_name,price,quantity,total) values(?,?,?,?,?)");

			ps.setString(1, username);
			ps.setString(2, mobile);
			ps.setDouble(3, price);
			ps.setInt(4, quantity);
			ps.setDouble(5, total);

			ps.executeUpdate();
			
			PreparedStatement ps2 =
					con.prepareStatement(
					"update mobiles set quantity = quantity - ? where id=?");

					ps2.setInt(1, quantity);

					ps2.setInt(2, mobileId);

					ps2.executeUpdate();

			response.sendRedirect("myorders.jsp");

		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}