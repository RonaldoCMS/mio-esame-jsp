package website.com.database;

import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.http.HttpSession;
import website.com.admin.Log;
import website.com.obj.ApparelAbstract;
import website.com.obj.ApparelConcrete;
import website.com.obj.City;
import website.com.obj.Order;
import website.com.obj.Territory;
import website.com.obj.Type;
import website.com.obj.User;

public class Database {

	private String jdbcURL;
	private String jdbcUsername;
	private String jdbcPassword;
	private Connection jdbcConnection;

	public Database(String jdbcURL, String jdbcUsername, String jdbcPassword) {
		this.jdbcURL = jdbcURL;
		this.jdbcUsername = jdbcUsername;
		this.jdbcPassword = jdbcPassword;
	}

	public void connect() {
		try {
			if (jdbcConnection == null || jdbcConnection.isClosed()) {
				Class.forName("com.mysql.cj.jdbc.Driver");
				jdbcConnection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
			}
		} catch (ClassNotFoundException e) {
			System.out.println("Errore metodo connect()");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public boolean searchUsernameLogin(String username, String password) throws SQLException {
		PreparedStatement statement = getPreparedStatement("SELECT username, password FROM users WHERE username = ? and password = ?");
		statement.setString(1, username);
		statement.setString(2, password);
		ResultSet resultSet = statement.executeQuery();
		if(resultSet.next()) {
			return true;
		}
		return false;
	}

	public ArrayList<User> custumersAdministrator(int id, int rank) throws SQLException, NoSuchMethodException, SecurityException, InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {
		String sql = null;
		if(rank == 3) {
			sql = "select c.*, ci.id as id_city, ci.province as province, ci.city as cityy, ci.cap as cap, ci.territory as ter from users a inner join users c on a.id = c.custumer inner join cities ci on ci.id = c.city";
		}
		else {
			sql = "select c.*, ci.id as id_city, ci.province as province, ci.city as cityy, ci.cap as cap, ci.territory as ter from users a inner join users c on a.id = c.custumer inner join cities ci on ci.id = c.city where a.id = ?"; 
		}
		PreparedStatement statement = getPreparedStatement(sql);
		if(rank < 3)
			statement.setInt(1, id);
		
		ResultSet resultSet = statement.executeQuery();
		return outList(resultSet, User.class);
	}

	public boolean alterCustumer(String email,String phone, String cdf, HttpSession id) throws SQLException {
		connect();
		String sql = "UPDATE users SET email = ?, phone = ? where cdf = ? and custumer = ?";
		PreparedStatement statement = jdbcConnection.prepareStatement(sql);
		statement.setString(1, email);
		statement.setString(2, phone);
		statement.setString(3, cdf);
		statement.setInt(4, (int) id.getAttribute("id"));
		return boolStatementExecute(statement, id);
		
	}

	public boolean alterCustumer(User user) throws SQLException {
		PreparedStatement statement = getPreparedStatement("UPDATE users SET username = ?, password = ? where cdf = ?");
		statement.setString(1, user.getUsername());
		statement.setString(2, user.getPassword());
		statement.setString(3, user.getCdf());
		return boolStatementExecute(statement, null);
	}

	public boolean alterOrder(int id, String price, Date shipping, Date delivered, String review, String address, HttpSession session) throws SQLException {
		PreparedStatement statement = getPreparedStatement("UPDATE orders SET price = ?, shipping = ?, delivered = ?, review = ?, address = ? where id = ?");
		
		statement.setString(1, price);
		statement.setDate(2, shipping);
		statement.setDate(3, delivered);
		statement.setString(4, review);
		statement.setString(5, address);
		statement.setInt(6, id);
		
		return boolStatementExecute(statement, session);
		
	}

	public boolean alterOrder(int id, String price, Date shipping, String review, String address, HttpSession session) throws SQLException {
		PreparedStatement statement = getPreparedStatement("UPDATE orders SET price = ?, shipping = ?, review = ?, address = ? where id = ?");
		
		statement.setString(1, price);
		statement.setDate(2, shipping);
		statement.setString(3, review);
		statement.setString(4, address);
		statement.setInt(5, id);
		return boolStatementExecute(statement, session);
	}

	public boolean InsertApparelAbstract(ApparelAbstract apparelAbstract, HttpSession session) throws SQLException {
		PreparedStatement statement = getPreparedStatement("INSERT INTO apparels_abstract (name, articuled_code, brand, original_price, attual_price, discount, type, url) VALUES (?, ?, ?, ?, ? ,? , ?, ?)");
		statement.setString(1, apparelAbstract.getName());
		statement.setString(2, apparelAbstract.getArticuled_code());
		statement.setString(3, apparelAbstract.getBrand());
		statement.setDouble(4, apparelAbstract.getOriginal_price());
		statement.setDouble(5, apparelAbstract.getAttual_price());
		statement.setDouble(6, apparelAbstract.getDiscount());
		statement.setInt(7, apparelAbstract.getType().getId());
		statement.setString(8, apparelAbstract.getUrl());
		return boolStatementExecute(statement, session);
	}
	
	public boolean insertNewCustumer(User user, HttpSession id) throws SQLException {
		PreparedStatement statement = getPreparedStatement("insert into users (name, surname, cdf, phone, email, territory, custumer, city) values (?, ?, ?, ?, ?, ?, ?, ?)");
		statement.setString(1, user.getName());
		statement.setString(2, user.getSurname());
		statement.setString(3, user.getCdf());
		statement.setString(4, user.getPhone());
		statement.setString(5, user.getEmail());
		statement.setInt(6, user.getTerritory());
		statement.setInt(7, user.getCustumer());
		statement.setInt(8, user.getCity().getId());
		return boolStatementExecute(statement, id);
	}

	public boolean insertNewOrder(Order order, String cdfCustumer, HttpSession id) throws SQLException {
		PreparedStatement statement = getPreparedStatement("insert into orders (apparel, shipping, address, user, city) values (?, ?, ?, ?, ?)");
		statement.setInt(1, order.getApparel());
		statement.setDate(2, (Date) order.getShipping());
		statement.setString(3, order.getAddress());
		statement.setInt(4, findIdCustumer(cdfCustumer, id));
		statement.setInt(5, order.getCity());
		return boolStatementExecute(statement, id);
	}

	public boolean InsertApparelConcrete(ApparelConcrete apparel) throws SQLException {
		PreparedStatement statement = getPreparedStatement("INSERT INTO apparels_concrete (color, size, hexcolor, apparel, qty) VALUES (?,?,?,?,?)");
		statement.setString(1, apparel.getColor());
		statement.setString(2, apparel.getSize());
		statement.setString(3, apparel.getHexcolor());
		statement.setInt(4, apparel.getApparel());
		statement.setInt(5, apparel.getQty());
		if(statement.executeUpdate() == 1) {
			statement.close();
			return true;
		}
		statement.close();	
		return false;
	}

	public String moreOrders(String column, int id) throws SQLException {
		PreparedStatement statement = getPreparedStatement("SELECT " + column + " FROM ORDERS o " +
				" INNER JOIN APPARELS_CONCRETE c ON o.apparel = c.id " +
				" INNER JOIN APPARELS_ABSTRACT a ON a.id = c.apparel WHERE o.id = ?");
		statement.setInt(1, id);
		ResultSet resultSet = statement.executeQuery();
		if(resultSet.next()) {
			return resultSet.getString(column);
		}
		return null;
	}
	
	public ArrayList<Order> ordersAdministrator(int id, int rank) throws SQLException, NoSuchMethodException, SecurityException, InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {
		String sql = null;
		if(rank == 3) {
			sql = "select orders.* from orders inner join users c on orders.user = c.id inner join users a on c.custumer = a.id";
		}
		else {
			sql = "select orders.* from orders inner join users c on orders.user = c.id inner join users a on c.custumer = a.id where a.id = ?"; 
		}
		PreparedStatement statement = getPreparedStatement(sql);
		if(rank < 3)
			statement.setInt(1, id);
		ResultSet resultSet = statement.executeQuery();
		return outList(resultSet, Order.class);
	}
	
	public boolean deleteCustumer(String cdf, HttpSession id) throws SQLException {
		connect();
		String sql = "DELETE FROM users where custumer = ? and cdf = ?";
		PreparedStatement statement = jdbcConnection.prepareStatement(sql);
		statement.setInt(1, (int) id.getAttribute("id"));
		statement.setString(2, cdf);
		return boolStatementExecute(statement, id);
	}
	
	public User findCustumer(String cdf, HttpSession id) throws SQLException {
		PreparedStatement statement = getPreparedStatement("SELECT * FROM users where custumer = ? and cdf = ?");
		statement.setInt(1, (int) id.getAttribute("id"));
		statement.setString(2, cdf);
		
		ResultSet resultSet = statement.executeQuery();
		if(resultSet.next()) {
			logs(statement.toString(), id);
			return new User(resultSet);
		}
		return null;
	}

	public Order findOrder(int idOrder, HttpSession id) throws SQLException {
		connect();
		String sql = "select o.*, c.cdf, a.articuled_code, c.custumer from orders o inner join users c on o.user = c.id inner join apparels_abstract a on a.id = o.apparel where c.custumer = ? and o.id = ?";
		PreparedStatement statement = jdbcConnection.prepareStatement(sql);
		statement.setInt(1, (int) id.getAttribute("id"));
		statement.setInt(2, idOrder);
		ResultSet resultSet = statement.executeQuery();
		if(resultSet.next()) {
			logs(statement.toString(), id);
			return new Order(statement.getResultSet());
		}
		return null;
	}

	public int findIdCustumer(String cdf, HttpSession id) throws SQLException {
		connect();
		String sql = "SELECT id FROM users where custumer = ? and cdf = ?";
		PreparedStatement statement = jdbcConnection.prepareStatement(sql);
		statement.setInt(1, (int) id.getAttribute("id"));
		statement.setString(2, cdf);
		
		System.out.println(statement.toString());
		ResultSet resultSet = statement.executeQuery();
		if(resultSet.next()) {
			logs(statement.toString(), id);
			return resultSet.getInt("id");
		}
		return -1;
	}

	public int getRank(String username) throws SQLException {
		PreparedStatement statement = getPreparedStatement("SELECT rank FROM users WHERE username = ?");
		return getResult(statement, username, "rank");	
	}

	public ArrayList<ApparelAbstract> getAllAbstractApparels() throws SQLException {
		ArrayList<ApparelAbstract> list = new ArrayList<ApparelAbstract>();
		PreparedStatement statement = getPreparedStatement("SELECT *, ty.type as types, ty.id as id_type FROM apparels_abstract ab inner join apparels_type ty on ty.id = ab.type");
		ResultSet resultSet = statement.executeQuery();
		while(resultSet.next()) {
			list.add(new ApparelAbstract(resultSet, getApparelsConcrete(resultSet)));
		}
		return list;
		
	}

	public int getId(String username) throws SQLException {
		PreparedStatement statement = getPreparedStatement("SELECT id FROM users WHERE username = ?");
		return getResult(statement, username, "id");
	}

	public String getApparelUrlImage(int id) throws SQLException {
		PreparedStatement statement = getPreparedStatement("select url from orders o inner join apparels_concrete c on o.apparel = c.id inner join apparels_abstract a on a.id = c.apparel where o.id = ?");
		statement.setInt(1, id);
		ResultSet resultSet = statement.executeQuery();
		if(resultSet.next()) {
			return resultSet.getString("url");
		}
		return null;
	}

	public int getAllApparelBought(HttpSession id) throws SQLException {
		int apparels = 0;
		PreparedStatement statement = getPreparedStatement("select qty from orders o inner join apparels_concrete c on o.apparel = c.id inner join users u on u.id = o.user inner join users a on a.id = u.custumer where a.id = ?");
		statement.setInt(1, (int) id.getAttribute("id"));
		ResultSet resultSet = statement.executeQuery();
		while(resultSet.next()) {
			apparels += resultSet.getInt("qty");
		}
		return apparels;
	}

	public int getTerritory(String username) throws SQLException {
		PreparedStatement statement = getPreparedStatement("SELECT territory FROM users WHERE username = ?");
		return getResult(statement, username, "territory");
	}

	public ArrayList<Type> getTypes() throws SQLException, NoSuchMethodException, SecurityException, InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {
		PreparedStatement statement = getPreparedStatement("SELECT * FROM apparels_type");
		ResultSet resultSet = statement.executeQuery();
		return outList(resultSet, Type.class);
	}

	public ArrayList<ApparelAbstract> getApparelsAbstract() throws SQLException {
		PreparedStatement statement = getPreparedStatement("select a.*, t.type as types from apparels_abstract a inner join apparels_type t on a.type = t.id ");
		return addApparelsAbstract(statement.executeQuery());
	}

	public ApparelAbstract getApparelAbstract() throws SQLException {
		PreparedStatement statement = getPreparedStatement("select a.*, t.type as types from apparels_abstract a inner join apparels_type t on a.type = t.id ");
		return addApparelAbstract(statement.executeQuery());
	}

	public ArrayList<City> getCity(int territory) throws SQLException, NoSuchMethodException, SecurityException, InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {
		PreparedStatement statement = getPreparedStatement("SELECT * FROM cities where territory = ?");
		statement.setInt(1, territory);
		ResultSet resultSet = statement.executeQuery();
		return outList(resultSet, City.class);
	}

	public ArrayList<Territory> getTerritories() throws SQLException, NoSuchMethodException, SecurityException, InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {
		PreparedStatement statement = getPreparedStatement("SELECT * FROM Territories");
		return outList(statement.executeQuery(), Territory.class);
	}

	public ArrayList<Order> getOders(int id) throws SQLException, NoSuchMethodException, SecurityException, InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {
		PreparedStatement statement = getPreparedStatement("SELECT * FROM orders WHERE user = ?");
		statement.setInt(1, id);
		ResultSet resultSet = statement.executeQuery();
		return outList(resultSet, Order.class);
	}

	public ArrayList<City> getCitiesFromTerritory(int territory) throws SQLException, NoSuchMethodException, SecurityException, InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {
		PreparedStatement statement = getPreparedStatement("SELECT * FROM cities where territory = ?");
		statement.setInt(1, territory);
		return outList(statement.executeQuery(), City.class);
	}

	public ArrayList<Log> getLogs() throws SQLException, NoSuchMethodException, SecurityException, InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {
		PreparedStatement statement = getPreparedStatement("select * from logs");
		return outList(statement.executeQuery(), Log.class);
	}
	
	public ArrayList<Order> getallMyOrder(HttpSession id) throws SQLException, NoSuchMethodException, SecurityException, InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {
		PreparedStatement statement = getPreparedStatement("select o.*, c.cdf, a.articuled_code from orders o inner join users c on o.user = c.id inner join apparels_abstract a on a.id = o.apparel where c.custumer = ?");
		statement.setInt(1, (int) id.getAttribute("id"));
		return outList(statement.executeQuery(), Order.class);
	}
	
	public ArrayList<User> getallUsers(HttpSession id) throws SQLException, NoSuchMethodException, SecurityException, InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {
		PreparedStatement statement = getPreparedStatement("select * from users");
		return outList(statement.executeQuery(), User.class);
	}

	public boolean deleteOrder(int id, HttpSession session) throws SQLException {
		PreparedStatement statement = getPreparedStatement("DELETE FROM orders where id = ?");
		statement.setInt(1, id);
		return boolStatementExecute(statement, session);

	}
	
	private ApparelAbstract addApparelAbstract(ResultSet resultSet) throws SQLException {
		while(resultSet.next()) {
			return new ApparelAbstract(resultSet, getApparelsConcrete(resultSet));
		}
		return null;
	}

	private ArrayList<ApparelAbstract> addApparelsAbstract(ResultSet resultSet) throws SQLException {
		ArrayList<ApparelAbstract> list = new ArrayList<ApparelAbstract>();
		while(resultSet.next()) {
			list.add(new ApparelAbstract(resultSet, getApparelsConcrete(resultSet)));
		}
		return list;
	}

	private boolean boolStatementExecute(PreparedStatement statement, HttpSession id) throws SQLException {
		if(statement.executeUpdate() == 1) {
			statement.close();
			logs(statement.toString(), id);
			return true;
		}
		statement.close();
		return false;
	}

	private ArrayList<ApparelConcrete> getApparelsConcrete(ResultSet resultSet) throws SQLException {
		ArrayList<ApparelConcrete> list = new ArrayList<ApparelConcrete>();
		PreparedStatement statement = getPreparedStatement("SELECT * FROM apparels_concrete c where not exists (SELECT * FROM orders o where o.apparel = c.id) and c.apparel = ?");
		statement.setInt(1, resultSet.getInt("id"));
		ResultSet nextResultSet = statement.executeQuery();
		while(nextResultSet.next()) {
			list.add(new ApparelConcrete(nextResultSet));
		}
		System.out.println(list.toString());
		return list;
	}

	private PreparedStatement getPreparedStatement(String sql) throws SQLException {
		connect();	
		return jdbcConnection.prepareStatement(sql);
	}

	private int getResult(PreparedStatement statement, String username, String column) throws SQLException {
		statement.setString(1, username);
		ResultSet resultSet = statement.executeQuery();
		return (resultSet.next()) ? resultSet.getInt(column) : 0; 
	}

	private <T> ArrayList<T> outList(ResultSet resultSet, Class<T> classOfT) throws NoSuchMethodException, SecurityException, InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException, SQLException {
		ArrayList<T> list = new ArrayList<T>();
		while(resultSet.next()) {
			Constructor<?> cons = classOfT.getConstructor(ResultSet.class);
			@SuppressWarnings("unchecked")
			T t = (T) cons.newInstance(resultSet);
			list.add(t);
		}
		
		return list;
	}

	private void logs(String action, HttpSession id) throws SQLException {
		String[] costr = action.split(":");
		PreparedStatement statement = getPreparedStatement("INSERT INTO logs (id_user, action) VALUES (?, ?)");
		statement.setInt(1, (int) id.getAttribute("id"));
		statement.setString(2, costr[1]);
		statementExecute(statement);
	}
	
	private void statementExecute(PreparedStatement statement) throws SQLException {
		if(statement.executeUpdate() == 1) {
			statement.close();
		}
		statement.close();	
	}
}
