package website.com.admin;

import java.sql.ResultSet;
import java.sql.SQLException;

public class Log {

	private int id;
	private int id_user;
	private String action;
	
	public Log(ResultSet resultSet) {
		try {
		this.id = resultSet.getInt("id");
		this.id_user = resultSet.getInt("id_user");
		this.action = resultSet.getString("action");
		} catch(SQLException e) {}
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getId_user() {
		return id_user;
	}

	public void setId_user(int id_user) {
		this.id_user = id_user;
	}

	public String getAction() {
		return action;
	}

	public void setAction(String action) {
		this.action = action;
	}

	@Override
	public String toString() {
		return "Log [id=" + id + ", id_user=" + id_user + ", action=" + action + "]";
	}
	
	
	
	
}
