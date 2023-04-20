package semiproject.dak.member.model;

public class MemberDTO {
	
	private int mbrNum;
	private String mbrId;
	private String mbrPwd;
	private String mbrName;
	private String mbrPhone;
	private String mbrEmail;
	private int mbrPoint;
	private String mbrGender;
	private String mbrBirth;
	private String mbrZipCode;
	private String mbrAddress;
	private String mbrDetailAddress;
	private String mbrTierId; // 나중에 수정 MembershipDTO 만들거나 조인으로 그냥 바로 받아오거나? 
	private String mbrRegDate;
	private int mbrStatus;
	private int mbrIdle;
	private String mbrLastPwdChanged;
	
	
	//기본 생성자
	public MemberDTO() {
		
	}
	
	
	public int getMbrNum() {
		return mbrNum;
	}
	public void setMbrNum(int mbrNum) {
		this.mbrNum = mbrNum;
	}
	public String getMbrId() {
		return mbrId;
	}
	public void setMbrId(String mbrId) {
		this.mbrId = mbrId;
	}
	public String getMbrPwd() {
		return mbrPwd;
	}
	public void setMbrPwd(String mbrPwd) {
		this.mbrPwd = mbrPwd;
	}
	public String getMbrName() {
		return mbrName;
	}
	public void setMbrName(String mbrName) {
		this.mbrName = mbrName;
	}
	public String getMbrPhone() {
		return mbrPhone;
	}
	public void setMbrPhone(String mbrPhone) {
		this.mbrPhone = mbrPhone;
	}
	public String getMbrEmail() {
		return mbrEmail;
	}
	public void setMbrEmail(String mbrEmail) {
		this.mbrEmail = mbrEmail;
	}
	public int getMbrPoint() {
		return mbrPoint;
	}
	public void setMbrPoint(int mbrPoint) {
		this.mbrPoint = mbrPoint;
	}
	public String getMbrGender() {
		return mbrGender;
	}
	public void setMbrGender(String mbrGender) {
		this.mbrGender = mbrGender;
	}
	public String getMbrBirth() {
		return mbrBirth;
	}
	public void setMbrBirth(String mbrBirth) {
		this.mbrBirth = mbrBirth;
	}
	public String getMbrZipCode() {
		return mbrZipCode;
	}
	public void setMbrZipCode(String mbrZipCode) {
		this.mbrZipCode = mbrZipCode;
	}
	public String getMbrAddress() {
		return mbrAddress;
	}
	public void setMbrAddress(String mbrAddress) {
		this.mbrAddress = mbrAddress;
	}
	public String getMbrDetailAddress() {
		return mbrDetailAddress;
	}
	public void setMbrDetailAddress(String mbrDetailAddress) {
		this.mbrDetailAddress = mbrDetailAddress;
	}
	public String getMbrTierId() {
		return mbrTierId;
	}
	public void setMbrTierId(String mbrTierId) {
		this.mbrTierId = mbrTierId;
	}
	public String getMbrRegDate() {
		return mbrRegDate;
	}
	public void setMbrRegDate(String mbrRegDate) {
		this.mbrRegDate = mbrRegDate;
	}
	public int getMbrStatus() {
		return mbrStatus;
	}
	public void setMbrStatus(int mbrStatus) {
		this.mbrStatus = mbrStatus;
	}
	public int getMbrIdle() {
		return mbrIdle;
	}
	public void setMbrIdle(int mbrIdle) {
		this.mbrIdle = mbrIdle;
	}
	public String getMbrLastPwdChanged() {
		return mbrLastPwdChanged;
	}
	public void setMbrLastPwdChanged(String mbrLastPwdChanged) {
		this.mbrLastPwdChanged = mbrLastPwdChanged;
	}
	
	
	
	
	
	
	
	
	
	
}
