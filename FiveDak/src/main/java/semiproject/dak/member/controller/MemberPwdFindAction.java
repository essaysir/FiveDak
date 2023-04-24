package semiproject.dak.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semiproject.dak.common.controller.AbstractController;
import semiproject.dak.member.model.InterMemberDAO;
import semiproject.dak.member.model.MemberDAO;

public class MemberPwdFindAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String method = request.getMethod();    // "GET" 또는 "POST" 
		
		System.out.println(method +"비ㅣㄹ번호");
		

		// POST 방식이라면 
		if("POST".equalsIgnoreCase(method)) {  
			
			
			 
		}
		else {	
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/views/member/pwdFind.jsp");
		}
		

	}

}
