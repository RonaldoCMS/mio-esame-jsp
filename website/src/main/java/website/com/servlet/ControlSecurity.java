package website.com.servlet;

import java.io.IOException;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ControlSecurity {

	private String nextPage;
	private HttpServletRequest req;
	private HttpServletResponse resp;
	
	public ControlSecurity(String nextPage, HttpServletRequest req, HttpServletResponse resp2) {
		super();
		this.nextPage = nextPage;
		this.req = req;
		this.resp = resp2;
	}

	public String getNextPage() {
		return nextPage;
	}

	public void setNextPage(String nextPage) {
		this.nextPage = nextPage;
	}

	public HttpServletRequest getReq() {
		return req;
	}

	public void setReq(HttpServletRequest req) {
		this.req = req;
	}

	public HttpServletResponse getResp() {
		return resp;
	}

	public void setResp(HttpServletResponse resp) {
		this.resp = resp;
	}
	
	public void sendOk(String querry) throws IOException {
		resp.sendRedirect(nextPage.concat(querry));
	}
	
	public void sendNoOk(String querry) throws IOException {
		resp.sendRedirect(nextPage.concat(querry));
	}
	
	public void sendSQLIntegrityConstraintViolation(String querry) throws IOException {
		resp.sendRedirect(nextPage.concat(querry));
	}
	
}
