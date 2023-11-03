package Model;

import java.sql.ResultSet;
import java.sql.SQLException;

public class User extends Account {
    public User(ResultSet result) throws SQLException {
        super(result);
    }

    @Override
    public void setAccess(int access) {
        super.setAccess(access);
    }

    public String convertToSql() {
        return "(" + "ID='" + id + '\'' +
                ", NAME='" + name + '\'' +
                ", EMAIL='" + email + '\'' +
                ", PHONE='" + phone + '\'' +
                ", PASSWORD='" + password + '\'' +
                ", ACCESS=" + access + ")";
    }
}
