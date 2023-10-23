package model.database;

import java.util.ArrayList;

/**
 * Lớp nào muốn lấy dữ liệu dưới db thì phải implement interface này và tự thực
 * hiện các phương thức
 * 
 * @param <E>
 */
public interface IDAO<E> {
	int insert(E e);

	int update(E e);

	int delete(E e);

	ArrayList<E> select(String condition);
}
