package Model;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Product {
    private String id, name, material, img, kind, trademark, description, color;
    private double dimension, price;
    private int amount;
    private Date dateAdded;

    public Product(ResultSet resultSet) throws SQLException {
        if(resultSet != null) {
            this.id = resultSet.getString("ID");
            this.name = resultSet.getString("NAME");
            this.material = resultSet.getString("MATERIAL");
            this.img = resultSet.getString("IMG");
            this.kind = resultSet.getString("KIND");
            this.trademark = resultSet.getString("TRADEMARK");
            this.description = resultSet.getString("DESCRIPTION");
            this.color = resultSet.getString("COLOR");
            this.dimension = resultSet.getDouble("DIMENSION");
            this.price = resultSet.getDouble("PRICE");
            this.amount = resultSet.getInt("AMOUNT");
            this.dateAdded = resultSet.getDate("DATE_ADDED");
        }
    }
}
