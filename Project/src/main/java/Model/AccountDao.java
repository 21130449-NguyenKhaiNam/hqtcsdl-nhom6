package Model;

import java.lang.reflect.Field;
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
    public static List<Account> selectByEnP(Account user) throws SQLException {
        ResultSet result = RealismQuery.select(INameDB.USERS, null, "EMAIL=" + user.getEmail()
                + " AND PASSWORD=" + user.getPassword());
        Account ac = null;
        List<Account> accounts = new ArrayList<>();
        while (result.next()) {
            accounts.add(new Account(result));
        }
        return accounts;
    }

    /**
     * Thêm tài khoản vào db tuy nhiên không được thêm admin
     * kết quả trả về là số biểu thị hoàn thành hay không,
     * > 0 - hoàn thành,
     * = 0 - không hoàn thành (có thể thiếu dữ liệu)
     * = -1 - Có lỗi xảy ra
     */
    public static int insertUser(User user) throws SQLException {
        if(user.getAccess() == Access.ADMIN) {
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
            if(account.getAccess() != Access.ADMIN) {
                account.setPassword("****");
                accounts.add(account);
            }
        }
        return accounts;
    }

    /**
     *
     */
    public static boolean updateInfo(Account account) {
        return false;
    }
}
