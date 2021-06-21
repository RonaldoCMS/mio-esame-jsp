package website.com.servlet.order;

import java.io.IOException;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import website.com.Core;
import website.com.servlet.ControlSecurity;

@WebServlet("/DeleteOrder")
public class DeleteOrder extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		Core core = new Core();
		HttpSession session = req.getSession();
		ControlSecurity security = new ControlSecurity("admin/deleteorder.jsp", req, resp);
		try {
			if(core.getDatabase().deleteOrder(Integer.parseInt(req.getParameter("id")), session)) {
				security.sendOk("?message=order+delete");
			}
			else {
				security.sendNoOk("?message=order=account+not+found");
			}
		} catch (java.sql.SQLIntegrityConstraintViolationException e) {
			security.sendSQLIntegrityConstraintViolation("?message=order+already+delete+or+not+found");
		} catch (com.mysql.cj.jdbc.exceptions.MysqlDataTruncation e) {
			security.sendNoOk("?message=error+generic");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
}
