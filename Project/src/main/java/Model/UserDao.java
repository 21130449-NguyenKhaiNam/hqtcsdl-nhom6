package Model;

import Utils.Encryption;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserDao {
    /**
     * Kiểm tra tài khoản thuộc loại nào
     */
    public static Account selectByEnP(Account user) throws SQLException {
        ResultSet result = RealismQuery.select(INameDB.USERS, null, "EMAIL=" + user.getEmail()
                + " AND PASSWORD=" + user.getPassword());
        Account ac = null;
        if(result.next()) {
            ac = new Account(result);
        }
        return ac;
    }

    /**
     * Lấy danh sách sản phẩm: admin thì lấy hết
     */
    public static List<Product> getCarts(Account user) throws SQLException {
        Account ac = selectByEnP(user);
        int access = ac.getAccess();
        List<Product> products = new ArrayList<>();
        if(access == 2) {
            ResultSet result = RealismQuery.select(INameDB.PRODUCTS, null, null);
           while(result.next()) {
               products.add(new Product(result));
           }
        } else if(access == 0 || access == 1){
            ResultSet result = RealismQuery.select(INameDB.CART, null, "ID=" + user.getId());
        }
        return products;
    }
}
