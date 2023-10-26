import java.util.ArrayList;
import java.util.List;

public class User extends Account {
	 private List<Product> cart = new ArrayList<>();
	 private List<List<Product>> orderHistory = new ArrayList<>();
	public User(String name, String email, int phone, String password, int access) {
		super(name, email, phone, password, access);
		// TODO Auto-generated constructor stub
	}

public void checkAcount() {
	// TODO Auto-generated method stub
	super.checkAcount();
}
public void vertifiAcount() {
    if (getAccess() == 2) {
        System.out.println("User account verification.");
        // Implement user-specific verification logic here
    } else {if(getAccess()>2)
        System.out.println("Account hasn been vertifi.");
    }
}
public List<Product> getCarts() {
    return cart;
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
public static void main(String[] args) {
	System.out.println('a');
}
}
