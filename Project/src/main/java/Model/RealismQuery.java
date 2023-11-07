package Model;

import database.ConnectDatabase;

import java.sql.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * Conditions có dạng: EX - "NAME='A' AND FIRST='B' OR LAST='C'"
 * Fields có dạng: EX - {"a", "b", "c"}
 * Data có dạng: EX - "NAME='A', FIRST='B'"
 */
public class RealismQuery {
    /**
     * Tự động sinh ra câu lệnh sql mã hóa,
     * kết quả trả về là một kết quả table sql
     */
    public static ResultSet select(String nameDBs, String[] fields, String conditions) throws SQLException {
        if (nameDBs == null || nameDBs.isEmpty()) {
            System.out.println("[RealismQuery-select] >> Câu lệnh select có vấn đề");
            return null;
        }

        nameDBs = nameDBs.trim();

        // Lấy ra các trường không có mặc định là toàn bộ
        String field = convertField(fields);

        EncryptQuery encryptQuery = encryptConditions(conditions);
        String condition = encryptQuery.getQuery();
        List<String> listConditons = encryptQuery.getListConditions();

        String sql = "SELECT " + field + " FROM " + nameDBs + " " + condition;

        // Tiến hành truy vấn
        return exec(sql, listConditons);
    }

    /**
     * Câu lệnh select này cho phép tự viết query theo ý,
     * nhưng sẽ không có mã hóa do đó cần cẩn thận trong quá trình gọi
     */
    public static ResultSet select(String sql) throws SQLException {
        Connection connection = ConnectDatabase.C;
        Statement query = connection.createStatement();
        System.out.println(sql);
        boolean check = query.execute(sql);
        if (check) {
            System.out.println("[RealismQuery-select: sql] >> Có lỗi xảy ra trong tự viết select");
        }
        return query.getResultSet();
    }

    /**
     * Hàm insert này sẽ mã hóa dữ liệu đưa vào db tránh tình trạng bị đưa vào mã độc.
     * Trả về số dòng insert thành công, ngoại lệ:
     * -1 - Lỗi câu lệnh
     */
    public static int insert(String nameDBs, String[] fields, String[] values) throws SQLException {
        if (nameDBs == null || nameDBs.isEmpty()) {
            System.out.println("[RealismQuery-insert] >> Câu lệnh insert có vấn đề");
            return -1;
        }

        nameDBs = nameDBs.trim();

        String field = convertField(fields);
        field = field.equals("*") ? "" : ("(" + field + ")");

        EncryptQuery encryptQuery = encryptValues(values);
        String value = encryptQuery.getQuery();
        List<String> listValues = encryptQuery.getListConditions();

        String sql = "INSERT INTO " + nameDBs + field + " VALUES " + value;

        return execUpdate(sql, listValues);
    }

    /**
     * Cập nhật dữ liệu
     */
    public static ResultSet update(String nameDBs, String data, String conditions) throws SQLException {
       return null;
    }

    /**
     * Mã hóa dữ liệu insert
     */
    private static EncryptQuery encryptValues(String[] values) {
        if (values == null || values.length == 0) {
            System.out.println("[RealismQuery-encryptValues] >> Lỗi giá trị nhận vào");
            return null;
        }
        StringBuilder value = new StringBuilder();
        List<String> listValues = new ArrayList<>();

        for (String v : values) {
            String[] vs = v.replaceAll("[()]", "").trim().split(",");
            for (String vsi : vs) {
                v = v.replace(vsi, "?");
                vsi = vsi.replaceAll("'", "");
                listValues.add(vsi);
            }
            value.append(v).append(", ");
        }
        value.deleteCharAt(value.lastIndexOf(","));

        return new EncryptQuery(value.toString(), listValues);
    }

    /**
     * Mã hóa câu lệnh điều kiện sql
     */
    private static EncryptQuery encryptConditions(String conditions) {
        String condition = "";
        List<String> listCondition = null;
        // Nếu tồn tại điều kiện
        if (!(conditions == null || conditions.isEmpty())) {
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

    /**
     * Chuyển mảng các trường thành một truy xuất trong sql,
     * nếu không có trường thì mặc định là toàn bộ
     */
    private static String convertField(String[] fields) {
        return ((fields == null || fields.length == 0) ? "*" :
                Arrays.toString(fields).replaceAll("[\\[\\]]", ""));
    }

    /**
     * Thực thi câu lệnh được mã hóa, kết quả trả về các cột trong trường
     */
    private static ResultSet exec(String sql, List<String> list) throws SQLException {
        Connection connection = ConnectDatabase.C;
        PreparedStatement query = connection.prepareStatement(sql);
        if (list != null)
            for (int i = 0; i < list.size(); i++)
                query.setString(i + 1, list.get(i));
        return query.executeQuery();
    }

    /**
     * Thực thi các câu lệnh insert, update, delete kết quả trả về số dòng thực thi thành công
     */
    private static int execUpdate(String sql, List<String> list) throws SQLException {
        Connection connection = ConnectDatabase.C;
        PreparedStatement query = connection.prepareStatement(sql);
        if (list != null)
            for (int i = 0; i < list.size(); i++)
                query.setString(i + 1, list.get(i));
        return query.executeUpdate();
    }
}
