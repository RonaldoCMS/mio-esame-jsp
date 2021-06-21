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

@WebServlet("/AlterCustumer")
public class AlterCustumer extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Core core = new Core();
		HttpSession session = req.getSession();
		ControlSecurity security = new ControlSecurity("admin/altercustumer.jsp", req, resp);
		
		String cdf = (String) req.getParameter("cdf");
		String phone = (String) req.getParameter("phone");
		String email = (String) req.getParameter("email");
		
		try {
			if(core.getDatabase().alterCustumer(email, phone, cdf, session)) {
				security.sendOk("?message=completed");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	

}
