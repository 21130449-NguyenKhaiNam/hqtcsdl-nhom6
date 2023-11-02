package Model;

import database.ConnectDatabase;

import java.awt.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class RealismQuery {
    /**
     * Tự động sinh ra câu lệnh sql mã hóa,
     * kết quả trả về là một kết quả table sql
     */
    public static ResultSet select(String nameDBs, String[] fields, String conditions) throws SQLException {
        if(nameDBs == null || nameDBs.isEmpty()) {
            System.out.println("[RealismQuery-select] >> Câu lệnh select có vấn đề");
            return null;
        }

        nameDBs = nameDBs.trim();

        // Lấy ra các trường không có mặc định là toàn bộ
        String filed = ((fields == null || fields.length == 0) ? "*" :
                Arrays.toString(fields).replaceAll("[\\[\\]]", ""));

        EncryptQuery encryptQuery = encryptConditions(conditions);
        String condition = encryptQuery.getCondition();
        List<String> listConditons = encryptQuery.getListConditions();

        String sql = "SELECT " + filed + " FROM " + nameDBs + " " + condition;

        // Tiến hành truy vấn
        Connection connection = ConnectDatabase.C;
        PreparedStatement query = connection.prepareStatement(sql);
        if(listConditons != null)
            for (int i = 0; i < listConditons.size(); i++)
                query.setString(i + 1, listConditons.get(i));
        ConnectDatabase.closeConnection(connection);
        return query.executeQuery();
    }

    /**
     * Câu lệnh select này cho phép tự viết query theo ý,
     * nhưng sẽ không có mã hóa do đó cần cẩn thận trong quá trình gọi
     * @param sql
     * @return
     * @throws SQLException
     */
    public static ResultSet select(String sql) throws SQLException {
        Connection connection = ConnectDatabase.C;
        Statement query = connection.createStatement();
        boolean check = query.execute(sql);
        if(check) {
            System.out.println("[RealismQuery-select: sql] >> Có lỗi xảy ra trong tự viết select");
        }
        ConnectDatabase.closeConnection(connection);
        return query.getResultSet();
    }

    /**
     * Hàm insert này sẽ mã hóa dữ liệu đưa vào db tránh tình trạng bị đưa vào mã độc
     */
    public static void insert(String nameDBs, String[] fields, String... values) {

    }

    /**
     * Mã hóa câu lệnh sql
     * @param conditions
     * @return
     */
    private static EncryptQuery encryptConditions(String conditions) {
        String condition = "";
        List<String> listCondition = null;
        // Nếu tồn tại điều kiện
        if(!(conditions == null || conditions.isEmpty())) {
            listCondition = new ArrayList<>();
            condition = conditions;
            int iEqual = conditions.indexOf("=");
            int iSpace = -1;
            while ((iSpace = conditions.indexOf(" ", iEqual)) != -1) {
                String sub = conditions.substring(iEqual + 1, iSpace);
                condition = condition.replace(sub, "?");
                listCondition.add(sub.replaceAll("'", ""));
                iEqual = conditions.indexOf("=", iSpace);
            }
            iEqual = conditions.indexOf("=", iEqual);
            String sub = conditions.substring(iEqual + 1);
            condition = condition.replace(sub, "?");
            listCondition.add(sub.replaceAll("'", ""));
            condition = "WHERE " + condition;
        }
        return new EncryptQuery(condition, listCondition);
    }
}
