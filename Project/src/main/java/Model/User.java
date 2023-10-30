package Model;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

public class User extends Account {

    private String code;
    private Date expiredTime;
    private List<Product> cart = new ArrayList<>();
    private List<List<Product>> orderHistory = new ArrayList<>();

    public User(String id, String name, String email, String phone, String password, int access, String code, Date expiredTime, List<Product> cart, List<List<Product>> orderHistory) {
        super(id, name, email, phone, password, access);
        this.code = code;
        this.expiredTime = expiredTime;
        this.cart = cart;
        this.orderHistory = orderHistory;
    }

    public User() {
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

    public List<Product> getCart() {
        return cart;
    }

    public void setCart(List<Product> cart) {
        this.cart = cart;
    }

    public List<List<Product>> getOrderHistory() {
        return orderHistory;
    }

    public void setOrderHistory(List<List<Product>> orderHistory) {
        this.orderHistory = orderHistory;
    }

    public void vertifiAcount() {
        if (getAccess() == 2) {
            System.out.println("User account verification.");
            // Implement user-specific verification logic here
        } else {
            if (getAccess() > 2)
                System.out.println("Account hasn been vertifi.");
        }
    }

    public void addCarts(Product product) {
        cart.add(product);
    }

    public List<List<Product>> getOrders() {
        return orderHistory;
    }

    public void placeOrder() {
        // When a user places an order, move the cart to order history
        orderHistory.add(new ArrayList<>(cart));
        cart.clear(); // Empty the cart after placing the order
    }
}
