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

	int updateMember(MemberDTO member) throws SQLException;
	
	

}
