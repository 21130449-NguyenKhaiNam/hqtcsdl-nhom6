package Model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

public class Admin extends Account {

    public Admin(ResultSet result) throws SQLException {
        super(result);
    }
}
