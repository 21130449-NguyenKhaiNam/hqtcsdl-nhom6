package Model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AccountDao {
    /**
     * Lấy ra tài khoản nếu có tồn tại, chỉ trả về một danh sách tài khoản,
     * giả sử trường hợp có từ 2 tài khoản thì là đã thiết kế sai việc insert trong csdl,
     * không tài tại thì nghĩa là chưa có tài khoản
     */
    public static Account selectByEnP(Account user) throws SQLException {
        ResultSet result = RealismQuery.select(INameDB.USERS, null, "EMAIL=" + user.getEmail()
                + " AND PASSWORD=" + user.getPassword());
        Account ac = null;
        if (result.next()) {
            ac = new Account(result);
        }
        return ac;
    }

    /**
     * Thêm tài khoản vào db tuy nhiên không được thêm admin
     * kết quả trả về là số biểu thị hoàn thành hay không,
     * > 0 - hoàn thành,
     * = 0 - không hoàn thành (có thể thiếu dữ liệu)
     * = -1 - Có lỗi xảy ra
     */
    public static int insertUser(User user) throws SQLException {
        if (user.getAccess() == Access.ADMIN) {
            return -1;
        }
        return RealismQuery.insert(INameDB.USERS, null, new String[]{user.convertToSql()});
    }

    /**
     * Lấy danh sách tài khoản, tuy nhiên không lấy password và chỉ admin được phép gọi hàm
     */
    public static List<User> getUsers(Admin admin) throws SQLException {
        ResultSet result = RealismQuery.select(INameDB.USERS, null, null);
        Account ac = null;
        List<User> accounts = new ArrayList<>();
        while (result.next()) {
            User account = new User(result);
            if (account.getAccess() != Access.ADMIN) {
                account.setPassword("****");
                accounts.add(account);
            }
        }
        return accounts;
    }

    /**
     * Cập nhật thông tin của account
     */
    public static Account updateInfo(Account account, String name, String email,
                                     String phone, String password, int access) throws SQLException {
        String data = "";
        if (name != null || name.isEmpty())
            data += "NAME='" + name + '\'';
        if (email != null || email.isEmpty())
            data += ", EMAIL='" + email + '\'';
        if (phone != null || phone.isEmpty())
            data += ", PHONE='" + phone + '\'';
        if (password != null || password.isEmpty())
            data += ", PASSWORD='" + password + '\'';
        if (Access.validAccess(access) && access != Access.ADMIN)
            data += ", ACCESS=" + access;
        ResultSet result = RealismQuery.update("USERS", data, "ID=" + account.getId());
        if (result.next()) {
            account = new Account(result);
        }
        return account;
    }
}
