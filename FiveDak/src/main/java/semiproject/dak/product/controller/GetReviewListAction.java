package semiproject.dak.product.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semiproject.dak.common.controller.AbstractController;
import semiproject.dak.product.model.InterProductDAO;
import semiproject.dak.product.model.ProductDAO;
import semiproject.dak.product.model.ReviewDTO;

public class GetReviewListAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
				String pageNum = request.getParameter("pageNum");
				String prodNum = request.getParameter("prodNum");
				if ( pageNum == null || pageNum == "" ) {
					pageNum = "1";
				}
				
				InterProductDAO pdao = new ProductDAO() ;
				Map<String,String> paraMap = new HashMap<>() ;
				paraMap.put("prodNum", prodNum);
				paraMap.put("pageNum", pageNum);
				
				List<ReviewDTO> reviewlist = pdao.getReviewList(paraMap);
				int blocksize = 5 ;
				// 총 페이지를 알아오는 메소드 
				int totalPage = pdao.getTotalReviewPage(paraMap);
				 
				int startPage = ( ( Integer.parseInt(pageNum) -1 )/ blocksize) * blocksize + 1 ;
				int endPage = Math.min(totalPage, startPage + blocksize - 1) ;
				
			    if ( reviewlist.size() > 0 ) {
			    	request.setAttribute("pageNum", pageNum);
			    	request.setAttribute("startPage", startPage);
			    	request.setAttribute("endPage", endPage);
			    	request.setAttribute("reviewlist", reviewlist);
			    	request.setAttribute("totalPage", totalPage);
			    	super.setViewPage("/WEB-INF/views/product/productReview.jsp");
			    }
			    
			    else {
			    	request.setAttribute("json", "false");
					super.setViewPage("/WEB-INF/views/jsonview.jsp");		    
			    }
			     
			      
				
					
				   
			    
		      
			
		
		

	}

}
