package Model;

import java.sql.ResultSet;
import java.sql.SQLException;

public class User extends Account {

    public User(String id, String name, String email, String phone, String password, int access) {
        super(id, name, email, phone, password, access);
    }

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
