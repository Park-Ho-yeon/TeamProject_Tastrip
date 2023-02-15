package command.member;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.CommonExecute;
import common.CommonUtil;
import dao.Review_dao;
import dto.Review_dto;

public class MemberReview implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		Review_dao dao = new Review_dao();
		
		HttpSession session= request.getSession();
		String reg_id = (String)session.getAttribute("sessionId");
		String select = request.getParameter("t_select");
		String search = request.getParameter("t_search");
		String sequence = request.getParameter("sequence");
		String listCount = request.getParameter("t_list_count");
		
		if(select == null) {	
			select ="s.s_name";
			search="";
			sequence ="reg_date desc";
			listCount ="5";
		}
		
		/* paging 설정 start*/
		String nowPage = request.getParameter("t_nowPage");
		int current_page = 0; // 현재페이지 번호
		int total_page = 0;    // 전체 페이지 수
		int total_count = dao.getReviewTotalCount(reg_id,select,search); 
		int list_setup_count = Integer.parseInt(listCount);  //한페이지당 출력 행수 =
		int pageNumber_count = 3;  //한페이지당 출력 패이지 갯수
		
		if(nowPage == null || nowPage.equals("")) current_page = 1; 
		else current_page = Integer.parseInt(nowPage);
		
		total_page = total_count / list_setup_count;  // 몫 : 2
		int rest = 	total_count % list_setup_count;   // 나머지:1
		if(rest !=0) total_page = total_page + 1;     // 3
		
		int start = (current_page -1) * list_setup_count + 1;
		int end   = current_page * list_setup_count;
		/* paging 설정 end*/	
		int order = total_count - ((current_page -1) * list_setup_count);
		
		ArrayList<Review_dto> dtos = dao.MemberReview(reg_id,select,search,sequence,start,end);
		
		String pageDisplay = CommonUtil.pageListPost(current_page, total_page, pageNumber_count);
		
		request.setAttribute("t_dtos", dtos);
		request.setAttribute("select", select);
		request.setAttribute("search", search);
		request.setAttribute("sequence", sequence);
		request.setAttribute("pageDisplay", pageDisplay);
		request.setAttribute("listCount",listCount);
		request.setAttribute("total_count",total_count);
		
	}

}
