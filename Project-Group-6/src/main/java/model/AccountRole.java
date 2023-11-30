package model;

import java.util.HashMap;
import java.util.Map;

// Vai trò của một tài khoản
public class AccountRole {
	private int id;
	private String name;

	private static Map<Integer, AccountRole> roles = new HashMap<>();
	static {
		int i = 0;
		// Start 1
		roles.put(++i, new AccountRole(1, "Super Admin"));
		roles.put(++i, new AccountRole(2, "Admin"));
		roles.put(++i, new AccountRole(3, "Service"));
		roles.put(++i, new AccountRole(4, "User"));
		roles.put(++i, new AccountRole(5, "Guest"));
	}

	private AccountRole(int id, String name) {
		// Nothing
	}

	// Lấy ra vai trò của tài khoản
	public static AccountRole getRole(int id) {
		return roles.get(id);
	}
}
