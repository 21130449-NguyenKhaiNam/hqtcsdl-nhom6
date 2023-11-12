package Model;

import static Model.INameDB.ORDERS;
import static Model.INameDB.ORDER_ID_USER;

import java.sql.SQLException;
import java.util.List;

public class OrderDao {
	/**
	 * Lấy danh sách hóa đơn
	 *
	 * @param account
	 * @return
	 */
	public static List<Order> getOrders(Account account) throws SQLException {
		return account.getAccess() == Access.ADMIN ? RealismQuery.select(new Order(), "SELECT * FROM " + ORDERS)
				: RealismQuery.select(new Order(), "SELECT * FROM " + ORDERS + " WHERE " + ORDER_ID_USER + "=?",
						account.getId());
	}
}
