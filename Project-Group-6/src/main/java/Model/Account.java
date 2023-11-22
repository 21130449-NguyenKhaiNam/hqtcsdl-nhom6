package Model;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import static Model.INameDB.*;

public class Account implements IRowMapper<Account> {
	protected String id, name, email, phone, password;
	protected int access;
	private String code;
	private Date expiredTime;

	// Contructor kiến nghị sử dụng để tạo account
	public Account(String name, String email, String phone, String password) {
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.password = password;
	}

	// Contructor này chỉ sử dụng để test không khuyến cáo sử dụng
	public Account(String id, String name, String email, String phone, String password, int access) {
		this.id = id;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.password = password;
		this.access = access;
	}

	// Kiểm tra tài khoản
	public Account(String email, String password) {
		this.email = email;
		this.password = password;
	}

	public Account() {
		// TODO Auto-generated constructor stub
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getAccess() {
		return access;
	}

	public void setAccess(int access) {
		this.access = access;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public Date getExpiredTime() {
		return expiredTime;
	}

	public void setExpiredTime(Date expiredTime) {
		this.expiredTime = expiredTime;
	}

	/**
	 * Kiểm tra tài khoản nhận vào có đúng cú pháp
	 *
	 * @return
	 */
	public boolean validAccount() {
		return !(id == null || id.isEmpty() || name == null || name.isEmpty() || email == null || email.isEmpty()
				|| phone == null || phone.isEmpty() || password == null || password.isEmpty()
				|| Access.validAccess(access));
	}

	@Override
	public String toString() {
		return "Account{" + "id='" + id + '\'' + ", name='" + name + '\'' + ", email='" + email + '\'' + ", phone='"
				+ phone + '\'' + ", password='" + password + '\'' + ", access=" + access + '}';
	}

	@Override
	public Account mapper(ResultSet resultSet) {
		// TODO Auto-generated method stub
		Account ac = new Account();
		if (resultSet != null) {
			try {
				ac.id = resultSet.getString(USER_ID).trim();
				ac.name = resultSet.getString(USER_USERNAME).trim();
				ac.email = resultSet.getString(USER_EMAIL).trim();
				ac.phone = resultSet.getString(USER_PHONE).trim();
				ac.password = resultSet.getString(USER_PASSWORD).trim();
				ac.access = Integer.parseInt(resultSet.getString(USER_ACCESS).trim());
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        }
		return ac;
	}
}
