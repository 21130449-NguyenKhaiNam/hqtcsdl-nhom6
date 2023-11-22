package Model;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;

import static Model.INameDB.*;

public class Order implements IRowMapper<Order> {
	private String id, idProduct;
	private Date dateOrder;
	private Date dateReceipt;
	private int status;

	@Override
	public Order mapper(ResultSet resultSet) {
		// TODO Auto-generated method stub
		Order order = new Order();
		if (resultSet != null) {
			try {
				order.id = resultSet.getString(ORDER_ID).trim();
				order.idProduct = resultSet.getString(ORDER_ID_USER).trim();
				order.dateOrder = resultSet.getDate(ORDER_DATE_ORDER);
				order.dateReceipt = resultSet.getDate(ORDER_DATE_RECEIPT);
				order.status = Integer.parseInt(resultSet.getString(ORDER_STATUS_ORDER));
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return order;
	}

}
