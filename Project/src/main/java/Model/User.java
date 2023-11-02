package Model;

import java.sql.ResultSet;
import java.sql.SQLException;

public class User extends Account {
    public User(ResultSet result) throws SQLException {
        super(result);
    }

    public String convertToSql() {
        return "(" + "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", email='" + email + '\'' +
                ", phone='" + phone + '\'' +
                ", password='" + password + '\'' +
                ", access=" + access + ")";
    }
}
