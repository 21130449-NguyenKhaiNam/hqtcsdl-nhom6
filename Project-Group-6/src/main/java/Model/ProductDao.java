package Model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import static Model.INameDB.*;

public class ProductDao {
	/**
	 * Lấy danh sách sản phẩm: admin thì lấy hết
	 */
	public static List<Product> getCarts(Account user) throws SQLException {
		return user.getAccess() == Access.ADMIN ? RealismQuery.select(new Product(), "SELECT * FROM " + PRODUCTS)
				: RealismQuery
						.select(new Product(),
								"SELECT * FROM " + PRODUCTS + " WHERE " + PRODUCT_ID + " IN " + "(SELECT "
										+ CART_ID_PRODUCT + " FROM " + CART + " WHERE " + CART_ID_USER + "=?)",
								user.getId());
	}

	/**
	 * Lấy danh sách sản phẩm yêu thích
	 */
	public static List<Product> getWishList(User user) throws SQLException {
		return RealismQuery.select(new Product(), "SELECT * FROM " + WISH_LIST + " WHERE " + WISH_LIST_ID_USER + "=?",
				user.getId());
	}

}
