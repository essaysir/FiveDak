package semiproject.dak.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import semiproject.dak.common.controller.AbstractController;
import semiproject.dak.member.model.InterMemberDAO;
import semiproject.dak.member.model.MemberDAO;
import semiproject.dak.member.model.MemberDTO;

public class MemberLoginAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
        MemberDTO member = (MemberDTO) session.getAttribute("member");
        
        //이미 로그인했을 때
        if (member != null) {
            //메인페이지로 보내기
        	super.setRedirect(true);
            return;
        }
        
        // form에서 입력값 가져오기
        String username = request.getParameter("username");
        String pwd = request.getParameter("pwd");
        
        
        InterMemberDAO dao = new MemberDAO();
        Map<String, String> loginMap = new HashMap<>();
        loginMap.put("username", username);
        loginMap.put("pwd", pwd);
        
        MemberDTO loginuser = dao.getMemberByLoginMap(loginMap);
        
        if (loginuser != null) {
            
        	//로그인 성공했을 때
            session.setAttribute("loginuser", loginuser);
            // 메인페이지로 보내기 추가
        } else {
            // 로그인 실패 에러메시지 + 로그인창으로 돌아가기 추가
        }
		

	}

}
