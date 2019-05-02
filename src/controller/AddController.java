package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.Menu;
import models.TableUser;

//Code that implements the Order function of the code 
//As of now only adds items to table 1
//Displays the items from Menus database
//Uses Add.jsp for its main html
//You may start run from this controller to open the Menu Page

@WebServlet("/kitchen/Add")
public class AddController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void init(ServletConfig config) throws ServletException {
		super.init(config);

		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			throw new ServletException(e);
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		// Get a reference to the session
		HttpSession session = request.getSession();
		
		// Get a reference to the NoteUser object stored in the session
		TableUser user = (TableUser) session.getAttribute("user");
		
		// If the User doesn't exist, then they didn't login. So, kick them back to Login
		if (user == null) {
			response.sendRedirect("Login");
			return;
		}
		
		
		List<Menu> menus = new ArrayList<Menu>();
		Connection c = null;
		try {
			String url = "jdbc:mysql://cs3.calstatela.edu/cs3220stu96";
			String username = "cs3220stu96";
			String password = ".ki7x#5L";
			c = DriverManager.getConnection(url, username, password);
			Statement stmt = c.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * from Menus");

			while (rs.next()) {
				Menu menu = new Menu(rs.getInt("id"), rs.getString("name"), rs.getFloat("price"), rs.getInt("quantity"));
				menus.add(menu);
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

		request.setAttribute("menus", menus);
		request.setAttribute("tableId", user.getId());
		request.getRequestDispatcher("/WEB-INF/Add.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
