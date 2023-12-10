package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import static database.IManagementDB.*;

public class ConnectDatabase {
	public static final Connection C = getConnect(NAME, PORT, NAME_DB, USER, PASS);
	private static Connection connection = null;

	/**
	 * Kết nối tới cơ sở dữ liệu. Thông tin nhận vào là name - tên máy kết nối,
	 * dbName - tên database, user - tài khoản, password - mật khâủ, port - cổng kết
	 * nối thường là 1433
	 *
	 * @throws SQLException
	 */
	private static Connection getConnect(String name, int port, String dbName, String user, String password) {
		try {
			if (connection == null) {
				Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
				connection = DriverManager.getConnection("jdbc:sqlserver://" + name + ":" + port + ";databaseName="
						+ dbName + ";user=" + user + ";password=" + password + ";encrypt=false");
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return connection;
	}

	/**
	 * Ngắt kết nối
	 */
	public static void closeConnection(Connection connect) {
		try {
			if (connect != null) {
				connection = null;
				connect.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
