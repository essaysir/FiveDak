package semiproject.dak.common.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class IndexController extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// 임시조치임 (header)
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/views/header.jsp");
		

	}

}
