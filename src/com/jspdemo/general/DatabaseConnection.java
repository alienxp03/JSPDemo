package com.jspdemo.general;

import java.sql.DriverManager;
import java.sql.Connection;

/**
 * 
 * @author tokwan
 * @version 0.1
 * @description 
 */
public class DatabaseConnection {

	// Please change these variables based on your own connection
	private static final String username = "ftmk";
	private static final String password = "ftmk";
	private static final String port = "1522";
	private static final String server = "localhost";
	private static final String serviceName = "orcl";

	/**
	 * @author tokwan
	 * @return
	 */
	public static Connection getConnection() {
		Connection conn = null;

		try {
			//jdbc:oracle:thin:@localhost:1521:ORCL
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(
					"jdbc:oracle:thin:@//"+server+":"+port+"/"+serviceName,
					username, password);

		} catch (ClassNotFoundException e) {
			System.out.println("Where is your Oracle JDBC Driver?");
			e.printStackTrace();
		} catch (Exception e) {
			System.out.println("Something is wrong");
			e.printStackTrace();
		} 

		return conn;
	}

}