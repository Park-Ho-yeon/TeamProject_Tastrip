package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import command.member.BusinessJoinStep3;
import command.member.BusinessJoinStep4;
import command.member.BusinessMypage;
import command.member.BusinessMyUpdateForm;
import command.member.BusinessSave;
import command.member.BusinessStoreAdd;
import command.member.BusinessStoreAddForm;
import command.member.BusinessStoreView;
import command.member.BusinessStoreUpdate;
import command.member.BusinessStoreUpdateForm;
import command.member.BusinessMyUpdate;
import command.member.MemberExit;
import command.member.MemberFavorite;
import command.member.MemberJoinStep2;
import command.member.MemberJoinStep3;
import command.member.MemberLogOut;
import command.member.MemberLogin;
import command.member.MemberMyinfo;
import command.member.MemberReview;
import command.member.MemberSave;
import command.member.MemberUpdate;
import command.member.MemberUpdateForm;
import command.member.NaverLogin;
import common.CommonExecute;
import dao.Store_dao;
import dto.Store_dto;

/**
 * Servlet implementation class Member
 */
@WebServlet("/Member")
@MultipartConfig(
	    fileSizeThreshold = 1024*1024,
	    maxFileSize = 1024*1024*50, //50메가
	    maxRequestSize = 1024*1024*50*5 // 50메가 5개까지
	)
public class Member extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Member() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String gubun = request.getParameter("t_gubun");
		request.setAttribute("t_gubun", gubun);
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("sessionId");
		String level = (String) session.getAttribute("sessionLevel_code");
		
		if(level==null) level="";
		if(level.equals("business")) {
			Store_dao dao = new Store_dao();
			ArrayList<Store_dto> myStore = dao.myStoreList(id);
			ArrayList<Store_dto> waitStore = dao.waitStoreList(id);
			ArrayList<Store_dto> closeStore = dao.closeStoreList(id);
			request.setAttribute("t_myStore", myStore);
			request.setAttribute("t_waitStore", waitStore);
			request.setAttribute("t_closeStore", closeStore); 
			if(myStore.size()!=0) {
				request.setAttribute("rep_no", myStore.get(0).getS_no()); 				
			}else {
				if(waitStore.size()!=0) {
					request.setAttribute("rep_no", waitStore.get(0).getS_no()); 								
				}else {
					request.setAttribute("rep_no", closeStore.get(0).getS_no()); 													
				}
			}
			
		}
		
		String viewPage = "";
		if(gubun==null) gubun="login";
		
		//로그인화면
		if(gubun.equals("login")) {
			viewPage="/member/member_login.jsp";
		
		//로그인DB연결
		}else if(gubun.equals("DBMemberLogin")) {
			CommonExecute mem = new MemberLogin();
			mem.execute(request, response);
			viewPage="/common_alert_page.jsp";
		
		//로그아웃
		}else if(gubun.equals("logout")) {
			CommonExecute mem = new MemberLogOut();
			mem.execute(request, response);
			viewPage="/common_alert_page.jsp";
		
		//일반멤버 회원가입 - STEP1
		}else if(gubun.equals("step1")) {
			viewPage="/member/member_memberstep1.jsp";
			
		//일반멤버 회원가입 - STEP2	
		}else if(gubun.equals("step2")) { 
			CommonExecute mem = new MemberJoinStep2();
			mem.execute(request, response);
			viewPage="/member/member_memberstep2.jsp";
		
		//일반멤버 회원가입 - STEP3
		}else if(gubun.equals("step3")) {
			CommonExecute mem = new MemberJoinStep3();
			mem.execute(request, response);
			viewPage="/member/member_memberstep3.jsp";
			
		//일반멤버 회원가입 DB저장
		}else if(gubun.equals("memberSave")) { 
			CommonExecute mem = new MemberSave();
			mem.execute(request, response);
			viewPage="/common_alert_page.jsp";
		
		//회원가입 선택창
		}else if(gubun.equals("join")) {
			viewPage="/member/member_join.jsp";
		
		//마이페이지
		}else if(gubun.equals("mypage")) {
			CommonExecute mem = new MemberMyinfo();
			mem.execute(request, response);
			viewPage="/member/member_mypage.jsp";
		
		//업데이트폼
		}else if(gubun.equals("updateForm")) {
			CommonExecute mem = new MemberUpdateForm();
			mem.execute(request, response);
			viewPage="/member/member_my_update.jsp";

		//업데이트 저장
		}else if(gubun.equals("update")) {
			CommonExecute mem = new MemberUpdate();
			mem.execute(request, response);
			viewPage="/common_alert_page.jsp";
		
		//일반멤버 탈퇴
		}else if(gubun.equals("Exit")) {
			CommonExecute mem = new MemberExit();
			mem.execute(request, response);
			viewPage = "/common_alert_page.jsp";
				
		//일반멤버 - 관심가게
		}else if(gubun.equals("favorite")) {
			CommonExecute mem = new MemberFavorite();
			mem.execute(request, response);
			viewPage="/member/member_favorite.jsp";
		
		//일반멤버 - 내가쓴리뷰
		}else if(gubun.equals("review")) {
			CommonExecute mem = new MemberReview();
			mem.execute(request, response);
			viewPage="/member/member_review.jsp";
		
		//사업자 회원가입 - STEP1
		}else if(gubun.equals("bussinessStep1")) {
			viewPage="/member/member_member_Business_Step1.jsp";
		
		//사업자 회원가입 - STEP2
		}else if(gubun.equals("bussinessStep2")) {
			Store_dao storeDao = new Store_dao();
			ArrayList<Store_dto> city = storeDao.getCityList();
			request.setAttribute("t_cityDto", city);
			viewPage="/member/member_member_Business_Step2.jsp";
		
		//사업자 회원가입 - STEP3
		}else if(gubun.equals("bussinessStep3")) {
			CommonExecute mem = new BusinessJoinStep3();
			mem.execute(request, response);
			viewPage="/member/member_member_Business_Step3.jsp";
		
		//사업자 회원가입 - STEP4
		}else if(gubun.equals("bussinessStep4")) {
			CommonExecute mem = new BusinessJoinStep4();
			mem.execute(request, response);
			viewPage="/member/member_member_Business_Step4.jsp";
		
		//사업자 회원가입 DB저장
		}else if(gubun.equals("businessSave")) {
			CommonExecute mem = new BusinessSave();
			mem.execute(request, response);
			viewPage="/common_alert_page.jsp";
			
		//사업자 - 내정보	
		}else if(gubun.equals("b_mypage")) {
			CommonExecute mem = new BusinessMypage();
			mem.execute(request, response);
			
			viewPage="/business/business_mypage.jsp";
		
		//사업자 - 내정보 수정 폼
		}else if(gubun.equals("b_myupdate")) {
			CommonExecute mem = new BusinessMyUpdateForm();
			mem.execute(request, response);
			viewPage="/business/business_my_update.jsp";
			
		//사업자 - 내정보 수정
		}else if(gubun.equals("b_mypage_update")) {
			CommonExecute mem = new BusinessMyUpdate();
			mem.execute(request, response);
			viewPage="/common_alert_page_mypage.jsp";
			
		//사업자 - 가게 정보
		}else if(gubun.equals("b_mystore")) {
			CommonExecute mem = new BusinessStoreView();
			mem.execute(request, response);
			viewPage="/business/business_mystore.jsp";
		
		//사업자 - 가게 수정
		}else if(gubun.equals("b_storeUpdate")) {
			CommonExecute member = new BusinessStoreUpdateForm();
			member.execute(request, response);
			viewPage="/business/business_store_update.jsp";
			
		//사업자 - 가게 수정 저장
		}else if(gubun.equals("b_DBupdate")) {
			CommonExecute member = new BusinessStoreUpdate();
			member.execute(request, response);
			viewPage="/common_alert_page_mypage.jsp";	
			
		//사업자 - 가게 등록
		}else if(gubun.equals("b_storeWrite")) {
			CommonExecute member = new BusinessStoreAddForm();
			member.execute(request, response);
			viewPage="/business/business_store_write.jsp";
			
		//사업자 - 가게 추가 등록
		}else if(gubun.equals("b_storeAddSave")) {
			CommonExecute member = new BusinessStoreAdd();
			member.execute(request, response);
			viewPage="/common_alert_page_mypage.jsp";
		
		//네이버 로그인 DB 저장
		}else if(gubun.equals("Naver")){
			NaverLogin naver = new NaverLogin();
			naver.execute(request, response);
			
			viewPage = "/common_alert_page.jsp";
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
