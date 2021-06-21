package website.com.obj;

import java.sql.ResultSet;
import java.sql.SQLException;

public class Territory {

	private int id;
	private String name;
	private String email;
	private String phone;
	
	public Territory(int id, String name, String email, String phone) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.phone = phone;
	}
	
	public Territory(ResultSet resultSet) {
		try {
		this.id = resultSet.getInt("id");
		this.name = resultSet.getString("name");
		this.email = resultSet.getString("email");
		this.phone = resultSet.getString("phone");
		} catch(SQLException e) {}
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@Override
	public String toString() {
		return "Territory [id=" + id + ", name=" + name + ", email=" + email + ", phone=" + phone + "]";
	}
	
}
