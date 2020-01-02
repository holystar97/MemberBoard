package com.javatea.member_project2.test;

import java.sql.Date;

import com.javatea.member_project2.dao.MemberDAO;
import com.javatea.member_project2.dao.MemberDAOImpl;
import com.javatea.member_project2.domain.MemberVO;

public class InsertTest {

	public static void main(String[] args) throws Exception {
		// TODO Auto-generated method stub
		MemberDAO dao= MemberDAOImpl.getInstance();
		MemberVO member=new MemberVO();
		member.setMemberId("java12345");
		member.setMemberPassword("1234556677");
		member.setMemberName("장길산");
		member.setMemberGender('m');
		member.setMemberEmail("jsp@avcd.com");
		member.setMemberPhone("010-1111-2222");
		member.setMemberBirth(Date.valueOf("2000-02-02"));
		member.setMemberZip("12345");
		member.setMemberAddress("서울 종로구 다다다 빌딩");
		dao.insertMember(member);
	}

}
