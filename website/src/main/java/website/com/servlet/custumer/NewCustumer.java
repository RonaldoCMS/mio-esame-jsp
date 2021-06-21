package website.com.servlet.custumer;

import java.io.IOException;
import java.sql.SQLException;

import com.mysql.cj.Session;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import website.com.Core;
import website.com.obj.User;
import website.com.servlet.ControlSecurity;

@WebServlet("/NewCustumer")
public class NewCustumer extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Core core = new Core();
		ControlSecurity security = new ControlSecurity("admin/addcust.jsp", req, resp);
		HttpSession session = req.getSession();
		
		String name = req.getParameter("name");
		String surname = req.getParameter("surname");
		String cdf = req.getParameter("cdf");
		String phone = req.getParameter("phone");
		String email = req.getParameter("email");
		int select = Integer.parseInt(req.getParameter("select"));
		
		User user = new User(name, surname, cdf, phone, email, (int) session.getAttribute("territory"), (int) session.getAttribute("id"), select);
		
		try {
			
			if(core.getDatabase().insertNewCustumer(user, session)) {
				security.sendOk("?message=account+create!");
			}
			
			else {
				resp.sendRedirect("admin/index.jsp");
			}
			
		} catch (java.sql.SQLIntegrityConstraintViolationException e) {
			security.sendSQLIntegrityConstraintViolation("?message=account+already+created");
		} catch (com.mysql.cj.jdbc.exceptions.MysqlDataTruncation e) {
			security.sendNoOk("?message=date+too+long+for+cdf");
		} catch (SQLException e) {
			security.sendNoOk("?message=error+not+notoriuos");
		}
	}
	
}
