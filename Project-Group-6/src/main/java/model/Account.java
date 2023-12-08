package model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;

import static database.ITableUser.*;

public class Account {
	String id;
	String email;
	String phone;
	String password;
	String fullName;
	Gender gender;
	LocalDate dob;
	AccountRole role;
	String usersAddress;
	AccountStatus status;

	/**
	 * @param id
	 * @param email
	 * @param phone
	 * @param password
	 * @param fullName
	 * @param gender
	 * @param dob
	 * @param role
	 * @param usersAddress
	 * @param status
	 */
	public Account(String id, String email, String phone, String password, String fullName, Gender gender,
			LocalDate dob, AccountRole role, String usersAddress, AccountStatus status) {
		this.id = id;
		this.email = email;
		this.phone = phone;
		this.password = password;
		this.fullName = fullName;
		this.gender = gender;
		this.dob = dob;
		this.role = role;
		this.usersAddress = usersAddress;
		this.status = status;
	}

	public Account(ResultSet rs) throws SQLException {
		// TODO Auto-generated constructor stub
		if (rs != null) {
			this.id = rs.getString(ID);
			this.fullName = rs.getString(FULL_NAME);
			this.role = AccountRole.getRole(rs.getInt(ROLE));
			this.status = AccountStatus.getStatus(rs.getInt(STATUS));
		}
	}

	/**
	 * @param id
	 * @param phone
	 * @param password
	 * @param fullName
	 * @param role
	 * @param status
	 */
	public Account(String id, String phone, String password, String fullName, AccountRole role, AccountStatus status) {
		super();
		this.id = id;
		this.phone = phone;
		this.password = password;
		this.fullName = fullName;
		this.role = role;
		this.status = status;
	}

	@Override
	public String toString() {
		return "Account [id=" + id + ", email=" + email + ", phone=" + phone + ", password=" + password + ", fullName="
				+ fullName + ", gender=" + gender + ", dob=" + dob + ", role=" + role + ", usersAddress=" + usersAddress
				+ ", status=" + status + "]";
	}

	/**
	 * @return the fullName
	 */
	public String getFullName() {
		return fullName;
	}

}
