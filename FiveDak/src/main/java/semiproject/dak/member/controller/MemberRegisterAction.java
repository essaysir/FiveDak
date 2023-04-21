package semiproject.dak.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semiproject.dak.common.controller.AbstractController;
import semiproject.dak.member.model.InterMemberDAO;
import semiproject.dak.member.model.MemberDAO;
import semiproject.dak.member.model.MemberDTO;

public class MemberRegisterAction extends AbstractController {
	
	private static final String REGISTER_PAGE = "/WEB-INF/view/signUpForm.jsp";
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		super.setRedirect(false);
		super.setViewPage(REGISTER_PAGE);
		String method = request.getMethod();
		if ("GET".equals(method)) {return;}
		
		String userid = request.getParameter("userid");
		String pwd = request.getParameter("pwd");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String mobile = request.getParameter("mobile0") + request.getParameter("mobile1") + request.getParameter("mobile2");
		String postcode = request.getParameter("postcode");
		String address = request.getParameter("address");
		String detailAddress = request.getParameter("detailAddress");
		String gender = request.getParameter("gender");
		String birth = request.getParameter("birthyy") + request.getParameter("birthmm") + request.getParameter("birthdd");
		
		MemberDTO dto = new MemberDTO(userid, pwd, name, email, mobile,postcode, address, detailAddress, gender, birth);
		
		
		InterMemberDAO dao = new MemberDAO();
		
		try {
			if(dao.registerMember(dto)) {
				request.setAttribute("userid", userid);
				request.setAttribute("pwd", pwd);
				
				super.setRedirect(false);
				super.setViewPage("/WEB-INF/login/registerAfterAutoLogin.jsp");
			}
		} catch (Exception e) {
			// 예외 처리 (이따가)
		}
		
		
		
		

	}

}
