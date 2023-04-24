package semiproject.dak.product.model;

import java.io.UnsupportedEncodingException;
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

public class ProductDAO implements InterProductDAO {
	private DataSource ds; // DataSource == Apache Tomcat이 제공하는 DBCP
	private PreparedStatement pstmt;
	private Connection conn;
	private ResultSet rs;
	private AES256 aes;
	
	public ProductDAO() {
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
	}// end of public productDAO
	
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
	}// end of private void close 

	// 총 페이지를 알아와서 돌려주는 메소드 
	@Override
	public int getTotalPage(Map<String, String> paraMap) throws SQLException{
		int totalPage = 0 ;
		try {
			conn = ds.getConnection();
			
			String sql = " SELECT ceil(count(*)/?) "+
					"        from tbl_product "+
					"        where PRODUCT_NAME like '%'|| ? || '%' " ;
			
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, paraMap.get("sizePerPage") );
			pstmt.setString(2, paraMap.get("searchWord"));	
			rs = pstmt.executeQuery();
			
			rs.next();
			totalPage = rs.getInt(1);
			
		}finally {
			close();
		}
		
		return totalPage ;
	}

	// 검색을 하였을 때 검색리스트를 가져오는 메소드 
	@Override
	public List<ProductDTO> selectPagingProduct(Map<String, String> paraMap)  throws SQLException {
		List<ProductDTO> prodList = new ArrayList<>();
		try {
			conn = ds.getConnection();
			String sql = "";
			if ( "asc".equalsIgnoreCase(paraMap.get("orderWay"))) {
				
		
				sql = " SELECT RNO, PRODUCT_ID, PRODUCT_NAME, PRODUCT_CATEGORY_ID , PRODUCT_PRICE, PRODUCT_SALES, AVERAGE_RATING, PRODUCT_IMAGE_URL , CATEGORY_NAME "+
						" FROM "+
						" (\n"+
						" select row_number() over (order by PRODUCT_ID desc ) AS RNO  "+
						" , PRODUCT_ID, PRODUCT_NAME, PRODUCT_PRICE , PRODUCT_SALES, AVERAGE_RATING, PRODUCT_IMAGE_URL , PRODUCT_CATEGORY_ID , C.CATEGORY_NAME "+
						" from tbl_product P "+
						" JOIN tbl_category C  "+
						" ON P.PRODUCT_CATEGORY_ID = C.CATEGORY_ID "+
						" WHERE P.PRODUCT_NAME like '%' || ? || '%' "+
						" )V "+
						" WHERE RNO BETWEEN ? AND ?  "+
						" ORDER BY ? asc ";
				}
			
			else {
				sql = " SELECT RNO, PRODUCT_ID, PRODUCT_NAME, PRODUCT_CATEGORY_ID , PRODUCT_PRICE, PRODUCT_SALES, AVERAGE_RATING, PRODUCT_IMAGE_URL , CATEGORY_NAME "+
						" FROM "+
						" (\n"+
						" select row_number() over (order by PRODUCT_ID desc ) AS RNO  "+
						" , PRODUCT_ID, PRODUCT_NAME, PRODUCT_PRICE , PRODUCT_SALES, AVERAGE_RATING, PRODUCT_IMAGE_URL , PRODUCT_CATEGORY_ID , C.CATEGORY_NAME "+
						" from tbl_product P "+
						" JOIN tbl_category C  "+
						" ON P.PRODUCT_CATEGORY_ID = C.CATEGORY_ID "+
						" WHERE P.PRODUCT_NAME like '%' || ? || '%' "+
						" )V "+
						" WHERE RNO BETWEEN ? AND ?  "+
						" ORDER BY ? desc ";
			}
			
			pstmt = conn.prepareStatement(sql);
			int sizePerPage = Integer.parseInt(paraMap.get("sizePerPage"));
			int currentShowPageNo = Integer.parseInt(paraMap.get("currentShowPageNo"));

			pstmt.setString(1, paraMap.get("searchWord"));
			pstmt.setInt(2, (sizePerPage*currentShowPageNo)-(sizePerPage-1));
			pstmt.setInt(3, sizePerPage*currentShowPageNo);
			pstmt.setString(4, paraMap.get("orderBy"));
			
			rs = pstmt.executeQuery();
			
			while ( rs.next()) {
				ProductDTO pdto = new ProductDTO();
				pdto.setProdNum(rs.getInt("PRODUCT_ID"));
				pdto.setProdName(rs.getString("PRODUCT_NAME"));
				pdto.setFk_prodCateNum(rs.getInt("PRODUCT_CATEGORY_ID"));
				pdto.setProdPrice(rs.getInt("PRODUCT_PRICE"));
				pdto.setProdDiscount(rs.getInt("PRODUCT_SALES"));
				pdto.setProdAvgRating(rs.getInt("AVERAGE_RATING"));
				pdto.setProdImage1(rs.getString("PRODUCT_IMAGE_URL"));
				
				CategoryDTO cdto = new CategoryDTO();
				cdto.setCateName(rs.getString("CATEGORY_NAME"));
				pdto.setCateDTO(cdto);
				
				prodList.add(pdto);
				
			}// END OF WHILE( RS.NEXT()) {
			
			
			
		}finally {
			close();
		}
		
		return prodList;
	}
	
}
