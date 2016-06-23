package iprog;
import java.sql.*;

public class _DB_CONNECTION {
	String connectionURL;
	Connection connection;
	
	public _DB_CONNECTION () {
		connection = null;	
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			connection = DriverManager.getConnection(_CONFIG.DB_URL, _CONFIG.DB_USERNAME,_CONFIG.DB_PASS);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
	} 
	// Execute a simple query and get a RS in return.
	public ResultSet executeQuery (String query) {
		System.out.println("will issue> "+query);
		Statement statement = null;	
		try {
			statement = this.connection.createStatement();
			return statement.executeQuery(query);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	} 
	public int executeUpdate (String query) {
		System.out.println("will issue> "+query);

		Statement statement = null;	
		try {
			statement = this.connection.createStatement();
			return statement.executeUpdate(query);
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	} 
	public boolean exists(String table, String column, String value) {

		String sqlSelect = "SELECT * FROM "+ table + " WHERE "+ column + " =\"" + value  + "\";";	
		ResultSet rs = this.executeQuery(sqlSelect);
		
		try {
			boolean result = !( rs == null || !rs.next() );
			rs.close();
			return result;
		} catch (SQLException e) {
			System.out.println("WARNING: EXCEPTION THROWN\n");
			return false;
		}

	} 
}
