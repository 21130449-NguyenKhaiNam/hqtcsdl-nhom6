package Model;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;

import static Model.INameDB.*;

public class Product implements IRowMapper<Product> {
	private String id, name, material, img, kind, trademark, description, color, dimension;
	private double price;
	private int amount;
	private Date dateAdded;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String convertToSQL() {
		return "(" + "id='" + id + '\'' + ", name='" + name + '\'' + ", material='" + material + '\'' + ", img='" + img
				+ '\'' + ", kind='" + kind + '\'' + ", trademark='" + trademark + '\'' + ", description='" + description
				+ '\'' + ", color='" + color + '\'' + ", dimension=" + dimension + ", price=" + price + ", amount="
				+ amount + ", dateAdded=" + dateAdded + ")";
	}

	@Override
	public String toString() {
		return "Product{" + "id='" + id + '\'' + ", name='" + name + '\'' + ", material='" + material + '\'' + ", img='"
				+ img + '\'' + ", kind='" + kind + '\'' + ", trademark='" + trademark + '\'' + ", description='"
				+ description + '\'' + ", color='" + color + '\'' + ", dimension='" + dimension + '\'' + ", price="
				+ price + ", amount=" + amount + ", dateAdded=" + dateAdded + '}';
	}

	@Override
	public Product mapper(ResultSet resultSet) {
		// TODO Auto-generated method stub
		Product product = new Product();
		if (resultSet != null) {
			try {
				product.id = resultSet.getString(PRODUCT_ID).trim();
				product.name = resultSet.getString(PRODUCT_NAME_PD).trim();
				product.material = resultSet.getString(PRODUCT_METERIAL).trim();
				product.img = resultSet.getString(PRODUCT_IMAGE_MAIN);
				product.kind = resultSet.getString(PRODUCT_KIND).trim();
				product.trademark = resultSet.getString(PRODUCT_TRADEMARK).trim();
				product.description = resultSet.getString(PRODUCT_DECRIPTION).trim();
				product.color = resultSet.getString(PRODUCT_COLOR).trim();
				product.dimension = resultSet.getString(PRODUCT_DIMENSION).trim();
				product.price = resultSet.getDouble(PRODUCT_PRICE);
				product.amount = resultSet.getInt(PRODUCT_AMOUNT);
				product.dateAdded = resultSet.getDate(PRODUCT_DATE_ADDED);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return product;
	}
}
