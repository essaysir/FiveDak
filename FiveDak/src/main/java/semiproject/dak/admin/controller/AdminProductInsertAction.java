package semiproject.dak.admin.controller;

import java.io.IOException;import java.security.ProtectionDomain;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import semiproject.dak.common.controller.AbstractController;
import semiproject.dak.product.model.BrandDTO;
import semiproject.dak.product.model.CategoryDTO;
import semiproject.dak.product.model.InterProductDAO;
import semiproject.dak.product.model.ProductDAO;
import semiproject.dak.product.model.ProductDTO;

public class AdminProductInsertAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String method = request.getMethod();
		HttpSession session = request.getSession();
		if ( !"POST".equalsIgnoreCase(method)) {
			InterProductDAO pdao = new ProductDAO();
			
			List<CategoryDTO> cdtolist = pdao.getCategoryList();
			
			request.setAttribute("cdto", cdtolist);
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/views/admin/productInsert.jsp");
		}
		
		else {
			MultipartRequest mtrequest =  null;
			
			ServletContext svlCtx = session.getServletContext();
			String uplodaFileDir = svlCtx.getRealPath("/images");
			
			try {
				mtrequest =  new MultipartRequest(request,uplodaFileDir,10*1024*1024, "UTF-8" , new DefaultFileRenamePolicy());
			  
			}catch(IOException e) {
				  request.setAttribute("message", "업로드가 되어질 경로가 잘못되었거나 또는 최대용량 10MB 를 초과했으므로 파일업로드 실패함 !!");
				  request.setAttribute("loc", request.getContextPath()+"/admin/adminProductInsert.dak");
				  
				  super.setRedirect(false);
				  super.setViewPage("/WEB-INF/views/msg.jsp");
				  return ;
			  }
			InterProductDAO pdao = new ProductDAO();
			
			String prodName = mtrequest.getParameter("prodName") ;
			prodName = prodName.replaceAll("<", "&lt;");
			prodName = prodName.replaceAll(">","&gt;");
			
			String cateId = mtrequest.getParameter("cateId");
			String brandName = mtrequest.getParameter("brandName");
			int brandNum = pdao.getBrandNum(brandName);
			String prodStock = mtrequest.getParameter("prodStock");
			String prodPrice = mtrequest.getParameter("prodPrice");
			String prodDiscount = mtrequest.getParameter("prodDiscount");
			String pimage1 = mtrequest.getFilesystemName("pimage1");
			
			
			/*
			 * String pimage2 = mtrequest.getFilesystemName("pimage2"); if ( pimage2 !=
			 * null) {
			 * 
			 * }
			 */
			ProductDTO pdto = new ProductDTO();
			pdto.setProdName(prodName);
			pdto.setFk_prodCateNum(Integer.parseInt(cateId));
			pdto.setProdStock(Integer.parseInt(prodStock));
			pdto.setProdPrice(Integer.parseInt(prodPrice));
			pdto.setProdDiscount(Integer.parseInt(prodDiscount));
			pdto.setFk_prodBrandNum(brandNum);
			pdto.setProdImage1(pimage1);
			
			BrandDTO bdto = new BrandDTO();
			bdto.setBrandName(brandName);
			pdto.setBrandDTO(bdto);
			
			
			
			int n = pdao.insertProduct(pdto);
			
			super.setRedirect(false);
			super.setViewPage("/admin/adminProductSearch.dak?searchType=&searchWord=&currentShowPageNo=");
			
			
		}
		
		
		
	}

}
