package website.com.servlet.custumer;

import java.io.IOException;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import website.com.Core;
import website.com.obj.User;
import website.com.servlet.ControlSecurity;

@WebServlet("/CreateAccount")
public class CreateAccount extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Core core = new Core();
		HttpSession session = req.getSession();
		ControlSecurity security = new ControlSecurity("admin/index.jsp", req, resp);
		
		String cdf = req.getParameter("cdf");
		String username = req.getParameter("username");
		String psw = req.getParameter("psw");
		String psw2 = req.getParameter("psw2");
		
		try {
			if(psw.equals(psw2)) {
				User user = core.getDatabase().findCustumer(cdf, session);
				user.setUsername(username);
				user.setPassword(psw);
				if(core.getDatabase().alterCustumer(user)) {
					security.sendOk("?message=created");
				} else {
					security.sendNoOk("?message=not+possible+create+username");
				}
			}
		} catch(Exception e) {}
	}
}
