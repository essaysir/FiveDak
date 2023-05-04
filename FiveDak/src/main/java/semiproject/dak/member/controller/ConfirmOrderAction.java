package semiproject.dak.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semiproject.dak.common.controller.AbstractController;
import semiproject.dak.member.model.InterMemberDAO;
import semiproject.dak.member.model.MemberDAO;

public class ConfirmOrderAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String method = request.getContextPath();
		
		String message = "";
		String loc = "";
		if("GET".equals(method)) {
			message = "잘못된 접근경로입니다.";
        	loc = "javascript:history.back()";
        	request.setAttribute("message", message);
        	request.setAttribute("loc", loc);
        	
        	super.setRedirect(false);
        	super.setViewPage("/WEB-INF/views/msg.jsp");
            return;
			// 접근차단
		}
		
		String orderserial = request.getParameter("orderSerial");
		
		InterMemberDAO mdao = new MemberDAO();
		
		int n = mdao.confirmOrder(orderserial);
		if(n == 1 ) {
			message = "선택하신 주문이 구매확정되었습니다.";
		} else {
			message = "구매확정에 실패했습니다.";
		}
		loc = request.getContextPath() + "/mypage/orderlist.dak";
    	request.setAttribute("message", message);
    	request.setAttribute("loc", loc);
    	
		
		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/views/msg.jsp");

	}

}
