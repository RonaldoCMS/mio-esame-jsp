package website.com.obj;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ApparelAbstract {

	private int id;
	private String name;
	private String articuled_code;
	private String brand;
	private double original_price;
	private double attual_price;
	private double discount;
	private Type type;
	private String url;
	private ArrayList<ApparelConcrete> list;
	
	public ApparelAbstract(ResultSet resultSet, ArrayList<ApparelConcrete> list) {
		try {
			this.id = resultSet.getInt("id");
			this.name = resultSet.getString("name");
			this.articuled_code = resultSet.getString("articuled_code");
			this.brand = resultSet.getString("brand");
			this.original_price = resultSet.getDouble("original_price");
			this.attual_price = resultSet.getDouble("attual_price");
			this.discount = resultSet.getDouble("discount");
			this.type = new Type(resultSet.getInt("id_type"), resultSet.getString("types"));
			this.url = resultSet.getString("url");
			this.list = list;
		} catch (SQLException e) {}
	}
	
	

	public ApparelAbstract(String name, String articuled_code, String brand, double original_price,
			double attual_price, double discount, int type, String url) {
		this.name = name;
		this.articuled_code = articuled_code;
		this.brand = brand;
		this.original_price = original_price;
		this.attual_price = attual_price;
		this.discount = discount;
		this.type = new Type(type, "null");
		this.url = url;
	}



	public ArrayList<ApparelConcrete> getList() {
		return list;
	}

	public void setList(ArrayList<ApparelConcrete> list) {
		this.list = list;
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

	public String getArticuled_code() {
		return articuled_code;
	}

	public void setArticuled_code(String articuled_code) {
		this.articuled_code = articuled_code;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public double getOriginal_price() {
		return original_price;
	}

	public void setOriginal_price(double original_price) {
		this.original_price = original_price;
	}

	public double getAttual_price() {
		return attual_price;
	}

	public void setAttual_price(double attual_price) {
		this.attual_price = attual_price;
	}

	public double getDiscount() {
		return discount;
	}

	public void setDiscount(double discount) {
		this.discount = discount;
	}

	public Type getType() {
		return type;
	}

	public void setType(Type type) {
		this.type = type;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	@Override
	public String toString() {
		return "ApparelAbstract [id=" + id + ", name=" + name + ", articuled_code=" + articuled_code + ", brand="
				+ brand + ", original_price=" + original_price + ", attual_price=" + attual_price + ", discount="
				+ discount + ", type=" + type + ", url=" + url + "]";
	}
	
}
