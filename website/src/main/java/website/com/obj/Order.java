package website.com.obj;

import java.util.Date;
import java.sql.ResultSet;

public class Order {

	private int id;
	private double price;
	private Date shipping;
	private Date delivered;
	private String address;
	private String review;
	private int user;
	private String userCdf;
	private int apparel;
	private String apparelArticuledCode;
	private int city;
	
	public Order(ResultSet resultSet) {
		try {
		this.id = resultSet.getInt("id");
		this.price = resultSet.getDouble("price");
		this.shipping = resultSet.getDate("shipping");
		this.delivered = resultSet.getDate("delivered");
		this.address = resultSet.getString("address");
		this.review = resultSet.getString("review");
		this.user = resultSet.getInt("user");
		this.apparel = resultSet.getInt("apparel");
		this.userCdf = resultSet.getString("cdf");
		this.apparelArticuledCode = resultSet.getString("articuled_code");
		} catch (Exception e) {}
	}
	
	
	
	public int getId() {
		return id;
	}
	
	public Order(int apparel, Date date, String address, int city) {
		super();
		this.apparel = apparel;
		this.shipping = date;
		this.address = address;
		this.city = city;
	}



	public Order() {
		// TODO Auto-generated constructor stub
	}


	
	

	public int getCity() {
		return city;
	}



	public void setCity(int city) {
		this.city = city;
	}



	public void setId(int id) {
		this.id = id;
	}
	
	public double getPrice() {
		return price;
	}
	
	public void setPrice(double price) {
		this.price = price;
	}
	
	public Date getShipping() {
		return shipping;
	}
	
	public void setShipping(Date shipping) {
		this.shipping = shipping;
	}
	
	public Date getDelivered() {
		return delivered;
	}
	
	public void setDelivered(Date delivered) {
		this.delivered = delivered;
	}
	
	public String getAddress() {
		return address;
	}
	
	public void setAddress(String address) {
		this.address = address;
	}
	
	public int getUser() {
		return user;
	}
	
	public void setUser(int user) {
		this.user = user;
	}
	
	public int getApparel() {
		return apparel;
	}
	
	public void setApparel(int apparel) {
		this.apparel = apparel;
	}
	
	
	
	public String getReview() {
		return review;
	}

	public void setReview(String review) {
		this.review = review;
	}
	
	

	public String getUserCdf() {
		return userCdf;
	}



	public void setUserCdf(String userCdf) {
		this.userCdf = userCdf;
	}



	public String getApparelArticuledCode() {
		return apparelArticuledCode;
	}



	public void setApparelArticuledCode(String apparelArticuledCode) {
		this.apparelArticuledCode = apparelArticuledCode;
	}



	@Override
	public String toString() {
		return "Order [id=" + id + ", price=" + price + ", shipping=" + shipping + ", delivered=" + delivered
				+ ", address=" + address + ", user=" + user + ", apparel=" + apparel + "]";
	}
	
	
	
}
