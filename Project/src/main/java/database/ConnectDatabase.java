package database;

import static database.IManagementDB.*;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectDatabase {
	public static final Connection C = getConnect(NAME, PORT, NAME_DB, USER, PASS);

	/**
	 * Kết nối tới cơ sở dữ liệu. Thông tin nhận vào là name - tên máy kết nối,
	 * dbName - tên database, user - tài khoản, password - mật khâủ, port - cổng kết
	 * nối thường là 1433
	 * 
	 * @throws SQLException
	 */
	private static Connection getConnect(String name, int port, String dbName, String user, String password) {
		Connection connect = null;
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			connect = DriverManager.getConnection("jdbc:sqlserver://" + name + ":" + port + ";databaseName=" + dbName
					+ ";user=" + user + ";password=" + password + ";encrypt=false");

		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return connect;
	}

	/**
	 * Ngắt kết nối
	 */
	public static void closeConnectio(Connection connect) {
		try {
			if (connect != null)
				connect.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
