package semiproject.dak.member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import semiproject.dak.common.controller.AbstractController;
import semiproject.dak.member.model.InterMemberDAO;
import semiproject.dak.member.model.MemberDAO;
import semiproject.dak.member.model.MemberDTO;
import semiproject.dak.product.model.OrderDTO;

public class OrderListAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		HttpSession session = request.getSession();
		MemberDTO loginuser = (MemberDTO)session.getAttribute("loginuser");
		
		String userid = loginuser.getMbrId();
		String startdate = request.getParameter("startdate");
		String enddate = request.getParameter("enddate");
		String currentPage = request.getParameter("pageno");
		int pageSize = 5;
		
		if(startdate == null || (startdate != null && startdate.trim().equals(""))) {
			startdate = "2023-04-01";
		}
		enddate = "2023-05-30";
		
		Map<String, String> paraMap = new HashMap<>();
		paraMap.put("userid", userid);
		paraMap.put("startdate", startdate);		
		paraMap.put("enddate", enddate);
		
		InterMemberDAO dao = new MemberDAO();
		int totalOrder = dao.getOrderListTotalPage(paraMap);
		List<OrderDTO> orderlist = dao.getOrdersByDateRange(paraMap); 
		
		request.setAttribute("totalOrder", totalOrder);
		request.setAttribute("orderlist", orderlist);
		
		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/views/member/mypage_order.jsp");
	}

}
