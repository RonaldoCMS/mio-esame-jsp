package website.com.obj;

import java.sql.ResultSet;
import java.util.Date;

public class User {
	private int id;
	private String name;
	private String surname;
	private String cdf;
	private String phone;
	private int territory;
	private City city;
	private String username;
	private String password;
	private Date last_login;
	private int rank;
	private String email;
	private int custumer;
	
	 public User(ResultSet resultSet) {
		try {
		this.id = resultSet.getInt("id");
		this.name = resultSet.getString("name");
		this.surname = resultSet.getString("surname");
		this.cdf = resultSet.getString("cdf");
		this.phone = resultSet.getString("phone");
		this.territory = resultSet.getInt("territory");
		this.username = resultSet.getString("username");
		this.password = resultSet.getString("password");
		this.last_login = resultSet.getDate("last_login");
		this.rank = resultSet.getInt("rank");
		this.email = resultSet.getString("email");
		this.custumer = resultSet.getInt("custumer");
		this.city = new City(resultSet.getInt("id_city"), resultSet.getString("province"), resultSet.getString("cityy"), resultSet.getString("cap"), resultSet.getInt("ter"));
		} catch (Exception e) {}
	}
	 
	
	/***
	 * Usato solo ed esclusivamente per l'inserimento dal web.
	 * @param select 
	 */
	public User(String name, String surname, String cdf, String phone,
				String email, int territory, int custumer, int select) {
		this.name = name;
		this.surname = surname;
		this.cdf = cdf;
		this.phone = phone;
		this.email = email;
		this.territory = territory;
		this.custumer = custumer;
		this.city = new City(select, "", "", "", territory);
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

	public String getSurname() {
		return surname;
	}

	public void setSurname(String surname) {
		this.surname = surname;
	}

	public String getCdf() {
		return cdf;
	}

	public void setCdf(String cdf) {
		this.cdf = cdf;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getTerritory() {
		return territory;
	}

	public void setTerritory(int territory) {
		this.territory = territory;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Date getLast_login() {
		return last_login;
	}

	public void setLast_login(Date last_login) {
		this.last_login = last_login;
	}

	public int getRank() {
		return rank;
	}

	public void setRank(int rank) {
		this.rank = rank;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getCustumer() {
		return custumer;
	}

	public void setCustumer(int custumer) {
		this.custumer = custumer;
	}

	
	
	public City getCity() {
		return city;
	}


	public void setCity(City city) {
		this.city = city;
	}


	@Override
	public String toString() {
		return "User [id=" + id + ", name=" + name + ", surname=" + surname + ", cdf=" + cdf + ", phone=" + phone
				+ ", territory=" + territory + ", city=" + city + ", username=" + username + ", password=" + password
				+ ", last_login=" + last_login + ", rank=" + rank + ", email=" + email + ", custumer=" + custumer + "]";
	}



	 
	 
	
}
