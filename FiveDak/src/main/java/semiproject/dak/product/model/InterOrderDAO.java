package semiproject.dak.product.model;

import java.util.List;

public interface InterOrderDAO {
	
	// 관리자에게 모든 주문 사항을 보여주는 메소드 
	List<OrderDTO> showAllOrder();

}
