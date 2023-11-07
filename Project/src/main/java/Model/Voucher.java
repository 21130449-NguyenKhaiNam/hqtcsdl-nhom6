package Model;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;

import static Model.INameDB.*;

public class Voucher {
    private String id;
    private double percentDecrease;
    private Date dateStart, dateEnd;

    public Voucher(ResultSet resultSet) throws SQLException {
        if(resultSet != null) {
            this.id = resultSet.getString(VOUCHERS_ID).trim();
            this.percentDecrease = Double.parseDouble(String.valueOf(resultSet.getFloat(VOUCHERS_PERCENT_DECREASE)).trim());
            this.dateStart = resultSet.getDate(VOUCHERS_DATE_START);
            this.dateEnd = resultSet.getDate(VOUCHERS_DATE_END);
        }
    }

    @Override
    public String toString() {
        return "Voucher{" +
                "id='" + id + '\'' +
                ", percentDecrease=" + percentDecrease +
                ", dateStart=" + dateStart +
                ", dateEnd=" + dateEnd +
                '}';
    }
}
