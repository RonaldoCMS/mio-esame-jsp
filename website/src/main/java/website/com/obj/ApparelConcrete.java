package website.com.obj;

import java.sql.ResultSet;

public class ApparelConcrete {

	private int id;
	private String color;
	private String size;
	private int apparel;
	private String hexcolor;
	private int qty;
	
	public ApparelConcrete(ResultSet resultSet) {
		try {
		this.id = resultSet.getInt("id");
		this.color = resultSet.getString("color");
		this.size = resultSet.getString("size");
		this.apparel = resultSet.getInt("apparel");
		this.hexcolor = resultSet.getString("hexColor"); 
		this.qty = resultSet.getInt("qty");
		} catch(Exception e) {}
	}

	

	public ApparelConcrete(String color, String size, int apparel, String hexcolor, int qty) {
		super();
		this.color = color;
		this.size = size;
		this.apparel = apparel;
		this.hexcolor = hexcolor;
		this.qty = qty;
	}



	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public int getApparel() {
		return apparel;
	}

	public void setApparel(int apparel) {
		this.apparel = apparel;
	}

	public String getHexcolor() {
		return hexcolor;
	}

	public void setHexcolor(String hexcolor) {
		this.hexcolor = hexcolor;
	}

	@Override
	public String toString() {
		return "ApparelConcrete [id=" + id + ", color=" + color + ", size=" + size + ", apparel=" + apparel
				+ ", hexcolor=" + hexcolor + "]";
	}
}
