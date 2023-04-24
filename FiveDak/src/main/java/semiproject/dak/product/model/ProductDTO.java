package semiproject.dak.product.model;

public class ProductDTO {
	private int prodNum ; // 제품번호
	private String prodName ; // 제품명
	private int fk_prodCateNum ; // 제품 카데고리 코드(번호)
	private int fk_prodBrandNum ; // 제품 브랜드 코드(번호)
	private int prodPrice ; // 가격
	private int prodStock ; // 재고 
	private int prodSales ; // 판매량 (??)
	private int prodDiscount ; // 할인가격
	private int prodAvgRating ; // 평균 별점
	private String prodImage1 ; // 제품 이미지
	
	// 추후에 추가해야할 사항 : JOIN 을 하기 위해서 무조건 필요하다.
	// private CategoryDTO cateDTO ; // 카테고리 DTO 
	// private BrandDTO brandDTO ; // 브랜드 DTO 
	
	// 기본 생성자 
	public ProductDTO () {}


	public ProductDTO(int prodNum, String prodName, int fk_prodCateNum, int fk_prodBrandNum, int prodPrice,
			int prodStock, int prodSales, int prodDiscount, int prodAvgRating, String prodImage1) {
		this.prodNum = prodNum;
		this.prodName = prodName;
		this.fk_prodCateNum = fk_prodCateNum;
		this.fk_prodBrandNum = fk_prodBrandNum;
		this.prodPrice = prodPrice;
		this.prodStock = prodStock;
		this.prodSales = prodSales;
		this.prodDiscount = prodDiscount;
		this.prodAvgRating = prodAvgRating;
		this.prodImage1 = prodImage1;
	}

	///////////////////////////////////////////////////////////////////////////////////////////////
	
	public int getProdNum() {
		return prodNum;
	}

	public void setProdNum(int prodNum) {
		this.prodNum = prodNum;
	}

	public String getProdName() {
		return prodName;
	}

	public void setProdName(String prodName) {
		this.prodName = prodName;
	}

	public int getFk_prodCateNum() {
		return fk_prodCateNum;
	}

	public void setFk_prodCateNum(int fk_prodCateNum) {
		this.fk_prodCateNum = fk_prodCateNum;
	}

	public int getFk_prodBrandNum() {
		return fk_prodBrandNum;
	}

	public void setFk_prodBrandNum(int fk_prodBrandNum) {
		this.fk_prodBrandNum = fk_prodBrandNum;
	}

	public int getProdPrice() {
		return prodPrice;
	}

	public void setProdPrice(int prodPrice) {
		this.prodPrice = prodPrice;
	}

	public int getProdStock() {
		return prodStock;
	}

	public void setProdStock(int prodStock) {
		this.prodStock = prodStock;
	}

	public int getProdSales() {
		return prodSales;
	}

	public void setProdSales(int prodSales) {
		this.prodSales = prodSales;
	}

	public int getProdDiscount() {
		return prodDiscount;
	}

	public void setProdDiscount(int prodDiscount) {
		this.prodDiscount = prodDiscount;
	}

	public int getProdAvgRating() {
		return prodAvgRating;
	}

	public void setProdAvgRating(int prodAvgRating) {
		this.prodAvgRating = prodAvgRating;
	}

	public String getProdImage1() {
		return prodImage1;
	}

	public void setProdImage1(String prodImage1) {
		this.prodImage1 = prodImage1;
	}
	
	
	
}
