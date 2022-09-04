package duan_crm.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MySqlConnection {
	private static final String url = "jdbc:mysql://localhost:3307/crm";
	//private static final String url = "jdbc:mysql://remotemysql.com:3306/JSoG2MDypg";
	
	public static Connection getConnection() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			return DriverManager.getConnection(url, "root", "admin");
			//return DriverManager.getConnection(url, "JSoG2MDypg", "nPD4N2eYcH");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
}
