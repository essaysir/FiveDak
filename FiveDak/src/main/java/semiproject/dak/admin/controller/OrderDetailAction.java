package semiproject.dak.admin.controller;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semiproject.dak.common.controller.AbstractController;
import semiproject.dak.product.model.InterOrderDAO;
import semiproject.dak.product.model.OrderDAO;
import semiproject.dak.product.model.OrderDTO;

public class OrderDetailAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String order_serial = request.getParameter("order_serial");
		
		InterOrderDAO odao = new OrderDAO();
		OrderDTO odto = odao.getOrderInfo(order_serial);
		
		// ArrayList <Map<String, Object>> list = odao.getOrderDetail(order_serial);
		
		
		request.setAttribute("odto", odto);
		request.setAttribute("order_serial", order_serial);
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/views/admin/orderDetailView.jsp");
		
		
	}

}
