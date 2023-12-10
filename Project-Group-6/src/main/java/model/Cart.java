package model;

import java.util.HashMap;
import java.util.Map;

public class Cart {
	private Account ac;
	private Map<Product, Integer> products;

	/**
	 * @param ac
	 * @param products
	 */
	public Cart(Account ac) {
		this.ac = ac;
		this.products = new HashMap<Product, Integer>();
	}

	/**
	 * @return the ac
	 */
	public Account getAc() {
		return ac;
	}

	/**
	 * @param ac the ac to set
	 */
	public void setAc(Account ac) {
		this.ac = ac;
	}

	/**
	 * @return the products
	 */
	public Map<Product, Integer> getProducts() {
		return products;
	}

	/**
	 * @param products the products to set
	 */
	public void setProducts(Map<Product, Integer> products) {
		this.products = products;
	}

	public int getSize() {
		return products.size();
	}

	public void addProduct(Product p) {
		this.products.put(p, 1);
	}

}
