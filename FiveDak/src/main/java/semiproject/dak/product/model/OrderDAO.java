package semiproject.dak.product.model;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import semiproject.dak.security.AES256;
import semiproject.dak.security.SecretMyKey;

public class OrderDAO implements InterOrderDAO{
	private DataSource ds; // DataSource == Apache Tomcat이 제공하는 DBCP
	private PreparedStatement pstmt;
	private Connection conn;
	private ResultSet rs;
	private AES256 aes;
	
	public OrderDAO() {
		try {
			Context initContext = new InitialContext();
		    Context envContext  = (Context)initContext.lookup("java:/comp/env");
		    ds = (DataSource)envContext.lookup("jdbc/semi_oracle");
		    
		    aes = new AES256(SecretMyKey.KEY);
		} catch(NamingException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	} // end of public orderDAO
	
	private void close() {
		try {
			if(pstmt != null) {
				pstmt.close();
				pstmt = null;
			
			}
			if(rs != null) {
				rs.close();
				rs = null;
			}
			if(conn != null) {
				conn.close();
				conn = null;
			}
			
			
		} catch(SQLException e) {
			e.printStackTrace();
		}	
	}

	@Override
	public int getSumMonthOrder() throws SQLException {
		int n = 0 ; 
		try {
			conn = ds.getConnection();
			
			String sql = " select count(*)  "
					+ " from tbl_order "
					+ " WHERE to_char(order_date, 'yyyy-mm') = to_char(sysdate, 'yyyy-mm' )   " ;
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			rs.next();
			n = rs.getInt(1);
			
		}finally {
			close();
		}
		return n;
	}

	@Override
	public int getSumNotShipped() throws SQLException {
		int n = 0 ; 
		try {
			conn = ds.getConnection();
			
			String sql = " select count(*)  "
					+ " from tbl_order "
					+ " WHERE to_char(order_date, 'yyyy-mm') = to_char(sysdate, 'yyyy-mm' ) AND order_status = 7 " ;
			
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			rs.next();
			
			n = rs.getInt(1);
			
		}finally {
			close();
		}
		return n;
		
		
		
	}

	@Override
	public int getSumTotalSales() throws SQLException {
		int n = 0 ; 
		try {
			conn = ds.getConnection();
			
			String sql = " select sum(order_total_price)  "
					+ " from tbl_order "
					+ " WHERE to_char(order_date, 'yyyy-mm') = to_char(sysdate, 'yyyy-mm' )  " ;
			
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			rs.next();
			
			n = rs.getInt(1);
			
		}finally {
			close();
		}
		return n;
		}

	@Override
	public List<OrderDTO> showAllOrder(Map<String, String> paraMap) throws SQLException {
		List<OrderDTO> orderList = new ArrayList<>();
		try {
			conn = ds.getConnection();
			
			
			String sql = " SELECT RNO, ORDER_ID, ORDER_MEMBER_ID, ORDER_TOTAL_PRICE , SHIPPING_ADDRESS, TRACKING_NUMBER, RECIPIENT_MOBILE  "+
					"					, ORDER_STATUS , ORDER_DATE , status_name "+
					"					 FROM  "+
					"					 (  "+
					"					 select row_number() over (order by ORDER_DATE DESC) AS RNO   "+
					"					 , ORDER_ID, ORDER_MEMBER_ID, ORDER_TOTAL_PRICE , SHIPPING_ADDRESS, TRACKING_NUMBER, RECIPIENT_MOBILE   "+
					"					 , ORDER_STATUS , to_char( ORDER_DATE , 'yyyy-mm-dd') as order_date , S.status_name  "+
					"					 from tbl_order O  "+
					"                     JOIN order_status S "+
					"                     ON O.ORDER_STATUS = S.status_id "+
					"                    WHERE to_char(order_date, 'yyyy-mm') = to_char(sysdate, 'yyyy-mm' ) "+
					"					 )  "+
					"					 WHERE RNO BETWEEN ? AND ?  "+
					""; 
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, paraMap.get("start"));
			pstmt.setString(2, paraMap.get("end"));
			
			rs = pstmt.executeQuery();
			
			while( rs.next() ) {
				OrderDTO odto = new OrderDTO();
				odto.setFk_orderMbrId(rs.getString("ORDER_MEMBER_ID"));
				odto.setOrderId(rs.getInt("ORDER_ID")); 
				odto.setOrderTotalPrice(rs.getInt("ORDER_TOTAL_PRICE"));
				odto.setOrderAddress(rs.getString("SHIPPING_ADDRESS"));
				odto.setOrderTrackNo(rs.getString("TRACKING_NUMBER"));
				
				odto.setRecipMobile(rs.getString("RECIPIENT_MOBILE"));
				odto.setOrderStatus(rs.getInt("ORDER_STATUS"));
				odto.setOrderDate(rs.getString("ORDER_DATE"));
				odto.setOrderStatus_name(rs.getString("status_name"));
				orderList.add(odto);
			}
			/*
			 * }catch(GeneralSecurityException | UnsupportedEncodingException e ) {
			 * e.printStackTrace();
			 */
		}finally {
			close();
		}
		return orderList;
	}

	
	
	
	
} ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
