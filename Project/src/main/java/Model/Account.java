package Model;

import java.util.List;
import java.util.Objects;

public abstract class Account {
    protected String id, name, email, phone, password;
    protected int access;

    public Account(String id, String name, String email, String phone, String password, int access) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.password = password;
        this.access = access;
    }

    public Account() {
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
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

    public void checkAcount() {
        System.out.println(name);
        System.out.println(email);
        System.out.println(phone);
        if (access == 1) {
            System.out.println("Admin");
        }
        System.out.println();
    }

    public int hashCode() {
        return Objects.hash(access, email, name, password, phone);
    }

    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (getClass() != obj.getClass())
            return false;
        Account other = (Account) obj;
        return access == other.access && Objects.equals(email, other.email) && Objects.equals(name, other.name)
                && Objects.equals(password, other.password) && phone == other.phone;
    }


}
