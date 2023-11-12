package Model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import static Model.INameDB.*;

public class VoucherDao {
	/**
	 * Lấy danh sách voucher
	 * 
	 * @return
	 */
	public static List<Voucher> getVouchers() throws SQLException {
		return RealismQuery.select(new Voucher(), "SELECT * FROM " + VOUCHERS);
	}

	/**
	 * Kiểm tra voucher có sài được cho sản phẩm
	 * @throws SQLException 
	 */
	public static boolean checkVoucher(Voucher voucher, Product product) throws SQLException {
		int size = RealismQuery.select(new Voucher(),
				"SELECT * FROM " + VOUCHERS + " WHERE " + VOUCHERS_ID + " IN (SELECT " + APPLY_VOUCHER_ID + " FROM "
						+ APPLY_VOUCHER + " WHERE " + APPLY_VOUCHER_ID + "=? AND" + APPLY_VOUCHER_ID_PRODUCT + "=?)",
				voucher.getId(), product.getId()).size();
		return size != 0;
	}
}
