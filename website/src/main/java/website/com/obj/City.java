package website.com.obj;

import java.sql.ResultSet;
import java.sql.SQLException;

public class City {

	private int id;
	private String province;
	private String city;
	private String cap;
	private int territory;
	
	public City(ResultSet resultSet) {
		try {
		this.id = resultSet.getInt("id");
		this.province = resultSet.getString("province");
		this.city = resultSet.getString("city");
		this.cap = resultSet.getString("cap");
		this.territory = resultSet.getInt("territory");
		} catch(SQLException e) {}
	}
	
	public City(int id, String province, String city, String cap, int territory) {
		super();
		this.id = id;
		this.province = province;
		this.city = city;
		this.cap = cap;
		this.territory = territory;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getProvince() {
		return province;
	}
	public void setProvince(String province) {
		this.province = province;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getCap() {
		return cap;
	}
	public void setCap(String cap) {
		this.cap = cap;
	}
	public int getTerritory() {
		return territory;
	}
	public void setTerritory(int territory) {
		this.territory = territory;
	}
	
	
	
}
