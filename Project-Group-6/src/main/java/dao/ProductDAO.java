package dao;

import static database.ITableUser.FULL_NAME;
import static database.ITableUser.ID;
import static database.ITableUser.NAME_TABLE;
import static database.ITableUser.PASS;
import static database.ITableUser.PHONE;
import static database.ITableUser.ROLE;
import static database.ITableUser.STATUS;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import database.ConnectDatabase;
import model.Account;
import model.Product;

public class ProductDAO {

	public static List<Product> getRandom(int i) {
		// TODO Auto-generated method stub
		try {
			String query = "SELECT TOP " + i + " * FROM products";
			PreparedStatement ps = ConnectDatabase.C.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			List<Product> products = new ArrayList<Product>();
			while(rs.next()) {
				products.add(new Product(rs));
			}
			return products;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
}
