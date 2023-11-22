package Model;

import database.ConnectDatabase;

import java.sql.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.List;

/**
 * Thực thi câu lệnh query
 */
public class RealismQuery {

	/**
	 * Câu lệnh select này cho phép tự viết query theo ý, nhưng sẽ không có mã hóa
	 * do đó cần cẩn thận trong quá trình gọi
	 */
	@SuppressWarnings("unchecked")
	public static <T> List<T> select(IRowMapper<T> mapper,String sql, String... datas) throws SQLException {
		Connection connection = ConnectDatabase.C;
		PreparedStatement query = connection.prepareStatement(sql);
		if (datas != null) {
			for (int i = 0; i < datas.length; i++) {
				query.setString(i + 1, datas[i]);
			}
		}
		boolean check = query.execute();
		if (check) {
			List<T> list = new ArrayList<T>();
			ResultSet result = query.getResultSet();
			while (result.next()) {
				list.add(mapper.mapper(result));
			}
			return list;
		} else {
			System.out.println("[RealismQuery-select: sql] >> Có lỗi xảy ra trong tự viết select");
			return null;
		}

	}

	/**
	 * Hàm insert này sẽ mã hóa dữ liệu đưa vào db tránh tình trạng bị đưa vào mã
	 * độc. Trả về số dòng insert thành công, ngoại lệ: -1 - Lỗi câu lệnh
	 */
	public static int insert(String sql, String... datas) throws SQLException {
		Connection connection = ConnectDatabase.C;
		PreparedStatement query = connection.prepareStatement(sql);
		if (datas != null) {
			for (int i = 0; i < datas.length; i++) {
				query.setString(i + 1, datas[i]);
			}
		}
		return query.executeUpdate();
	}

	/**
	 * Cập nhật dữ liệu
	 */
	public static int update(String sql, String... datas) throws SQLException {
		Connection connection = ConnectDatabase.C;
		PreparedStatement query = connection.prepareStatement(sql);
		if (datas != null) {
			for (int i = 0; i < datas.length; i++) {
				query.setString(i + 1, datas[i]);
			}
		}
		return query.executeUpdate();
	}

}
