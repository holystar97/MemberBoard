package com.javatea.member_project2.service;

import java.util.List;

import com.javatea.member_project2.dao.MemberDAO;
import com.javatea.member_project2.dao.MemberDAOImpl;
import com.javatea.member_project2.domain.MemberVO;

public class MemberServiceImpl implements MemberService {

	//impl : 구현해주겟다는 의미 
	//DAO 
	private MemberDAO dao= MemberDAOImpl.getInstance();
	
	@Override
	public boolean insertMember(MemberVO member) throws Exception {
		// TODO Auto-generated method stub

		
		// 트랜잭션 : 데이터의 보안적으로 처리하는 일의 단위 / commit / data control / rollback/ 취소 ,넣는것 
		
		boolean flag=false;
		
		if(dao.insertMember(member)==true) {
		
			flag=true;
		}else {
			flag=false;
		}
		return flag;
	

		
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

	@Override
	public MemberVO getMember(String memberId) throws Exception {
		// TODO Auto-generated method stub
	
		return dao.getMember(memberId);
	}

	@Override
	public List<MemberVO> getAllMembers() throws Exception {
		// TODO Auto-generated method stub
		return dao.getAllMembers();
	}

	@Override
	public List<MemberVO> getAllMembersByPaging(int page, int limit) throws Exception {
		// TODO Auto-generated method stub
		return  dao.getAllMembersByPaging(page,limit);
	}

	@Override
	public boolean updateMember(MemberVO member) throws Exception {
		
		return dao.updateMember(member);
	}

	@Override
	public boolean deleteMember(String memberId) throws Exception {
	
		return dao.deleteMember(memberId);
	}

	@Override
	public boolean isMember(String memberId) throws Exception {
		// TODO Auto-generated method stub
		return dao.isMember(memberId);
	}

}
