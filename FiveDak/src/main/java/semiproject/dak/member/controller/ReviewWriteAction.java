package semiproject.dak.member.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.*;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import semiproject.dak.common.controller.AbstractController;
import semiproject.dak.member.model.MemberDTO;
import semiproject.dak.product.model.InterProductDAO;
import semiproject.dak.product.model.OrderDTO;
import semiproject.dak.product.model.ProductDAO;

public class ReviewWriteAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String method = request.getMethod();
		
		
		if("post".equalsIgnoreCase(method)) {
			
			HttpSession session = request.getSession();
			MemberDTO loginuser = (MemberDTO) session.getAttribute("loginuser");
			
			MultipartRequest mtrequest = null;
			
			ServletContext svlCtx = session.getServletContext();
			String uploadFileDir = svlCtx.getRealPath("/images");
			
			try {
				mtrequest = new MultipartRequest(request, uploadFileDir, 10*1024*1024, "UTF-8", new DefaultFileRenamePolicy() );  
			} catch (IOException e) {
				request.setAttribute("message", "업로드 되어질 경로가 잘못되었거나 또는 최대용량 10MB를 초과했으므로 파일업로드 실패함!!");
				request.setAttribute("loc", request.getContextPath()+"/mypage/reviewlist.dak");
				
				super.setRedirect(false);
				super.setViewPage("/WEB-INF/views/msg.jsp");
				return; // 종료
			}
			
			String orderSerial = mtrequest.getParameter("orderSerial");
			String product_id = mtrequest.getParameter("product_id");
			String rating = mtrequest.getParameter("rating");
			String contents = mtrequest.getParameter("contents");
			
			String userid = loginuser.getMbrId();
			String rimage = mtrequest.getFilesystemName("rimage");
			String rimage1 = mtrequest.getFilesystemName("rimage1");
			contents = contents.replaceAll("<", "&lt;");
			contents = contents.replaceAll(">", "&gt;");
			contents = contents.replaceAll("\r\n", "<br>");
			
			
			
			//System.out.println("orderSerial : " +orderSerial);
			//System.out.println("product_id : " +product_id);
			Map<String, String> paraMap = new HashMap<>();
			
			paraMap.put("rimage", rimage);
			paraMap.put("rimage1", rimage1);
			paraMap.put("orderSerial", orderSerial);
			paraMap.put("product_id", product_id);
			paraMap.put("userid", userid);
			paraMap.put("rating", rating);
			paraMap.put("contents", contents);
			
			
			InterProductDAO pdao = new ProductDAO();
			
			String message = "";
			String loc = "";
			try {
				int n = pdao.addReview(paraMap);
				
				if(n == 1) {
					
					 message = "리뷰등록 성공!!";
					 loc = request.getContextPath()+"/mypage/reviewlist.dak";

				}
			} catch (SQLException e) {
				 e.printStackTrace();
	              
	              message = "리뷰등록 실패!!";
	              loc = request.getContextPath()+"/mypage/reviewlist.dak";
			}
				request.setAttribute("message", message);
				request.setAttribute("loc", loc);
				
				super.setRedirect(false);
				super.setViewPage("/WEB-INF/views/msg.jsp");
		}
		
		else {
			
			String product_id = request.getParameter("product_id");
			String order_serial = request.getParameter("order_serial");
			
		
			
			Map<String, String> paraMap = new HashMap<>();
			paraMap.put("product_id", product_id);
			paraMap.put("order_serial", order_serial);
			
			
			InterProductDAO pdao = new ProductDAO();
			OrderDTO odto =  pdao.ProductOrderDetail(paraMap);
			request.setAttribute("odto", odto);
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/views/member/mypage_ReviewWrite.jsp");
		
		}
		
		
		
	
		
	}

}
