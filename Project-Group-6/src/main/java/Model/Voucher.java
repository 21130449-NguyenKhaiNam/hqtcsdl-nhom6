package Model;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;

import static Model.INameDB.*;

public class Voucher implements IRowMapper<Voucher> {
	private String id;
	private double percentDecrease;
	private Date dateStart, dateEnd;

	@Override
	public String toString() {
		return "Voucher{" + "id='" + id + '\'' + ", percentDecrease=" + percentDecrease + ", dateStart=" + dateStart
				+ ", dateEnd=" + dateEnd + '}';
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Override
	public Voucher mapper(ResultSet resultSet) {
		// TODO Auto-generated method stub
		Voucher voucher = new Voucher();
		if (resultSet != null) {
			try {
				voucher.id = resultSet.getString(VOUCHERS_ID).trim();
				voucher.percentDecrease = Double
						.parseDouble(String.valueOf(resultSet.getFloat(VOUCHERS_PERCENT_DECREASE)).trim());
				voucher.dateStart = resultSet.getDate(VOUCHERS_DATE_START);
				voucher.dateEnd = resultSet.getDate(VOUCHERS_DATE_END);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return voucher;
	}
}
