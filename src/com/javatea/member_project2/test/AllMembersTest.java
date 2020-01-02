package com.javatea.member_project2.test;

import com.javatea.member_project2.dao.MemberDAO;
import com.javatea.member_project2.dao.MemberDAOImpl;
import com.javatea.member_project2.domain.MemberVO;

public class AllMembersTest {

	public static void main(String[] args) throws Exception  {
		// TODO Auto-generated method stub

		MemberDAO dao= MemberDAOImpl.getInstance();
		
		for(MemberVO m: dao.getAllMembers()) {
			System.out.println(m);
		}
		
		
	}

}
