package semiproject.dak.product.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import semiproject.dak.common.controller.AbstractController;
import semiproject.dak.member.model.MemberDTO;

public class CheckSessionAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String method = request.getMethod();
		
		if("GET".equalsIgnoreCase(method)) {
			String message = "비정상적인 경로를 통해 들어왔습니다.!!";
			String loc = "javascript:history.back()";
			request.setAttribute("message", message);
			request.setAttribute("loc", loc);
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/views/msg.jsp");
			return;
			
		}
		
	    HttpSession session = request.getSession(false);
	    String userid = "";
	    boolean sessionEmpty = session == null || ((MemberDTO)session.getAttribute("loginuser")) == null;
	    
	    if(!sessionEmpty) {
	    	userid = ((MemberDTO)session.getAttribute("loginuser")).getMbrId();
	    }
	    
	    JSONObject jsonObj = new JSONObject();
	    jsonObj.put("sessionEmpty", sessionEmpty);
	    jsonObj.put("userid", userid);
	    String json = jsonObj.toString();
	    request.setAttribute("json", json);
	    
	    super.setViewPage("/WEB-INF/views/jsonview.jsp");
	   
	    
		

	}

}
