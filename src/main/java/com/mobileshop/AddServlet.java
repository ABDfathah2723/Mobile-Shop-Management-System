package com.mobileshop;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/add")
public class AddServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
                          throws ServletException, IOException {

        String brand = request.getParameter("brand");
        String model = request.getParameter("model");
        double price = Double.parseDouble(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String ram = request.getParameter("ram");
        String storage = request.getParameter("storage");
        String color = request.getParameter("color");
        
        if(price <= 0 || quantity <= 0){

        	response.getWriter().println(
        	"Invalid Price or Quantity");

        	return;
        }

        Mobile m = new Mobile();
        m.setBrand(brand);
        m.setModel(model);
        m.setPrice(price);
        m.setQuantity(quantity);
        m.setRam(ram);
        m.setStorage(storage);
        m.setColor(color);

        int status = MobileDAO.addMobile(m);

        if (status > 0) {
            response.sendRedirect("view.jsp");
        } else {
            response.getWriter().println("Failed to add mobile");
        }
    }
}