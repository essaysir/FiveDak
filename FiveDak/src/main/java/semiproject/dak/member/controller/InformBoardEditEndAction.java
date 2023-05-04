package semiproject.dak.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semiproject.dak.common.controller.AbstractController;
import semiproject.dak.member.model.InterMemberDAO;
import semiproject.dak.member.model.MemberDAO;

public class InformBoardEditEndAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String method = request.getMethod();
		String message = "";
		String loc = "";
		
		if("POST".equalsIgnoreCase(method)) {
		
			
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			String seq = request.getParameter("id");
			/*
			 * content = content.replaceAll("<", "&lt;"); 
			 * content = content.replaceAll(">",
			 * "&gt;"); content = content.replace("\r\n", "<br>");
			 */
			
			
			
			InterMemberDAO mdao = new MemberDAO();
			
			System.out.println(title);
			System.out.println(content);
			
			Map<String, String> paraMap = new HashMap<>();
			paraMap.put("title", title);
			paraMap.put("content", content);
			paraMap.put("seq", seq);
			
			int n = mdao.boardEdit(paraMap);
			
			if(n==1) {
				message = "공지사항 수정이 완료되었습니다.";
				loc = request.getContextPath()+"/CSC/informBoardView.dak?num="+seq;

				request.setAttribute("message", message);
				request.setAttribute("loc", loc);

				super.setRedirect(false);
				super.setViewPage("/WEB-INF/views/msg.jsp");
			}
			else {
				message = "공지사항 수정이 실패하였습니다.";
				loc = "javascript:location.reload()";

				request.setAttribute("message", message);
				request.setAttribute("loc", loc);

				super.setRedirect(false);
				super.setViewPage("/WEB-INF/views/msg.jsp");
			}
			
		}
		else {
			super.setViewPage("/WEB-INF/views/InformBoard/list.jsp");
		}
		
	}

}
