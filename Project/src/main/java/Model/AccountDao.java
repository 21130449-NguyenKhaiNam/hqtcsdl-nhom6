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
    public static List<Account> selectByEnP(Account user) throws SQLException {
        ResultSet result = RealismQuery.select(INameDB.USERS, null, "EMAIL=" + user.getEmail()
                + " AND PASSWORD=" + user.getPassword());
        Account ac = null;
        List<Account> accounts = new ArrayList<>();
       while(result.next()) {
           accounts.add(new Account(result));
       }
        return accounts;
    }

    /**
     * Thêm tài khoản vào db tuy nhiên không được thêm admin
     * kết quả trả về là số biểu thị hoàn thành hay không,
     * true - hoàn thành,
     * false - không hoàn (có thể thiếu dữ liệu)
     */
    public static boolean insertUser(User user) {
        return false;
    }
}
