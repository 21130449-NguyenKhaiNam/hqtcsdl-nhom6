package Model;

import java.sql.SQLException;

public class TestDAO {
    public static void main(String[] args) throws SQLException {
        // Select sai tài khoản
//        User user = new User("gcullnean0@diigo.com", "1=1;--");
//        System.out.println(AccountDao.selectByEnP(user));

        // Select đúng tài khoản
//        User user = new User("gcullnean0@diigo.com", "y296qv#");
//        System.out.println(AccountDao.selectByEnP(user));

        // Select sản phẩm trong cart
//        User user = new User("gcullnean0@diigo.com", "y296qv#");
//        System.out.println(ProductDao.getCarts(user));

        // Select sản phẩm trong wish list
//        User user = new User("gcullnean0@diigo.com", "y296qv#");
//        System.out.println(ProductDao.getWishList(user));

        // Select order
//        User user = new User("gcullnean0@diigo.com", "y296qv#");
//        System.out.println(OrderDao.getOrders(AccountDao.selectByEnP(user))); // Có vấn đề trong data

        // Select voucher
        System.out.println(VoucherDao.getVouchers());
    }
}
