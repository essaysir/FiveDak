package semiproject.dak.product.model;

import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import semiproject.dak.product.model.ProductDAO;
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

	
	//////////////////////////////////////////////////////////////////////
	// 로그인 유무를 검사해서 로그인을 했으면 true를 리턴해주고, 로그인 안 했으면 false를 리턴해주도록 한다.
	
	public boolean checkLogin(HttpServletRequest request) { 
	
	HttpSession session = request.getSession();
	ProductDAO loginuser = (ProductDAO)session.getAttribute("loginuser");
	
	if(loginuser != null) {
	//로그인 한 경우
	return true;
	}
	else {
	//로그인 안 한 경우
	return false;
	}
	
	}//end of public boolean checkLogin(HttpServletRequest request)------------------------

	
	
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
				sql = " SELECT RNO, PRODUCT_ID, PRODUCT_NAME, PRODUCT_CATEGORY_ID , PRODUCT_PRICE, PRODUCT_DISCOUNT "+
						  " , AVERAGE_RATING, PRODUCT_IMAGE_URL , CATEGORY_NAME , BRAND_NAME "+
							" FROM "+
							" ( "+
							" select row_number() over (order by "+ paraMap.get("orderBy")+"  "+paraMap.get("orderWay") +" ) AS RNO  "+
							" , PRODUCT_ID, PRODUCT_NAME, PRODUCT_PRICE , PRODUCT_DISCOUNT, AVERAGE_RATING, PRODUCT_IMAGE_URL  "+
							" , PRODUCT_CATEGORY_ID , C.CATEGORY_NAME , B.BRAND_NAME  "+
							" from tbl_product P "+
							" JOIN tbl_category C  "+
							" ON P.PRODUCT_CATEGORY_ID = C.CATEGORY_ID "+
							" JOIN tbl_brand B  "+
							" ON P.PRODUCT_BRAND_ID = B.brand_id "+
							" WHERE P.PRODUCT_NAME like '%' || ? || '%' "+
							" )V "+
							" WHERE RNO BETWEEN ?  AND ?  "
							+  "ORDER BY RNO ASC ";
				
			

			
			pstmt = conn.prepareStatement(sql);
			int sizePerPage = Integer.parseInt(paraMap.get("sizePerPage"));
			int currentShowPageNo = Integer.parseInt(paraMap.get("currentShowPageNo"));
			
			// pstmt.setString(1, paraMap.get("orderBy"));
			pstmt.setString(1, paraMap.get("searchWord"));
			pstmt.setInt(2, (sizePerPage*currentShowPageNo)-(sizePerPage-1));
			pstmt.setInt(3, sizePerPage*currentShowPageNo);
			
			rs = pstmt.executeQuery();
			
			while ( rs.next()) {
				ProductDTO pdto = new ProductDTO();
				pdto.setProdNum(rs.getInt("PRODUCT_ID"));
				pdto.setProdName(rs.getString("PRODUCT_NAME"));
				pdto.setFk_prodCateNum(rs.getInt("PRODUCT_CATEGORY_ID"));
				pdto.setProdPrice(rs.getInt("PRODUCT_PRICE"));
				pdto.setProdDiscount(rs.getInt("PRODUCT_DISCOUNT"));
				pdto.setProdAvgRating(rs.getDouble("AVERAGE_RATING"));
				pdto.setProdImage1(rs.getString("PRODUCT_IMAGE_URL"));
				
				CategoryDTO cdto = new CategoryDTO();
				cdto.setCateName(rs.getString("CATEGORY_NAME"));
				pdto.setCateDTO(cdto);
				
				BrandDTO bdto = new BrandDTO();
				bdto.setBrandName(rs.getString("BRAND_NAME"));
				pdto.setBrandDTO(bdto);
				
				prodList.add(pdto);
				
			}// END OF WHILE( RS.NEXT()) {
			
			
			
		}finally {
			close();
		}
		
		return prodList;
	} // END OF PUBLIC LIST<PRODUCTDTO> SELECTPAGINGPRODUCT(MAP<STRING, STRING> PARAMAP)  THROWS SQLEXCEPTION {

	// 검색을 하였을 때 검색에 해당하는 총 제품 갯수 알아오기  
	@Override
	public int getTotalProduct(Map<String, String> paraMap)   throws SQLException {
		int totalProduct = 0 ;
		try {
			conn = ds.getConnection();
			String sql = " SELECT COUNT(*) "
					   + " FROM TBL_PRODUCT "
					   + " WHERE PRODUCT_NAME like '%' || ? || '%'  ";
				
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, paraMap.get("searchWord"));

			rs = pstmt.executeQuery();
			
			rs.next();
			totalProduct = rs.getInt(1);
			
		}finally {
			close();
		}
		return totalProduct;
	}
	
	
	
	// Ajax(JSON)를 이용한 더보기 방식(페이징처리)으로 상품정보를 20개씩 잘라서(start ~ end) 조회해오기
	@Override
	public List<ProductDTO> selectByRank(Map<String, String> paraMap) throws SQLException {
		
		List<ProductDTO> prodList = new ArrayList<>();
		
		try {
			conn = ds.getConnection();
			
			 String sql = " select RNO, PRODUCT_ID, PRODUCT_NAME, PRODUCT_CATEGORY_ID , PRODUCT_PRICE, PRODUCT_SALES "
			 			+ "		 , AVERAGE_RATING, PRODUCT_IMAGE_URL , CATEGORY_NAME , BRAND_NAME , PRODUCT_DISCOUNT "
				 		+ " from "
				 		+ " ( "
				 		+ "     select row_number() over (order by "+paraMap.get("listType")+" DESC) AS RNO  "
				 		+ "          , PRODUCT_ID, PRODUCT_NAME, PRODUCT_PRICE , PRODUCT_SALES, AVERAGE_RATING, PRODUCT_IMAGE_URL "
				 		+ "			 , PRODUCT_CATEGORY_ID , C.CATEGORY_NAME , B.BRAND_NAME , PRODUCT_DISCOUNT"
				 		+ "    FROM tbl_product P "
				 		+ "    JOIN tbl_category C "
				 		+ "    ON P.product_category_id = C.category_id "
				 		+ "    JOIN tbl_brand B "
				 		+ "	   ON P.product_brand_id = B.brand_id"
				 		+ " ) V "
				 		+ " where RNO between ? and ? ";
			 
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, paraMap.get("start"));
			pstmt.setString(2, paraMap.get("end"));
			
			
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				ProductDTO pvo = new ProductDTO();
				pvo.setProdRno(rs.getInt("RNO"));
				pvo.setProdNum(rs.getInt("PRODUCT_ID"));	
				pvo.setProdName(rs.getString("PRODUCT_NAME"));

				CategoryDTO categdto = new CategoryDTO();	
				categdto.setCateId(rs.getInt("PRODUCT_CATEGORY_ID")); 	
				categdto.setCateName(rs.getString("CATEGORY_NAME"));
				pvo.setCateDTO(categdto);				
				BrandDTO bdto = new BrandDTO();
				bdto.setBrandName(rs.getString("BRAND_NAME"));
				pvo.setBrandDTO(bdto);
				
	            pvo.setProdPrice(rs.getInt("PRODUCT_PRICE"));   		
	            pvo.setProdSales(rs.getInt("PRODUCT_SALES"));         
	            pvo.setProdDiscount(rs.getInt("PRODUCT_DISCOUNT"));        		
	            pvo.setProdAvgRating(rs.getDouble("AVERAGE_RATING"));	  		
	            pvo.setProdImage1(rs.getString("PRODUCT_IMAGE_URL"));
	            
	            
	            prodList.add(pvo);
			}// end of while ------------
			
		} finally {
			close();
		}
		
		return prodList;
	}
	
	
	// Ajax(JSON)를 사용하여 상품목록을 "더보기" 방식으로 페이징 처리 해주기위해 전체개수 알아오기 
	@Override
	public int totalCount() {
		
		int totalHITCount = 0;
		
		try {
			conn = ds.getConnection();
			
			 String sql = " select count(*) "
				 		+ " from "
				 		+ " ( "
				 		+ "     select row_number() over (order by AVERAGE_RATING DESC) AS RNO  "
				 		+ "          , PRODUCT_ID, PRODUCT_NAME, PRODUCT_PRICE , PRODUCT_SALES, AVERAGE_RATING, PRODUCT_IMAGE_URL "
				 		+ "			 , PRODUCT_CATEGORY_ID , C.CATEGORY_NAME , B.BRAND_NAME , PRODUCT_DISCOUNT"
				 		+ "    FROM tbl_product P "
				 		+ "    JOIN tbl_category C "
				 		+ "    ON P.product_category_id = C.category_id "
				 		+ "    JOIN tbl_brand B "
				 		+ "	   ON P.product_brand_id = B.brand_id"
				 		+ " ) V "
				 		+ " where RNO between 1 and 100 ";
			 
			pstmt = conn.prepareStatement(sql);
			
			
			
			rs = pstmt.executeQuery();
			
			rs.next();
			
			totalHITCount = rs.getInt(1);
		
		}
		 catch(SQLException e) {
			e.printStackTrace();
		}		
		 finally {
			close();
		}
		
		return totalHITCount;
	}
	
	
	

	@Override
	public List<CartDTO> getCartList(String userid) throws SQLException {
		List<CartDTO> cartlist = new ArrayList<>();
		
		try {
			conn = ds.getConnection();
			String sql = " SELECT CART_ID, CART_PRODUCT_ID, CART_QUANTITY, PRODUCT_NAME, BRAND_NAME, PRODUCT_PRICE, PRODUCT_STOCK, PRODUCT_DISCOUNT, PRODUCT_IMAGE_URL "
					+ " FROM TBL_CART C JOIN TBL_PRODUCT P ON C.CART_PRODUCT_ID = P.PRODUCT_ID"
					+ " JOIN TBL_BRAND B ON P.PRODUCT_BRAND_ID = B.BRAND_ID"
					+ " WHERE CART_MEMBER_ID = ? ";
				
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				CartDTO cart = new CartDTO();
				cart.setCart_id(rs.getInt("CART_ID"));
				cart.setCart_product_id(rs.getInt("CART_PRODUCT_ID"));
				cart.setCart_quantity(rs.getInt("CART_QUANTITY"));
				
				ProductDTO prod = new ProductDTO();
				prod.setProdName(rs.getString("PRODUCT_NAME"));
				
				BrandDTO brand = new BrandDTO();
				brand.setBrandName(rs.getString("BRAND_NAME"));
				prod.setBrandDTO(brand);
				
				prod.setProdPrice(rs.getInt("PRODUCT_PRICE"));
				prod.setProdStock(rs.getInt("PRODUCT_STOCK"));
				prod.setProdDiscount(rs.getInt("PRODUCT_DISCOUNT"));
				prod.setProdImage1(rs.getString("PRODUCT_IMAGE_URL"));
				cart.setProd(prod);
				
				cartlist.add(cart);
			}
		}finally {
			close();
		}
		return cartlist;
	}

	
	
	
	@Override
	public int updateProductQty(Map<String, String> paraMap) throws SQLException {
		int n = 0; 
		
		try {
			conn = ds.getConnection();
			String sql = " UPDATE TBL_CART SET CART_QUANTITY = ? WHERE CART_ID = ? ";
				
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, Integer.parseInt(paraMap.get("nqty")));
			pstmt.setInt(2, Integer.parseInt(paraMap.get("cartid")));
			
			n = pstmt.executeUpdate();
			
			
		}finally {
			close();
		}
		return n;
	}

	
	@Override
	public int deleteUserCart(int[] cartIds) throws SQLException {
		int n = 0;

		try {
			conn = ds.getConnection();
			conn.setAutoCommit(false);
			
			String sql = "DELETE FROM TBL_CART WHERE CART_ID IN (" + String.join(",", Collections.nCopies(cartIds.length, "?")) + ")";
			pstmt = conn.prepareStatement(sql);
			
			for (int i = 0; i < cartIds.length; i++) {
		        pstmt.setInt(i + 1, cartIds[i]);
		    }

			
			n = pstmt.executeUpdate();
			if(n == cartIds.length) {
				conn.commit();
			} else {
				conn.rollback();
				n = 0;
			}
			
			
		}finally {
			conn.setAutoCommit(true);
			close();
			
			
		}
		return n;
		
		
	}

	public String generateOrderSerial() throws SQLException {
	    
	    String orderNo = null;
	    
	    try {
	    
	      conn = ds.getConnection();
	      
	    
	      pstmt = conn.prepareStatement("SELECT seq_order.NEXTVAL FROM DUAL");
	      rs = pstmt.executeQuery();
	      
	      
	      if (rs.next()) {
	        int seqNo = rs.getInt(1);
	        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
	        String currentDate = sdf.format(new Date());
	        orderNo = "RK" +currentDate + "-" + String.format("%06d", seqNo);
	      }
	      
	    } finally {
	      close();
	    }
	    
	    return orderNo;
	  }

	@Override
	public CheckoutDTO getCheckOutData(int[] cartIds) throws SQLException {
		List<CartDTO> cartlist = new ArrayList<>();
	    int totalPrice = 0, totalDiscount = 0, shippingCost = 0, pointsEarned = 0, totalAmount= 0;
	    CheckoutDTO checkout = null;
	    try {
			conn = ds.getConnection();
			
			String sql = "SELECT CART_ID, CART_PRODUCT_ID, CART_QUANTITY, PRODUCT_NAME, BRAND_NAME, PRODUCT_PRICE, PRODUCT_STOCK, PRODUCT_DISCOUNT, PRODUCT_IMAGE_URL "
					+ "FROM tbl_cart c JOIN tbl_product p ON c.cart_product_id = p.product_id "
					+ "JOIN tbl_brand b ON p.product_brand_id = b.brand_id "
					+ "WHERE CART_ID IN (" + String.join(",", Collections.nCopies(cartIds.length, "?")) + ")";

			pstmt = conn.prepareStatement(sql);
			
			for (int i = 0; i < cartIds.length; i++) {
			    pstmt.setInt(i + 1, cartIds[i]);
			    
			}
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				CartDTO cart = new CartDTO();
				cart.setCart_id(rs.getInt("CART_ID"));
				cart.setCart_product_id(rs.getInt("CART_PRODUCT_ID"));
				cart.setCart_quantity(rs.getInt("CART_QUANTITY"));
				
				ProductDTO prod = new ProductDTO();
				prod.setProdName(rs.getString("PRODUCT_NAME"));
				
				BrandDTO brand = new BrandDTO();
				brand.setBrandName(rs.getString("BRAND_NAME"));
				prod.setBrandDTO(brand);
				
				prod.setProdPrice(rs.getInt("PRODUCT_PRICE"));
				prod.setProdStock(rs.getInt("PRODUCT_STOCK"));
				prod.setProdDiscount(rs.getInt("PRODUCT_DISCOUNT"));
				prod.setProdImage1(rs.getString("PRODUCT_IMAGE_URL"));
				cart.setProd(prod);
				
				totalPrice += cart.getTotalProductPrice();
				totalDiscount += cart.getTotalDiscount();
				totalAmount += cart.getTotalAmount();
				
				cartlist.add(cart);
			}
			if(totalAmount > 30000) {
				shippingCost += 3000;
			}
			
			checkout = new CheckoutDTO(cartlist, totalPrice, totalDiscount, shippingCost, pointsEarned, totalAmount);
			
			
		}finally {
			close();
		}
		return checkout;
	}
	

	// 제품정보를 알아오는 메소드
	public ProductDTO prodInfo(int product_id, int review_product_id) throws SQLException {
		Connection conn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		ProductDTO pdto = new ProductDTO();
	
		try {
			
			conn = ds.getConnection(); 
			
			
			String sql=" select product_id, product_name, brand_name, product_price, product_stock, product_sales, product_discount, average_rating, product_image_url, review_count "
					 + " from (select product_id, product_name,brand_name, product_price, product_stock, product_sales, product_discount, average_rating, product_image_url "
					 + " from tbl_product P join tbl_brand B on P.product_brand_id = B.brand_id where product_id = ? ) A CROSS JOIN "
					 + " (select count(*) as review_count from tbl_review where review_product_id = ? group by review_product_id) C ";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, product_id);
			ps.setInt(2, review_product_id);
			
			rs=ps.executeQuery();
			
			
			if(rs.next()) {
				
				pdto = new ProductDTO();
				pdto.setProdNum(rs.getInt("PRODUCT_ID"));
				pdto.setProdName(rs.getString("PRODUCT_NAME"));
				pdto.setProdPrice(rs.getInt("PRODUCT_PRICE"));
				pdto.setProdStock(rs.getInt("PRODUCT_STOCK"));
				pdto.setProdSales(rs.getInt("PRODUCT_SALES"));
				pdto.setProdDiscount(rs.getInt("PRODUCT_DISCOUNT"));
				pdto.setProdAvgRating(rs.getDouble("AVERAGE_RATING"));
				pdto.setProdImage1(rs.getString("PRODUCT_IMAGE_URL"));
				
				ReviewDTO rdto = new ReviewDTO();
				rdto.setReview_cnt(rs.getInt("REVIEW_COUNT"));
				pdto.setreviewDTO(rdto);
				
				BrandDTO bdto = new BrandDTO();
				bdto.setBrandName(rs.getString("BRAND_NAME"));
				pdto.setBrandDTO(bdto);
			
				
			}
		//	System.out.println("제발 나와주세요"+pdto);
			
			return pdto;
		}finally {
			close();
		}
	}//제품정보를 알아오는 메소드
	
	
	
	//제품의 영양정보를 알아오는 메소드
		public NutritionDTO nutritionInfo(String nutrition_id) throws SQLException {
			Connection conn=null;
			PreparedStatement ps=null;
			ResultSet rs=null;
			
			NutritionDTO ndto = new NutritionDTO();
		
			try {
				
				conn = ds.getConnection(); 
				
				
				String sql=" select nutrition_id,product_cal, product_protein, product_sodium, product_kal, product_fat, product_transfat, product_satfat, product_col, product_sug "
						 + " from tbl_product P join tbl_product_nutrition N on P.product_id = N.nutrition_id "
						 + " where nutrition_id = ? ";
				ps=conn.prepareStatement(sql);
				ps.setString(1, nutrition_id);
				
				rs=ps.executeQuery();
				
				
				if(rs.next()) {
					
					ndto = new NutritionDTO();
					ndto.setNutrition_id(rs.getInt("NUTRITION_ID"));
					ndto.setProduct_cal(rs.getDouble("PRODUCT_CAL"));
					ndto.setProduct_protein(rs.getDouble("PRODUCT_PROTEIN"));
					ndto.setProduct_sodium(rs.getInt("PRODUCT_SODIUM"));
					ndto.setProduct_kal(rs.getInt("PRODUCT_KAL"));
					ndto.setProduct_fat(rs.getInt("PRODUCT_FAT"));
					ndto.setProduct_transfat(rs.getInt("PRODUCT_TRANSFAT"));
					ndto.setProduct_satfat(rs.getInt("PRODUCT_SATFAT"));
					ndto.setProduct_col(rs.getInt("PRODUCT_COL"));
					ndto.setProduct_sug(rs.getInt("PRODUCT_SUG"));
					
				}
				System.out.println(ndto.getNutrition_id());
				return ndto;
			}finally {
				close();
			}
		}//제품정보를 알아오는 메소드
	

	
}
	
	
	
