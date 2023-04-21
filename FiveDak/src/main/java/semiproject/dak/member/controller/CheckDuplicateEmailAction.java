package semiproject.dak.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import semiproject.dak.common.controller.AbstractController;
import semiproject.dak.member.model.InterMemberDAO;
import semiproject.dak.member.model.MemberDAO;

public class CheckDuplicateEmailAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		InterMemberDAO dao = new MemberDAO(); 
		String email = request.getParameter("email");
		boolean isExist = dao.CheckDuplicateEmail(email);
		
		JSONObject jsonObj = new JSONObject();
		// {"isExists":true}
		// {"isExists":false}
		
		jsonObj.put("isExist", isExist);
		
		String json = jsonObj.toString();
		
		request.setAttribute("json", json);
		
		// super.setRedirect(false);
		super.setViewPage("/WEB-INF/views/jsonview.jsp");
	}

}
