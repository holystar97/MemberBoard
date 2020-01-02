package com.javatea.member_project2.test;

import com.javatea.member_project2.dao.MemberDAO;
import com.javatea.member_project2.dao.MemberDAOImpl;

public class GetMemberTest {

	public static void main(String[] args) throws Exception  {
		// TODO Auto-generated method stub

		MemberDAO dao= MemberDAOImpl.getInstance();
		System.out.println(dao.getMember("java12345"));
		
		
	}

}
