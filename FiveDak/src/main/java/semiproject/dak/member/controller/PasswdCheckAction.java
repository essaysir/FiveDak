package semiproject.dak.member.controller;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import semiproject.dak.common.controller.AbstractController;
import semiproject.dak.member.model.InterMemberDAO;
import semiproject.dak.member.model.MemberDAO;

public class PasswdCheckAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
			String method = request.getMethod();
		
		if("POST".equals(method)) {
			String userid = request.getParameter("userid");
			String password = request.getParameter("password");
			InterMemberDAO dao = new MemberDAO();
			
			Map<String, String> paraMap = new HashMap<>();
			paraMap.put("userid", userid);
			paraMap.put("password", password);
			
			
			boolean passwdCheck = dao.passwdCheck(paraMap);
			JSONObject jsonObj = new JSONObject();
			jsonObj.put("passwdCheck", passwdCheck);
			
			
			String json = jsonObj.toString();
			request.setAttribute("json", json);
			
			
			super.setViewPage("/WEB-INF/views/jsonview.jsp");
		} else {
			String msg = "비정상적인 접근입니다.";
			String loc = "javascript:history.back()";
			request.setAttribute("message", msg);
			request.setAttribute("loc", loc);
			super.setViewPage("/WEB-INF/views/msg.jsp");
		}
		
		
		
		

	}

}
