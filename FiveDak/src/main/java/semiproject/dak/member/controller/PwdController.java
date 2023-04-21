package semiproject.dak.common.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PwdController extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//
		super.setViewPage("/WEB-INF/views/member/pwdChange.jsp");
		
		
	}

}
