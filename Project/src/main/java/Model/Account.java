package Model;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import static Model.INameDB.*;

public class Account {
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

    // Tự động thêm các nội dung khi sử dụng query
    public Account(ResultSet result) throws SQLException {
        if (result != null) {
            id = result.getString(USER_ID).trim();
            name = result.getString(USER_USERNAME).trim();
            email = result.getString(USER_EMAIL).trim();
            phone = result.getString(USER_PHONE).trim();
            password = result.getString(USER_PASSWORD).trim();
            access = Integer.parseInt(result.getString(USER_ACCESS).trim());
        }
    }

    // Kiểm tra tài khoản
    public Account(String email, String password) {
        this.email = email;
        this.password = password;
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
                || phone == null || phone.isEmpty() || password == null || password.isEmpty() || Access.validAccess(access));
    }

    @Override
    public String toString() {
        return "Account{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", email='" + email + '\'' +
                ", phone='" + phone + '\'' +
                ", password='" + password + '\'' +
                ", access=" + access +
                '}';
    }
}
