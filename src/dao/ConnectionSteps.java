package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionSteps {

	private static Connection connection = null;
	
	public  Connection connection() throws ClassNotFoundException, SQLException {
		
				if(null == connection)
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "ttm", "ttm");
		}
	    return connection;
	
}
}
