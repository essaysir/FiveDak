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
		
		String product_id = request.getParameter("product_id");
		
		System.out.println();
		
		HttpSession session = request.getSession();
		MemberDTO loginuser = (MemberDTO) session.getAttribute("loginuser");
		
		InterProductDAO pdao = new ProductDAO();
		
		
		String userid = loginuser.getMbrId();
		
		List<ProductDTO> prodList = pdao.productReview(userid);
		
		boolean isLogin = super.checkLogin(request);
		
		if(!isLogin) {
			 
			request.setAttribute("message", "장바구니에 담으려면 먼저 로그인 부터 하세요!!");
	         request.setAttribute("loc", "javascript:history.back()");
           
        super.setRedirect(false);
        super.setViewPage("/WEB-INF/msg.jsp");
           
        return;
		
		}
		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/views/member/mypage_productReview.jsp");
	}

}
