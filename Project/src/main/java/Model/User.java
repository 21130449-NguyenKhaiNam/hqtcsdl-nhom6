package Model;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class User extends Account {


    public User(ResultSet result) throws SQLException {
        super(result);
    }
}
