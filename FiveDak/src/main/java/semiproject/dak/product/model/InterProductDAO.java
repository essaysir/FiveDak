package semiproject.dak.product.model;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface InterProductDAO {
	
	// 총 페이지를 알아오는 메소드 
	int getTotalPage(Map<String, String> paraMap)  throws SQLException;

	// 검색을 하였을 때 검색리스트를 가져오는 메소드 
	List<ProductDAO> selectPagingProduct(Map<String, String> paraMap)  throws SQLException;

}
