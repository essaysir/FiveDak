package semiproject.dak.member.model;

import java.sql.SQLException;

public interface InterMemberDAO {

	//Register Method
	boolean registerMember(MemberDTO dto) throws SQLException;

	boolean CheckDuplicateEmail(String email) throws SQLException;

}
