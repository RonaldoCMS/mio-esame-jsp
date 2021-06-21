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

@WebServlet("/DeleteCustumer")
public class DeleteCustumer extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Core core = new Core();
		ControlSecurity security = new ControlSecurity("admin/deletecustumer.jsp", req, resp);
		HttpSession session = req.getSession();
		
		try {
			if(core.getDatabase().deleteCustumer(req.getParameter("cdf"), session)) {
				security.sendOk("?message=account+delete");
			}
			else {
				security.sendNoOk("?message=account+not+found");
			}
		} catch (java.sql.SQLIntegrityConstraintViolationException e) {
				security.sendSQLIntegrityConstraintViolation("?message=account+already+delete+or+not+found");
		} catch (com.mysql.cj.jdbc.exceptions.MysqlDataTruncation e) {
			security.sendNoOk("?message=date+too+long+for+cdf");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	
}
