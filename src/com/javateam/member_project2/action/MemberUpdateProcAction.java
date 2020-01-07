package com.javateam.member_project2.action;

import java.io.IOException;
import java.sql.Date;
 
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
 * Servlet implementation class MemberUpdateProcAction
 */
@WebServlet("/member/member_update_proc.do")
public class MemberUpdateProcAction extends HttpServlet {
    private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberUpdateProcAction() {
        super();
        // TODO Auto-generated constructor stub
    }
 
    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }
 
    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
 
        System.out.println("회원정보 수정 처리");
        boolean flag = false; // 회원정보 수정 성공 여부
        String returnPath = "/result/result.jsp"; // 이동 페이지
        String msg = ""; // 결과 메시지
       
        MemberService service = new MemberServiceImpl();
        MemberVO member = new MemberVO();
        String memberId = request.getParameter("memberId").trim();
       
        // 기존 정보 처리
        try {
            member = service.getMember(memberId);
        } catch (Exception e) {
            e.printStackTrace();
            flag = false;
        }
 
        // 신규 수정 정보 처리
        // 패쓰워드의 경우는 공백일 경우는 기존 패쓰워드 유지, 공백이 아니면 갱신
        String pw = request.getParameter("memberNewPassword").trim().contentEquals("") ?
                    member.getMemberPassword() :
                    request.getParameter("memberNewPassword");
       
        member.setMemberPassword(pw);
        member.setMemberEmail(request.getParameter("memberEmail"));
        member.setMemberPhone(request.getParameter("memberPhone"));
        member.setMemberZip(request.getParameter("memberZip"));
        
        String memberAddressBasic
            = request.getParameter("memberAddressBasic")==null ?
             "" : request.getParameter("memberAddressBasic");
       
        String memberAddressDetail
            = request.getParameter("memberAddressDetail")==null ?
            "" : request.getParameter("memberAddressDetail");
       
        String memberAddress
            = memberAddressBasic.equals("") &&
              memberAddressDetail.equals("") ? "" :
              memberAddressBasic + "*" + memberAddressDetail;        
               
        member.setMemberAddress(memberAddress);
       
        System.out.println("## 수정할 VO : " + member);
               
        //회원 정보 수정 
        try {
			flag=service.updateMember(member);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
        if(flag==false) {
        	returnPath="/result/result.jsp";
        	msg="회원정보 수정에 실패하였습니다.";
        	request.setAttribute("msg", msg);
        } else {
        	returnPath="/result/result.jsp";
        	msg="회원정보 수정에 성공하였습니다.";
        	request.setAttribute("msg", msg);
        	request.setAttribute("movePath", request.getContextPath()+"/member/member_update.do?memberId="+member.getMemberId());
        }
        RequestDispatcher rd = request.getRequestDispatcher(returnPath);
        rd.forward(request, response);
    } //
 
}