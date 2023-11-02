package Model;

import Utils.Encryption;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Account {
    private String id, name, email, phone, password;
    private int access;
    private String code;
    private Date expiredTime;

    public Account(ResultSet result) throws SQLException {
        if(result != null) {
            id = result.getString("ID");
            name = result.getString("USERNAME");
            email = result.getString("EMAIL");
            phone = result.getString("PHONE");
            password = result.getString("PASSWORD");
            access = Integer.parseInt(result.getString("ACCESS"));
        }
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
     * Kiểm tra một tài khoản nhận vào có đúng cú pháp
     * @return
     */
    public boolean validAccount() {
        return !(id == null || id.isEmpty() || name == null || name.isEmpty() || email == null || email.isEmpty()
            || phone == null || phone.isEmpty() || password == null || password.isEmpty() || Access.validAccess(access));
    }
}
