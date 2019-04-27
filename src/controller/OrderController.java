package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//set of code that adds selected elements into the orders2 database
//as of now only gives it tableID 1 meaning all items are being ordered at table 1
//is run by Add.jsp
//runs AddUpdate.jsp
//Do not start run from this Controller

@WebServlet("/kitchen/OrderController")
public class OrderController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Connection c = null;
		try {
			String url = "jdbc:mysql://cs3.calstatela.edu/cs3220stu96";
			String username = "cs3220stu96";
			String password = ".ki7x#5L";

			c = DriverManager.getConnection(url, username, password);
			Statement stmt = c.createStatement();
			String tableId = request.getParameter("tableId");
			String[] foods = request.getParameterValues("food");
			//Query Code That Adds the orders into the database
			//Will update when session is implemented
			for (String food : foods) {
				stmt.executeUpdate("INSERT INTO orders2 (tableId, orders, completed) SELECT t.tableID, m.name, 'false' "+
				"FROM tables t, Menus m WHERE t.tableID = " + tableId + " and m.id = '" + food + "'");
			}
			
			
		} catch (SQLException e) {
			throw new ServletException(e);
		} finally {
			try {
				if (c != null)
					c.close();
			} catch (SQLException e) {
				throw new ServletException(e);
			}
		}
		request.getRequestDispatcher("/WEB-INF/AddUpdate.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}