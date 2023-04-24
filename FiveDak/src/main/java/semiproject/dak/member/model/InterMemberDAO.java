package semiproject.dak.member.model;

import java.sql.SQLException;
import java.util.Map;

public interface InterMemberDAO {

	//Register Method
	boolean registerMember(MemberDTO dto) throws SQLException;

	boolean CheckDuplicateEmail(String email) throws SQLException;

	MemberDTO getMemberByLoginMap(Map<String, String> loginMap) throws SQLException;

	boolean CheckDuplicateID(String userid)  throws SQLException;


}
