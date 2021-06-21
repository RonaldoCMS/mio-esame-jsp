package website.com;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

import website.com.database.Database;
import website.com.obj.ApparelAbstract;

public class Core {
	
	private Database database;
	
	public Core() {
		database =  new Database("jdbc:mysql://localhost:3306/ddanubbios", "root", "");
	}

	public Database getDatabase() {
		return database;
	}

	public void setDatabase(Database database) {
		this.database = database;
	}
	
}
