package com.javateam.member_project2.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javatea.member_project2.domain.MemberVO;
import com.javatea.member_project2.service.MemberService;
import com.javatea.member_project2.service.MemberServiceImpl;

/**
 * Servlet implementation class MemberViewProcAction
 */
@WebServlet("/member/member_view_proc.do")
public class MemberViewProcAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberViewProcAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
		
		// 회원 아이디 인자 처리 
		String id=request.getParameter("memberId").trim();
		MemberService service=new MemberServiceImpl();
		MemberVO member=null;
		String returnPath="";
		String addr[] =null; // 주소 분리를 위한 변수
		String addrBasic =""; // 기본주소
		String addrDetail=""; // 상세 주소 
		try {
			member=service.getMember(id);
			
			if(member.getMemberAddress()!=null && 
					!member.getMemberAddress().trim().contentEquals("")) {
		
				addr =member.getMemberAddress().split("\\*");
				addrBasic =addr[0];
				addrDetail= addr[1];	
			}
			
			// 주소 : 기본 주소 / 상세 주소 분리
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//인자 생성
		request.setAttribute("member", member);
		request.setAttribute("addrBasic", addrBasic);
		request.setAttribute("addrDetail", addrDetail);
		// 주소 : 기본 주소 / 상세 주소 분리
		
		
		//페이지 이동
		returnPath="/member/member_view.jsp";
		RequestDispatcher rd=request.getRequestDispatcher(returnPath);
		rd.forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
