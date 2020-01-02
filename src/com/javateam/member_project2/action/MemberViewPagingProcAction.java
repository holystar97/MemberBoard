package com.javateam.member_project2.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javatea.member_project2.dao.MemberDAO;
import com.javatea.member_project2.dao.MemberDAOImpl;
import com.javatea.member_project2.domain.MemberVO;
import com.javatea.member_project2.domain.PageVO;
import com.javatea.member_project2.service.MemberService;
import com.javatea.member_project2.service.MemberServiceImpl;

/**
 * Servlet implementation class MemberViewPagingProcAction
 */
@WebServlet("/member/viewPaging.do")
public class MemberViewPagingProcAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberViewPagingProcAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		System.out.println("회원정보 조회(페이징)");
	       
	        int page = request.getParameter("page")==null ? 1 : new Integer(request.getParameter("page"));
	        // int limit = request.getParameter("limit")==null? 10 : new Integer(request.getParameter("limit"));
	        int limit = 10; // 한 페이지에 표현될 수 있는 인원수
	       
	        MemberService service = new MemberServiceImpl();
	        List<MemberVO> members = null;
			try {
				members = service.getAllMembersByPaging(page, limit);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	               
	        // request.setAttribute("members", members);
	        // request.setAttribute("page", page);
	        // request.setAttribute("limit", limit);
	       
	        ////////////////////////////////////////////////////////////
	       
	        int membersNum=0;
			try {
				membersNum = service.getAllMembers().size();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	        int listCount = members.size();
	       
	        // 총 페이지 수
	        int maxPage = (int)((double)membersNum/10+0.95); //0.95를 더해서 올림 처리
	        // 현재 페이지에 보여줄 시작 페이지 수 (1, 11, 21,...)
	        int startPage = (((int) ((double)page/10 + 0.9)) - 1) * 10 + 1;
	        // 현재 페이지에 보여줄 마지막 페이지 수(10, 20, 30, ...)
	        int endPage = startPage + 10 - 1;
	       
	        System.out.println("startPage : "+startPage);
	        System.out.println("endPage : "+endPage);
	       
	        if (endPage > maxPage) endPage = maxPage;
	       
	        PageVO pageVO = new PageVO();
	        pageVO.setMaxPage(maxPage);
	        pageVO.setPage(page);
	        pageVO.setStartPage(startPage);
	        pageVO.setEndPage(endPage);
	        pageVO.setListCount(listCount);
	       
	        // 전송 인자  
	        request.setAttribute("pageVO", pageVO);
	        request.setAttribute("members", members);
	        request.setAttribute("limit", limit);
		
	        
	        RequestDispatcher rd=request.getRequestDispatcher("/member/viewPaging.jsp?page="+page);
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
