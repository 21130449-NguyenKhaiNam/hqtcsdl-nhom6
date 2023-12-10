package model;

import java.io.File;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Random;

public class Product {
	private int id;
	private String name;
	private double price;
	private String path;

	/**
	 * @param id
	 * @param name
	 * @param price
	 */
	public Product(int id, String name, double price) {
		this.id = id;
		this.name = name;
		this.price = price;
	}

	public Product(ResultSet rs) throws SQLException {
		// TODO Auto-generated constructor stub
		if (rs != null) {
			this.id = rs.getInt("id");
			this.name = rs.getString("productsName");
			this.price = rs.getDouble("price");
		}
	}

	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}

	/**
	 * @return the price
	 */
	public double getPrice() {
		return price;
	}

	/**
	 * @return the id
	 */
	public int getId() {
		return id;
	}

	/**
	 * @param path the path to set
	 */
	public void setPath(String path) {
		this.path = path;
	}
	
	

	/**
	 * @return the path
	 */
	public String getPath() {
		return path;
	}

	@Override
	public String toString() {
		return "Product [id=" + id + ", name=" + name + ", price=" + price + ", path=" + path + "]";
	}

}
