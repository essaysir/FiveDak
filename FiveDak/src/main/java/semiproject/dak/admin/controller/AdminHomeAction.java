package semiproject.dak.admin.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semiproject.dak.common.controller.AbstractController;
import semiproject.dak.product.model.InterOrderDAO;
import semiproject.dak.product.model.OrderDAO;
import semiproject.dak.product.model.OrderDTO;

public class AdminHomeAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		InterOrderDAO odao = new OrderDAO() ;
		List<OrderDTO> orderList = odao.showAllOrder();
		
		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/views/admin/mainAdmin.jsp");
		
	}

}
