package semiproject.dak.product.model;

import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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

	// 관리자에게 모든 주문을 보여주는 메소드 
	@Override
	public List<OrderDTO> showAllOrder() {
		List<OrderDTO> orderList = new ArrayList<>();
		
		
		
		
		return orderList ;
	}
	
	
	
	
	
} ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
