package semiproject.dak.member.model;

import java.sql.SQLException;
import java.util.Map;

public interface InterMemberDAO {

	//Register Method
	boolean registerMember(MemberDTO dto) throws SQLException;

	boolean CheckDuplicateEmail(String email) throws SQLException;

	MemberDTO getMemberByLoginMap(Map<String, String> loginMap) throws SQLException;

	boolean CheckDuplicateID(String userid)  throws SQLException;
	
	// 아이디찾기에서 성명과 이메일로 아이디가 있는지 확인하기 위해 
	String findUserid(Map<String, String> paraMap) throws SQLException;
	
	// 로그인한 유저의 비밀번호와 내정보 수정에서 입력한 비밀번호가 일치하는지 확인
	boolean passwdCheck(Map<String, String> paraMap) throws SQLException;
	
	// 회원의 개인 정보 변경하기
	int updateMember(MemberDTO member) throws SQLException;
	
	

	// 비밀번호 찾기(아이디, 성명, 이메일을 입력받아서 해당 사용자가 존재하는지 유뮤를 알려준다.)
	boolean isUserExist(Map<String, String> paraMap) throws SQLException;


}
