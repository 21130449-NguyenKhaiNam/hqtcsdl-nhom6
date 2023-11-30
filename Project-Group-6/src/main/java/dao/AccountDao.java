package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import database.ConnectDatabase;
import model.Account;
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
			String query = "SELECT " + ID + ", " + ROLE + ", " + STATUS + " FROM " + NAME_TABLE + " WHERE " + PHONE
					+ "=? AND " + PASS + " LIKE ?";
			System.out.println(query);
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

	public static void main(String[] args) {
		System.out.println(getAccount("925-741-3326", "$2a$04$32Xy5/f2FXQBF3dS66tAs.mK0/jN7J9yT2.j3Mp76fczXngWMyHP2"));
	}

}
