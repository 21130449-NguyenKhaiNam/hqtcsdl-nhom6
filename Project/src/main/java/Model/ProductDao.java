package Model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductDao {
    /**
     * Lấy danh sách sản phẩm: admin thì lấy hết
     */
    public static List<Product> getCarts(Account user) throws SQLException {
        Account ac = AccountDao.selectByEnP(user);
        List<Product> products = new ArrayList<>();
        int access = ac.getAccess();
        ResultSet result = null;
        if(access == Access.ADMIN) {
            result = RealismQuery.select(INameDB.PRODUCTS, null, null);
        } else if(access == Access.UNAUTHENTICATED || access == Access.NORMAL){
            result = RealismQuery.select("SELECT * FROM " + INameDB.PRODUCTS + " WHERE ID IN " +
                    "(SELECT ID_PRODUCT FROM " + INameDB.CART + "WHERE ID_USER=" + ac.getId() +")");
        }
        while(result != null && result.next()) {
            products.add(new Product(result));
        }
        return products;
    }

    /**
     * Cập nhật thông tin sản phẩm
     */
    public static int updateProduct(Product product) {
        return -1;
    }

    /**
     * Lấy danh sách sản phẩm yêu thích
     */
    public static List<Product> getWishList(User user) {
        return null;
    }
}
