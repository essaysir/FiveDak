package semiproject.dak.admin.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semiproject.dak.common.controller.AbstractController;
import semiproject.dak.product.model.InterOrderDAO;
import semiproject.dak.product.model.OrderDAO;
import semiproject.dak.product.model.OrderDTO;

public class OrderDetailAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String orderid = request.getParameter("orderid");
		
		InterOrderDAO odao = new OrderDAO();
		OrderDTO odto = odao.getOrderInfo(orderid);
		
		
		
		
		request.setAttribute("odto", odto);
		request.setAttribute("orderid", orderid);
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/views/admin/orderDetailView.jsp");
		
		
	}

}
