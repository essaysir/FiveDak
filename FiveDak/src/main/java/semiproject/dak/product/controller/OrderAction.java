package semiproject.dak.product.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import semiproject.dak.common.controller.AbstractController;
import semiproject.dak.product.model.CheckoutDTO;
import semiproject.dak.product.model.InterProductDAO;
import semiproject.dak.product.model.ProductDAO;

public class OrderAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String method = request.getMethod();
		
		
		if("GET".equalsIgnoreCase(method)) {
			String msg = "비정상적인 접근입니다.";
			String loc = "javascript:history.back()";
			request.setAttribute("message", msg);
			request.setAttribute("loc", loc);
			super.setViewPage("/WEB-INF/views/msg.jsp");
		}
		
		String SelectedProductArr = request.getParameter("SelectedProductArr");
		JSONArray jsonArray = new JSONArray(SelectedProductArr);

		int[] cartIds = new int[jsonArray.length()];

		for (int i = 0; i < jsonArray.length(); i++) {
		    JSONObject jsonObject = jsonArray.getJSONObject(i);
		    int cartId = jsonObject.getInt("cartid");
		    cartIds[i] = cartId;
		}
		
		InterProductDAO dao = new ProductDAO();
		
		CheckoutDTO checkout = dao.getCheckOutData(cartIds, request);
		
		request.setAttribute("checkout", checkout);
		
		
		super.setViewPage("/WEB-INF/views/product/orderpayment.jsp");
		

	}

}
