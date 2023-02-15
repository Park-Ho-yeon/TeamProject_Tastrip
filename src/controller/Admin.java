package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import command.admin.AdminBsInfo;
import command.admin.AdminNOStoreList;
import command.admin.AdminStoreList;
import command.admin.AdminStoreOpen;
import command.admin.AdminStoreView;
import command.admin.BusinessList;
import command.admin.MemberList;
import command.admin.MemberOutList;
import command.admin.NoticeDelete;
import command.admin.NoticeList;
import command.admin.NoticeUpdate;
import command.admin.NoticeUpdateForm;
import command.admin.NoticeView;
import command.admin.NoticeWriteForm;
import common.CommonExecute;
import common.CommonUtil;

/**
 * Servlet implementation class Admin
 */
@WebServlet("/Admin")
public class Admin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Admin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		String level = (String)session.getAttribute("sessionLevel_code");
		if(level==null) level="";

		String gubun = request.getParameter("t_gubun");
		if(gubun==null) gubun="memberList";
		request.setAttribute("t_gubun", gubun);

		String viewPage = "";
		
		if(!level.equals("admin")) {
			request.setAttribute("t_msg", "관리자 전용 화면입니다.");
			request.setAttribute("t_url", "/Index");
			viewPage="/common_alert_page.jsp";
		}else{
			
			//일반회원 목록
			if(gubun.equals("memberList")) {
				CommonExecute memberList = new MemberList();
				memberList.execute(request, response);
				viewPage="/admin/admin_member_list.jsp";
				
			//사업자회원 목록
			}else if(gubun.equals("businessList")) {
				CommonExecute businessList = new BusinessList();
				businessList.execute(request, response);
				viewPage="/admin/admin_business_list.jsp";
				
			//탈퇴회원 목록
			}else if(gubun.equals("memberOutList")) {
				CommonExecute memberOutList = new MemberOutList();
				memberOutList.execute(request, response);
				viewPage="/admin/admin_member_out_list.jsp";
				
			//요청가게목록
			}else if(gubun.equals("requestList")) {
				CommonExecute admin = new AdminNOStoreList();
				admin.execute(request, response);
				viewPage="/admin/admin_request_list.jsp";
				
			//가게목록
			}else if(gubun.equals("storeList")) {
				CommonExecute admin = new AdminStoreList();
				admin.execute(request, response);
				viewPage="/admin/admin_store_list.jsp";
				
			//공지사항 목록
			}else if(gubun.equals("noticeList")) {
				CommonExecute admin = new NoticeList();
				admin.execute(request, response);
				viewPage="/admin/admin_notice_list.jsp";
				
			//공지사항 작성폼
			}else if(gubun.equals("noticeWrite")) {
				String Today =CommonUtil.getToday();
				request.setAttribute("t_today",Today);
				viewPage="/admin/admin_notice_write.jsp";
				
			//공지사항 저장
			}else if(gubun.equals("noticeSave")) {
				CommonExecute admin = new NoticeWriteForm();
				admin.execute(request, response);
				viewPage="/common_alert_page_mypage.jsp";
				
			//공지사항 상세
			}else if(gubun.equals("noticeView")) {
				CommonExecute admin = new NoticeView();
				admin.execute(request, response);
				viewPage ="/admin/admin_notice_view.jsp";
				
			//공지사항 수정폼
			}else if(gubun.equals("noticeUpdateForm")) {
				CommonExecute admin = new NoticeUpdateForm();
				admin.execute(request, response);
				viewPage="/admin/admin_notice_updateForm.jsp";
				
			//공지사항 업데이트
			}else if(gubun.equals("noticeUpdate")) {
				CommonExecute admin = new NoticeUpdate();
				admin.execute(request, response);
				viewPage="/common_alert_page_mypage.jsp";
				
			//공지사항 삭제
			}else if(gubun.equals("noticeDelete")) {
				CommonExecute admin = new NoticeDelete();
				admin.execute(request, response);
				viewPage="/common_alert_page_mypage.jsp";
				
			//등록요청 가게 정보보기
			}else if(gubun.equals("AdminStoreView")) {
				CommonExecute admin = new AdminStoreView();
				admin.execute(request, response);
				viewPage="/admin/admin_request_store_view.jsp";
			
			//사업자 정보 상세
			}else if(gubun.equals("AdminBsInfo")) {
				CommonExecute admin = new AdminBsInfo();
				admin.execute(request, response);
				viewPage="/admin/admin_business_info.jsp";
			
			}else if(gubun.equals("adminOpenCheck")) {
				CommonExecute admin = new AdminStoreOpen();
				admin.execute(request, response);
				viewPage = "/common_alert_page_mypage.jsp";
			}
			
		}
		
		
		RequestDispatcher rd = request.getRequestDispatcher(viewPage);
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
