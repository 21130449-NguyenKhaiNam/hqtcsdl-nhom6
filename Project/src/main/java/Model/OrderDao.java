package Model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import static Model.INameDB.ORDERS;
import static Model.INameDB.ORDER_ID_USER;

public class OrderDao {
    /**
     * Lấy danh sách hóa đơn
     *
     * @param account
     * @return
     */
    public static List<Order> getOrders(Account account) throws SQLException {
        List<Order> orders = new ArrayList<>();
        ResultSet resultSet = null;
        if (account.getAccess() == Access.ADMIN) {
            resultSet = RealismQuery.select(ORDERS, null, null);
        } else {
            resultSet = RealismQuery.select("SELECT * FROM " + ORDERS + " WHERE " + ORDER_ID_USER
                    + "='" + account.getId() + "'");
        }
        while (resultSet != null && resultSet.next()) {
            orders.add(new Order(resultSet));
        }
        return orders;
    }
}
