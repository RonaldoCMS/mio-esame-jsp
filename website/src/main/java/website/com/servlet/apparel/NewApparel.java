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
import website.com.obj.User;
import website.com.servlet.ControlSecurity;

@WebServlet("/NewApparel")
public class NewApparel extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Core core = new Core();		
		HttpSession session = req.getSession();		
		
		String name = req.getParameter("name");
		String articuled_code = req.getParameter("articuled_code");
		String brand = req.getParameter("brand");
		double original_price = Double.parseDouble(req.getParameter("price"));
		double discount = Double.parseDouble(req.getParameter("discount"));
		double attual_price = (original_price * discount) / 100;
		String urlImg = req.getParameter("url");
		int select = Integer.parseInt(req.getParameter("select"));
		
		ApparelAbstract apparelAbstract = new ApparelAbstract(name, articuled_code, brand, original_price, attual_price, discount, select, urlImg);
		ControlSecurity security = new ControlSecurity("admin/addapparel.jsp", req, resp);
		
		try {
			
			if(core.getDatabase().InsertApparelAbstract(apparelAbstract, session)) {
				security.sendOk("?message=apparel+create");
			}
			else {
				security.sendNoOk("?message=apparel+not+create");
			}
			
		} catch (java.sql.SQLIntegrityConstraintViolationException e) {
				security.sendSQLIntegrityConstraintViolation("?message=apparel+already+created");
		} catch (com.mysql.cj.jdbc.exceptions.MysqlDataTruncation e) {
			security.sendNoOk("?message=date+too+long+for+cdf");
		} catch (SQLException e) {
			e.printStackTrace();
		} 
	}
	
}
