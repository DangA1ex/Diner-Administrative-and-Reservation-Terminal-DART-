package omm;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class OMM
 */
@WebServlet("/OMM")
public class OMM extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		
		// Include the JDBC Driver for MySQL
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			throw new ServletException(e);
		}
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection c = null; // Defined here for scope
		try {

			String url = "jdbc:mysql://cs3.calstatela.edu/cs3220stu96";

			String username = "cs3220stu96";
			String password = ".ki7x#5L";

			// Connect to the database
			c = DriverManager.getConnection(url, username, password);

			// Create a statement object
			Statement stmt = c.createStatement();

			// Use the statement object to execute a query, and get a result set
			ResultSet rs = stmt.executeQuery("SELECT * FROM Menus");

			ArrayList<MenuItem> menu = new ArrayList<MenuItem>();

			while (rs.next()) {

				Integer id = rs.getInt("id");
				String name = rs.getString("name");
				Float price = rs.getFloat("price");
				Integer quantity = rs.getInt("quantity");

				menu.add(new MenuItem(id, name, price, quantity));
			}

			// Add the menu arraylist to the REQUEST scope
			request.setAttribute("menu", menu);
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

		request.getRequestDispatcher("/WEB-INF/OMM.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	

}
