package Model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import static Model.INameDB.*;

public class AccountDao {
	/**
	 * Lấy ra tài khoản nếu có tồn tại, chỉ trả về một danh sách tài khoản, giả sử
	 * trường hợp có từ 2 tài khoản thì là đã thiết kế sai việc insert trong csdl,
	 * không tài tại thì nghĩa là chưa có tài khoản
	 */
	public static Account selectByEnP(Account user) throws SQLException {
		List<Account> accounts = RealismQuery.select(new Account(),
				"SELECT * FROM " + USERS + " WHERE " + USER_EMAIL + "=? AND " + USER_PASSWORD + "=?", user.getEmail(),
				user.getPassword());
		if (accounts.size() > 1 || accounts.size() == 0) {
			System.out.println("Có lỗi trong đăng nhập account");
			return null;
		}
		return accounts.get(0);
	}

	/**
	 * Thêm tài khoản vào db tuy nhiên không được thêm admin kết quả trả về là số
	 * biểu thị hoàn thành hay không, > 0 - hoàn thành, = 0 - không hoàn thành (có
	 * thể thiếu dữ liệu) = -1 - Có lỗi xảy ra
	 */
	public static int insertUser(User user) throws SQLException {
		return RealismQuery.insert("INSERT INTO " + USERS + " VALUES ()", user.getId(), user.getName(), user.getEmail(),
				user.getPhone(), user.getPassword(), user.getAccess() + "");
	}

	/**
	 * Lấy danh sách tài khoản, tuy nhiên không lấy password và chỉ admin được phép
	 * gọi hàm
	 */
	public static List<Account> getUsers(Admin admin) throws SQLException {
		return admin.getAccess() == Access.ADMIN ? RealismQuery.select(new Account(), "SELECT * FROM " + USERS, null)
				: null;
	}

	/**
	 * Cập nhật thông tin của account
	 */
	public static int updateInfo(Account account, String name, String email, String phone, String password, int access)
			throws SQLException {
		String data = "";
		List<String> list = new ArrayList<String>();
		if (name != null || name.isEmpty()) {
			data += USER_USERNAME + "=?";
			list.add(name);
		}
		if (email != null || email.isEmpty()) {
			data += ", " + USER_EMAIL + "=?";
			list.add(email);
		}
		if (phone != null || phone.isEmpty()) {
			data += ", " + USER_PHONE + "=?";
			list.add(phone);
		}
		if (password != null || password.isEmpty()) {
			data += ", PASSWORD='" + USER_PASSWORD + "=?";
			list.add(password);
		}
		if (Access.validAccess(access) && access != Access.ADMIN) {
			data += ", ACCESS=" + USER_ACCESS;
			list.add(access + "");
		}
		return RealismQuery.update("UPDATE " + USERS + " SET " + data + " WHERE " + USER_ID + "=" + account.getId(),
				(String[]) list.toArray());
	}
}
