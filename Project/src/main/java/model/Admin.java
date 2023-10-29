package model;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

public class Admin extends Account {
    private List<Product> systemProducts = new ArrayList<>();
    private List<User> users = new ArrayList<>(); // A list of user accounts
    private List<String> vouchers = new ArrayList<>();

    public Admin(String name, String email, int phone, String password, int access) {
        super(name, email, phone, password, access);
        // TODO Auto-generated constructor stub
    }

    @Override
    public void checkAcount() {
        // TODO Auto-generated method stub
        super.checkAcount();
    }

    public List<Product> getCarts() {
        return systemProducts;
    }

    public void addCarts(Product product) {
        systemProducts.add(product);
    }

    public List<List<Product>> getOrders() {
        // Admin can access all user orders; return order history for all users
        List<List<Product>> allUserOrders = new ArrayList<>();
        // Implement logic to fetch order history for all users and add them to
        // allUserOrders
        return allUserOrders;
    }

    public List<User> getUsers() {
        List<User> usersWithPermissions = new ArrayList<>();
        for (User user : users) {
            if (user.getAccess() >= 2) {
                // Admins and users with higher access levels are added to the list
                usersWithPermissions.add(user);
            }
        }
        return usersWithPermissions;
    }

    @Override
    public int hashCode() {
        return Objects.hash(systemProducts, users, vouchers);
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (getClass() != obj.getClass())
            return false;
        Admin other = (Admin) obj;
        return Objects.equals(systemProducts, other.systemProducts) && Objects.equals(users, other.users)
                && Objects.equals(vouchers, other.vouchers);
    }

    // Method to add a user to the list
    public void addUser(User user) {
        users.add(user);
    }

    public void setAccess(Account account, int newAccess) {
        account.setAccess(newAccess);
    }

    public List<String> getVouchers() {
        return vouchers;
    }

    // Method to add a voucher to the list
    public void addVoucher(String voucher) {
        vouchers.add(voucher);
    }

    public static void main(String[] args) {
        System.out.println("aaaaa");
    }
}
