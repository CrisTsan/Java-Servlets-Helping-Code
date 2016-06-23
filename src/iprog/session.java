package iprog;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class session
 */
//@WebServlet("/session")
public class session extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public session() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		_DB_CONNECTION c = new _DB_CONNECTION();
		ResultSet rs = null;
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		rs = c.executeQuery("SELECT * FROM mytable where username=\""+ username+"\" AND password=\""+password+"\"");
		try {
			if (!( rs == null || !rs.next()))
			{
				HttpSession session = request.getSession();
				session.setAttribute("username", username);
				response.sendRedirect("4_4_welcome_after_servlet.jsp");
			}
			else
			{
				request.setAttribute("message", "Account is invalid");
				request.getRequestDispatcher("4_4_login_with_servlet.jsp").forward(request, response);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
