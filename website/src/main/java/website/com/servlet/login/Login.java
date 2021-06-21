package website.com.servlet.login;

import java.io.IOException;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import website.com.Core;

@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 5701345391202314100L;
	
	private Core core;
	private String username;
	private String password;
	
	@Override
	public void init() throws ServletException {
		this.core = new Core();
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {	
		username = req.getParameter("username");
		password = req.getParameter("password");
		HttpSession session = req.getSession();
		try {
			boolean exists = core.getDatabase().searchUsernameLogin(username, password);
			if(exists) {
				isTrue(req, resp, session);
			} else {
				isFalse(req, resp, session);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void isTrue(HttpServletRequest req, HttpServletResponse res, HttpSession session) {
		try {
			int rank = core.getDatabase().getRank(username);
			int id = core.getDatabase().getId(username);
			session.setAttribute("rank", rank);
			session.setAttribute("id", id);
			session.setAttribute("username", username);
			session.setAttribute("territory", core.getDatabase().getTerritory(username));
			System.out.println("id\t:" +  (int) session.getAttribute("id"));
			System.out.println(session.getAttribute("rank"));
			res.sendRedirect("index.jsp");
		} catch (SQLException | IOException e) {
			e.printStackTrace();
		}
	}
	
	public void isFalse(HttpServletRequest req, HttpServletResponse res, HttpSession session) {
		try {
		session.setAttribute("error", "Password or username not found");
		res.sendRedirect("login.jsp");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
}
