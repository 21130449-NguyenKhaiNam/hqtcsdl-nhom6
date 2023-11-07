package Model;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;

import static Model.INameDB.*;

public class Order {
    private String id, idProduct;
    private Date dateOrder;
    private Date dateReceipt;

    private int status;

    // Tự động thêm các nội dung khi sử dụng query
    public Order(ResultSet resultSet) throws SQLException {
        if(resultSet != null) {
            this.id = resultSet.getString(ORDER_ID).trim();
            this.idProduct = resultSet.getString(ORDER_ID_USER).trim();
            this.dateOrder = resultSet.getDate(ORDER_DATE_ORDER);
            this.dateReceipt = resultSet.getDate(ORDER_DATE_RECEIPT);
            this.status = Integer.parseInt(resultSet.getString(ORDER_STATUS_ORDER));
        }
    }

}
