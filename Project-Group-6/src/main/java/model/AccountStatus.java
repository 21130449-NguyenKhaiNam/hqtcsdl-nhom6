package model;

import java.util.HashMap;
import java.util.Map;

// Trạng thái của một tài khoản
public class AccountStatus {
	private int id;
	private String name;

	private static Map<Integer, AccountStatus> status = new HashMap<>();
	static {
		int i = 0;
		// Start 1
		status.put(++i, new AccountStatus(1, "Actice"));
		status.put(++i, new AccountStatus(2, "Block"));
		status.put(++i, new AccountStatus(3, "Unconfimred"));
	}

	private AccountStatus(int id, String name) {
		this.id = id;
		this.name = name;
	}

	// Lấy ra trạng thái của tài khoản
	public static AccountStatus getStatus(int id) {
		return status.get(id);
	}

	/**
	 * @return the id
	 */
	public int getId() {
		return id;
	}

	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}

}
