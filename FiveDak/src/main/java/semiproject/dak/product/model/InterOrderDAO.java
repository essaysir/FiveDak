package semiproject.dak.product.model;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public interface InterOrderDAO {
	

	// 한달간 전체 주문 상품 수 알아오기 
	int getSumMonthOrder() throws SQLException ;

	// 한달간 미배송중인 주문 상품수 알아오기 
	int getSumNotShipped()  throws SQLException ;

	// 한달간 현재 누적 판매액 
	int getSumTotalSales()  throws SQLException ;

	// 최근 것부터 주문 내역 하나씩 보여주기 
	List<OrderDTO> showAllOrder(Map<String, String> paraMap) throws SQLException;

	// 
	int getTotalNo(Map<String,String> paraMap) throws SQLException ;

	// 주문 상세 정보에 띄울 정보들 DB에서 가져오기 
	OrderDTO getOrderInfo(String orderid)  throws SQLException ;

	// 주문 상세 정보에 주문한 제품 정보와 이미지 가져오기
	ArrayList<Map<String, Object>> getOrderProdAndImage(String order_serial)   throws SQLException  ;

}
