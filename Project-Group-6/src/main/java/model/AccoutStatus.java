package model;

import java.util.HashMap;
import java.util.Map;

// Trạng thái của một tài khoản
public class AccoutStatus {
	private static Map<Integer, AccoutStatus> status = new HashMap<>();
	static {
		int i = 0;
		// Start 1
		status.put(++i, new AccoutStatus(1, "Actice"));
		status.put(++i, new AccoutStatus(2, "Block"));
		status.put(++i, new AccoutStatus(3, "Unconfimred"));
	}

	private AccoutStatus(int id, String name) {
		// Nothing
	}

	// Lấy ra trạng thái của tài khoản
	public static AccoutStatus getStatus(int id) {
		return status.get(id);
	}
}
