package website.com.servlet.apparel;

import java.io.IOException;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import website.com.Core;
import website.com.obj.ApparelAbstract;
import website.com.obj.ApparelConcrete;
import website.com.servlet.ControlSecurity;

@WebServlet("/NewApparelConcrete")
public class NewApparelConcrete extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Core core = new Core();
		HttpSession session = req.getSession();
		
		int id = Integer.parseInt(req.getParameter("id"));
		String color = req.getParameter("color");
		String size = req.getParameter("size");
		String hexColor = req.getParameter("hexcolor");
		int qty = Integer.parseInt(req.getParameter("qty"));
		
		ApparelConcrete apparel = new ApparelConcrete(color, size, id, hexColor, qty);
		ControlSecurity security = new ControlSecurity("admin/viewapparels.jsp", req, resp);
		
		try {
			if(core.getDatabase().InsertApparelConcrete(apparel)) {
				security.sendOk("?message=apparel+create");
			}
			else {
				security.sendNoOk("?message=apparel+no+create");
			}
		} catch (java.sql.SQLIntegrityConstraintViolationException e) {
			security.sendSQLIntegrityConstraintViolation("?message=apparel+already+created");
		} catch (com.mysql.cj.jdbc.exceptions.MysqlDataTruncation e) {
			security.sendNoOk("?message=apparel+no");
		} catch (SQLException e) {
			//
		} 
	}
}
