package Model;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import static Model.INameDB.*;

public class Product {
    private String id, name, material, img, kind, trademark, description, color, dimension;
    private double price;
    private int amount;
    private Date dateAdded;

    // Tự động thêm các nội dung khi sử dụng query
    public Product(ResultSet resultSet) throws SQLException {
        if (resultSet != null) {
            this.id = resultSet.getString(PRODUCT_ID).trim();
            this.name = resultSet.getString(PRODUCT_NAME_PD).trim();
            this.material = resultSet.getString(PRODUCT_METERIAL).trim();
            this.img = resultSet.getString(PRODUCT_IMAGE_MAIN);
            this.kind = resultSet.getString(PRODUCT_KIND).trim();
            this.trademark = resultSet.getString(PRODUCT_TRADEMARK).trim();
            this.description = resultSet.getString(PRODUCT_DECRIPTION).trim();
            this.color = resultSet.getString(PRODUCT_COLOR).trim();
            this.dimension = resultSet.getString(PRODUCT_DIMENSION).trim();
            this.price = resultSet.getDouble(PRODUCT_PRICE);
            this.amount = resultSet.getInt(PRODUCT_AMOUNT);
            this.dateAdded = resultSet.getDate(PRODUCT_DATE_ADDED);
        }
    }

    public String convertToSQL() {
        return "(" + "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", material='" + material + '\'' +
                ", img='" + img + '\'' +
                ", kind='" + kind + '\'' +
                ", trademark='" + trademark + '\'' +
                ", description='" + description + '\'' +
                ", color='" + color + '\'' +
                ", dimension=" + dimension +
                ", price=" + price +
                ", amount=" + amount +
                ", dateAdded=" + dateAdded + ")";
    }

    @Override
    public String toString() {
        return "Product{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", material='" + material + '\'' +
                ", img='" + img + '\'' +
                ", kind='" + kind + '\'' +
                ", trademark='" + trademark + '\'' +
                ", description='" + description + '\'' +
                ", color='" + color + '\'' +
                ", dimension='" + dimension + '\'' +
                ", price=" + price +
                ", amount=" + amount +
                ", dateAdded=" + dateAdded +
                '}';
    }
}
