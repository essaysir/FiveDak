package semiproject.dak.product.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semiproject.dak.common.controller.AbstractController;
import semiproject.dak.product.model.*;

public class ProductDetailAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpServletRequest httpRequest = (HttpServletRequest) request;
	       
		
		String prodNum = request.getParameter("prodNum");
		String review_member_id = request.getParameter("review_member_id");
		String nutrition_id = request.getParameter("nutrition_id");
		if((prodNum==null || prodNum.isEmpty()) && (review_member_id==null || review_member_id.isEmpty())){
			
			String msg = "잘못된 url 입니다.";
			String loc = httpRequest.getContextPath() + "/index.dak" ;
			request.setAttribute("message", msg);
			request.setAttribute("loc", loc);
			super.setViewPage("/WEB-INF/views/msg.jsp");
		
		}
		
		InterProductDAO dao = new ProductDAO();
		
		ProductDTO dto = null;
		try{
			dto=dao.prodInfo(Integer.parseInt(prodNum),Integer.parseInt(review_member_id));
			//dto=dao.prodInfo(Integer.parseInt(review_product_id));
		}catch(SQLException e){
			e.printStackTrace();
		}
		
		//int prodNum = dto.getProdNum(); // 제품번호
		String prodName = dto.getProdName(); // 제품명
		int prodPrice = dto.getProdPrice(); // 정가
		int prodStock = dto.getProdStock(); // 재고 
		int prodSales = dto.getProdSales(); // 판매량
		int prodDiscount = dto.getProdDiscount(); // 판매가
		double prodAvgRating = dto.getProdAvgRating(); // 평균 별점
		String prodImage1 = dto.getProdImage1(); // 제품 이미지
		
		int reviewCnt = dto.getreviewDTO().getReview_cnt();
		
		String brandName = dto.getbrandDTO().getBrandName();
		
		
		////////////////////////////////////////////////////////////////////////////
		
		NutritionDTO ndto = null;
		try{
			ndto=dao.nutritionInfo(nutrition_id);
		} catch(SQLException e) {
			e.printStackTrace();
		}
		
		//nutrition_id = ndto.getNutrition_id();
		double product_cal = ndto.getProduct_cal();
		
	    double product_protein = ndto.getProduct_protein();
	    double product_sodium = ndto.getProduct_sodium();
	    double product_kal = ndto.getProduct_kal();
	    double product_fat = ndto.getProduct_fat();
	    double product_transfat = ndto.getProduct_transfat();
	    double product_satfat = ndto.getProduct_satfat();
	    double product_col = ndto.getProduct_col();
	    double product_sug = ndto.getProduct_sug();
		
		
		
		
		
		
		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/views/product/prodDetail.jsp");
		

	}

}
