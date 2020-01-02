package com.javatea.member_project2.dao;

import java.util.List;

import com.javatea.member_project2.domain.MemberVO;

public interface MemberDAO {

	
	/**
	 * 회원정보생성 
	 * 
	 * @param member 회원정보 객체
	 * @return 저장 성공여부
	 * @throws Exception 예외처리
	 * 
	 * */
	
	boolean insertMember(MemberVO member) throws Exception;
	
	
	/**
	 * 개별 회원정보 조회
	 * 
	 * @param memberId 회원 아이디
	 * @return 회원정보 객체
	 * @throws Exception 예외처리
	 * */
	
	
	MemberVO getMember(String memberId) throws Exception;
	
	
	
	/**
	 * 전체 회원정보 조회
	 * @return 전체 회원 정보 (리스트 형태)
	 * @throws Exception
	 *
	 * */
	
	List<MemberVO> getAllMembers() throws Exception;
	
	
	/**
	 * 전체 회원정보 조회 (페이징)
	 * @param page 현재 페이지
	 * @param limit 한계치(몇명까지 출력)
	 * @return 회원정보들
	 * @throws Exception 예외처리
	 * 
	 * */
	
	List<MemberVO> getAllMembersByPaging(int page, int limit) 
			throws Exception;
	
	
}
