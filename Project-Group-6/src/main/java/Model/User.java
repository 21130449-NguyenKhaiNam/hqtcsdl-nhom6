package Model;

import java.sql.ResultSet;
import java.sql.SQLException;

public class User extends Account {

	public User(String id, String name, String email, String phone, String password, int access) {
		super(id, name, email, phone, password, access);
	}

	public User(String email, String password) {
		super(email, password);
	}

	public User(String name, String email, String phone, String password) {
		super(name, email, phone, password);
	}

	public User() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public void setAccess(int access) {
		super.setAccess(access);
	}

	public String convertToSql() {
		return "(" + "ID='" + id + '\'' + ", NAME='" + name + '\'' + ", EMAIL='" + email + '\'' + ", PHONE='" + phone
				+ '\'' + ", PASSWORD='" + password + '\'' + ", ACCESS=" + access + ")";
	}
}
