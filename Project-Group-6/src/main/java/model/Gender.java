package model;

import java.util.HashMap;
import java.util.Map;

// Định nghĩa giới tính cho một người dùng
public class Gender {
	private int id;
	private String sex;

	private static Map<Integer, Gender> sexs = new HashMap<>();
	// Thêm các giá trị
	static {
		int i = 0;
		// Start 1
		sexs.put(++i, new Gender(1, "NAM"));
		sexs.put(++i, new Gender(2, "NỮ"));
		sexs.put(++i, new Gender(3, "KHÁC"));
	}

	// Chỉ là hàm khởi tạo
	private Gender(int id, String sex) {
		this.id = id;
		this.sex = sex;
	}

	// Lấy ra thuộc tính gender cụ thể
	public static Gender getGender(int id) {
		return sexs.get(id);
	}

	/**
	 * @return the id
	 */
	public int getId() {
		return id;
	}

	/**
	 * @return the sex
	 */
	public String getSex() {
		return sex;
	}

}
