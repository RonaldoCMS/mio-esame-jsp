package website.com.servlet.order;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import website.com.Core;
import website.com.obj.Order;
import website.com.obj.User;
import website.com.servlet.ControlSecurity;

@WebServlet("/NewOrder")
public class NewOrder extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		
		Core core = new Core();
		int id =  Integer.parseInt(req.getParameter("id"));
		Date date = null;
		ControlSecurity security = new ControlSecurity("admin/addorder.jsp", req, resp);
		
		java.util.Date dt;
		java.sql.Date dtSql = null;
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String in = req.getParameter("shipping");
			 dt = sdf.parse(in);
			 dtSql = new java.sql.Date(dt.getTime());
			
		} catch (ParseException e1) {
			e1.printStackTrace();
		}
		String cdf = req.getParameter("cdf");
		String address = req.getParameter("address");
		int select = Integer.parseInt(req.getParameter("select"));
		
		try {
			if(core.getDatabase().insertNewOrder(new Order(id, dtSql, address, select), cdf, session)) {
				req.setAttribute("message", "Account create");
				security.sendOk("message=order+create");
			}
			else {
				security.sendNoOk("message=order+not+create");
			}
		} catch (java.sql.SQLIntegrityConstraintViolationException e) {
			security.sendSQLIntegrityConstraintViolation("?message=account+already+created");
		} catch (com.mysql.cj.jdbc.exceptions.MysqlDataTruncation e) {
			e.printStackTrace();
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}
		
	}	
}
