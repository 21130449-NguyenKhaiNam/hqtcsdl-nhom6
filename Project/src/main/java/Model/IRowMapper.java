package Model;

import java.sql.ResultSet;

public interface IRowMapper<T> {
	T mapper(ResultSet resultSet);
}
