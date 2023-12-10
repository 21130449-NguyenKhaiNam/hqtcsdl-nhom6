package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Random;

import database.ConnectDatabase;
import model.Account;
import model.Gender;

import static database.ITableUser.*;

public class AccountDao {

	/**
	 * @param tel
	 * @param pass
	 * @return
	 */
	public static Account getAccount(String tel, String pass) {
		// TODO Auto-generated method stub
		try {
			String query = "SELECT " + ID + ", " + FULL_NAME + ", " + ROLE + ", " + STATUS + " FROM " + NAME_TABLE
					+ " WHERE " + PHONE + "=? AND " + PASS + "= ?";
			PreparedStatement ps = ConnectDatabase.C.prepareStatement(query);
			ps.setString(1, tel);
			ps.setString(2, pass);
			ResultSet rs = ps.executeQuery();
			Account ac = rs.next() ? new Account(rs) : null;
			return ac;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public static int insertAccount(Account ac) {
		try {
			String query = "INSERT INTO " + NAME_TABLE + " VALUES (?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement ps = ConnectDatabase.C.prepareStatement(query);
			ps.setString(1, ac.getId());
			ps.setString(2, ac.getFullName() + "@gmail.com");
			ps.setString(3, ac.getPhone());
			ps.setString(4, ac.getPassword());
			ps.setString(5, ac.getFullName());
			ps.setInt(6, Gender.getGender(1).getId());
			ps.setDate(7, null);
			ps.setInt(8, ac.getRole().getId());
			ps.setString(9, "...");
			ps.setInt(10, ac.getStatus().getId());
			int rs = ps.executeUpdate();
			return rs;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 0;
		}
	}

	public static String generateCode(int length) {
		String characterSet = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";

		if (length <= 0 || characterSet.isEmpty()) {
			throw new IllegalArgumentException("Invalid input parameters");
		}

		Random random = new Random();
		StringBuilder stringBuilder = new StringBuilder();

		for (int i = 0; i < length; i++) {
			int randomIndex = random.nextInt(characterSet.length());
			char randomChar = characterSet.charAt(randomIndex);
			stringBuilder.append(randomChar);
		}

		return stringBuilder.toString();
	}

}
