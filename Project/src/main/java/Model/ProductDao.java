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
        List<Account> accounts = AccountDao.selectByEnP(user);
        List<Product> products = new ArrayList<>();
        if(accounts.size() > 1) {
            System.out.println("[Products-getCarts] >> Đã có vấn đề trong cơ sở dữ liệu " +
                    "hãy kiểm tra câu lệnh insert hoặc dữ liệu trong DB");
            return products;
        }
        Account ac = accounts.get(0);
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

    public static boolean updateProduct(Admin admin, Product product) {
        return false;
    }
}
