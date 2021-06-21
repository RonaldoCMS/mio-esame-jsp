package website.com.servlet.order;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import website.com.Core;

@WebServlet("/AlterOrder")
public class AlterOrder extends HttpServlet {

	

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Core core = new Core();
		HttpSession session = req.getSession();
		
		String price = (String) req.getParameter("price");		
		int id = Integer.parseInt(req.getParameter("id"));
		String review = (String) req.getParameter("review");
		String address = (String) req.getParameter("address");
		
		java.util.Date dt = null;
		java.sql.Date dtSql = null;
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String in = req.getParameter("shipping");
		try {
			dt = sdf.parse(in);
		} catch (ParseException e1) {
			e1.printStackTrace();
		}
		Date shipping = new java.sql.Date(dt.getTime());
		
		in = req.getParameter("delivered");
		
		try {
			dt = sdf.parse(in);
			
		} catch (ParseException e1) {
			try {
				if(core.getDatabase().alterOrder(id, price, shipping, review, address, session)) {
					resp.sendRedirect("admin/alterorder.jsp?message=completed");
				}
				return;
			} catch (SQLException | IOException e) {
				e.printStackTrace();
			}
		}
		Date delivered = new java.sql.Date(dt.getTime());
		
		try {
			if(core.getDatabase().alterOrder(id, price, shipping, delivered, review, address, session)) {
				resp.sendRedirect("admin/alterorder.jsp?message=completed");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	
}
