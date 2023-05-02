package semiproject.dak.member.controller;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import semiproject.dak.common.controller.AbstractController;
import semiproject.dak.member.model.MemberDTO;
import semiproject.dak.product.model.*;

public class ProductReviewAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		HttpSession session = request.getSession();
		MemberDTO loginuser = (MemberDTO) session.getAttribute("loginuser");
		
		InterProductDAO pdao = new ProductDAO();
		
		
		String userid = loginuser.getMbrId();
		
		List<OrderDTO> orderList1 = pdao.productReview(userid, 1);
		List<OrderDTO> orderList2= pdao.productReview(userid, 2);
		
		InterReviewDAO rdao = new ReviewDAO();
		
		Map<String, String> map = rdao.getreviewDate(userid); 
		
		
		
		String reviewCount = map.get("reviewCount");
		String writeDate =  map.get("writeDate");
		
		boolean isLogin = super.checkLogin(request);
		
		
		
		if(!isLogin) {
			request.setAttribute("message", "상품후기를 입력하려면 먼저 로그인 부터 하세요!!");
	        request.setAttribute("loc", "javascript:history.back()");
           
        super.setRedirect(false);
        super.setViewPage("/WEB-INF/views/msg.jsp");
           
        return;
		
		}
		
		else {
		
		request.setAttribute("orderList1", orderList1);
		request.setAttribute("orderList2", orderList2);
		request.setAttribute("writeDate", writeDate);
		request.setAttribute("reviewCount", reviewCount);
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/views/member/mypage_productReview.jsp");
	
		}
	}

}
