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
 * Servlet implementation class MemberUpdateAction
 */
@WebServlet("/member/member_update.do")
public class MemberUpdateAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberUpdateAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("회원정보 수정");
		String msg=""; // 메시지
		String returnPath =""; // 이동 페이지 
		if (request.getParameter("memberId")==null || request.getParameter("memberId").trim().contentEquals("")) {
					msg="아이디를 입력하시오";
					request.setAttribute("msg", msg);
					returnPath="/result/result.jsp";
		}else {
			String memberId= request.getParameter("memberId").trim();
			//회원 여부를 점검 
			MemberService service =new MemberServiceImpl();
			boolean flag=false;
			try {
			flag=service.isMember(memberId);
			}catch(Exception e) {
				e.printStackTrace();
			}
			if(flag==true) { // 회원이면..
				// 기존 정보 불러오기 
				MemberVO member =null;
				try {
				member=service.getMember(memberId);
				}catch(Exception e) {
					e.printStackTrace();
				}
				
				request.setAttribute("member", member);
				returnPath ="/member/member_update.jsp";
				
			}else {
				
				msg="회원이 아닙니다."; // 추후 ) 로그인 페이지로 이동 
				request.setAttribute("msg", msg);
				returnPath="/result/result.jsp";
				
			}
		}
		RequestDispatcher rd= request.getRequestDispatcher(returnPath);
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
