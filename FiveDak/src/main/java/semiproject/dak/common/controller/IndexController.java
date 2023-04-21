package semiproject.dak.common.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class IndexController extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// 수정할지도
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/views/index.jsp");
		

	}

}
