package database;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class test {
    public static void main(String[] args) throws SQLException {
        // TODO Auto-generated method stub
        Connection connect = ConnectDatabase.C;
        Statement st = connect.createStatement();
        ResultSet r = st.executeQuery("SELECT * FROM USERS");
        while(r.next()) {
        	System.out.println(r.getObject(1));
        }
    }
}
