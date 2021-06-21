package website.com.bean;

import java.io.Serializable;

public class ErrorDiv implements Serializable {

	String error;
	String divError;
	
	public ErrorDiv() {
	}

	public String getError() {
		return error;
	}

	public void setError(String error) {
		this.error = error;
		
		divError =  "<p style=\"color:red !important; text-align: center !important;\"> " + this.error + "</p>";
	}
	
	public String getDivError() {
		return divError;
	}
	
}