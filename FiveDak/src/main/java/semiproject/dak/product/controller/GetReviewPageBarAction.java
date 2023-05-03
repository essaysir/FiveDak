package semiproject.dak.product.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import semiproject.dak.common.controller.AbstractController;
import semiproject.dak.product.model.InterProductDAO;
import semiproject.dak.product.model.ProductDAO;

public class GetReviewPageBarAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		 String currentShowPageNo = request.getParameter("currentShowPageNo");
		 String prodNum = request.getParameter("prodNum");
		 if ( currentShowPageNo == null || currentShowPageNo == "" ) {
				currentShowPageNo = "1" ;
			}
		InterProductDAO pdao = new ProductDAO() ;
		Map<String,String> paraMap = new HashMap<>() ;
		paraMap.put("prodNum", prodNum);
		paraMap.put("currentShowPageNo", currentShowPageNo) ;
		 // 총 페이지를 알아오는 메소드 
		 int totalPage = pdao.getTotalReviewPage(paraMap);
		 
		 String pageBar = "";
		 int blockSize = 5 ;
		 // blockSize 는 블럭(토막)당 보여지는 페이지 번호의 개수이다.
			
		 int loop = 1 ;
		 // loop 는 1부터 증가하여 1개 블럭을 이루는 페이지 번호의 개수( 지금은 10개 ) 까지만 증가하는 용도이다.
			
		 //  pageNo  ==> ( (currentShowPageNo - 1)/blockSize ) * blockSize + 1 
		 int pageNo = ( (Integer.parseInt(currentShowPageNo)-1)/blockSize)*blockSize + 1 ;
		 // pageNo 는 페이지 바에서 첫번째로 보여지는 번호이다.
			
		 // **** [맨처음][이전] 만들기 ***** //
			
		 pageBar += "<li class='page-item'><a class='page-link' href='productDetail.dak?"
					+ "prodNum="+prodNum+"&currentShowPageNo="
					+1+"'>맨처음</a></li>" ;
					
			
			if( pageNo != 1) {
					pageBar += "<li class='page-item'><a class='page-link' href='getReviewList.dak?"
					+ "prodNum="+prodNum+"&currentShowPageNo="
					+(pageNo-1)+"'>이전</a></li>" ;
			}
			// !( 반복을 빠져나가는 조건 ) => for 문을 사용할 경우, 밑에서 if 문을 통해, 전체페이지를 넘는 경우에 대해 조건을 설정해야 한다.
			while(!(loop > blockSize || pageNo > totalPage)  ) {
				// 현재 있는 페이지는 href 를 안 준 것이다. 굳이 필요하지 않기 때문에
				if (pageNo == Integer.parseInt(currentShowPageNo) ) {
					pageBar += "<li class='page-item active'><a class='page-link activeNo'>"+pageNo+"</a></li>" ;					
				}
				
				else {
					pageBar += "<li class='page-item'><a class='page-link' href='getReviewList.dak?"
							+ "prodNum="+prodNum+"&currentShowPageNo="
							+pageNo+"'>"+pageNo+"</a></li>" ;
				
				}
			loop ++ ; // 1 2 3 4 5 6 7 8 ~ 10 
			pageNo ++ ; // 이게 증가해야 하는 이유 : 혼자 생각해보면, 위의 조건을 넣기 위해서 필요하다. 전체 페이지를 넘지 않는 조건을 생성하기 위해서
				
			}// end of while ~~~
			
			// **** [다음][마지막] 만들기 ***** //
			if( pageNo <= totalPage) {
				pageBar += "<li class='page-item'><a class='page-link' href='getReviewList.dak?"
						+ "prodNum="+prodNum+"&currentShowPageNo="
						+pageNo+"'>다음</a></li>" ;
			}
			
			pageBar += "<li class='page-item'><a class='page-link' href='getReviewList.dak?"
					+"prodNum="+prodNum+"&currentShowPageNo="
					+totalPage+"'>마지막</a></li>" ;
			
			JSONObject jsonObj = new JSONObject() ;
			jsonObj.put("pageBar", pageBar); // {"message" : " 해당제품에 \n 좋아요를 클릭하셨습니다."}
			
			String json = jsonObj.toString();
			request.setAttribute("json", json);
			 
			super.setViewPage("/WEB-INF/views/jsonview.jsp");
			
			
	}

}
