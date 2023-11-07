package Model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import static Model.INameDB.*;

public class VoucherDao {
    /**
     * Lấy danh sách voucher
     * @return
     */
    public static List<Voucher> getVouchers() throws SQLException {
        List<Voucher> vouchers = new ArrayList<>();
        ResultSet resultSet = RealismQuery.select(VOUCHERS, null, null);
        while(resultSet.next()) {
            vouchers.add(new Voucher(resultSet));
        }
        return vouchers;
    }

    /**
     * Kiểm tra voucher có sài được cho sản phẩm
     */
    public static boolean checkVoucher(Voucher voucher, Product product) {
        return false;
    }
}
