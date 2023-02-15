package command.admin;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.CommonExecute;
import common.CommonUtil;
import dao.Member_dao;
import dao.Review_dao;
import dto.Member_dto;

public class MemberList implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
        Member_dao dao = new Member_dao();
		
		String id =request.getParameter("t_no");
		String select 	  = request.getParameter("t_select");
		String search	  = request.getParameter("t_search");
		String orderby	  = request.getParameter("t_orderby");
		String listCount = request.getParameter("t_list_count");

		if(select == null) {
			select = "m.id";
			search ="";
			listCount ="10";
			orderby ="m.reg_date desc";
		}
		
		/* paging 설정 start*/
		String nowPage = request.getParameter("t_nowPage");
		int current_page = 0; // 현재페이지 번호
		int total_page = 0;    // 전체 페이지 수
		int total_count = dao.getMemberTotalCount("member",select,search); 
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
		
		ArrayList<Member_dto>dtos = dao.memberList(start,end,select,search,orderby);
		
		String pageDisplay = CommonUtil.pageListPost(current_page, total_page, pageNumber_count);

		request.setAttribute("dtos",dtos);
		request.setAttribute("t_select",select);
		request.setAttribute("t_search",search);
		request.setAttribute("total_count",total_count);
		request.setAttribute("order",order);
		request.setAttribute("pageDisplay",pageDisplay);
		request.setAttribute("listCount",listCount);
		request.setAttribute("t_orderby",orderby);
	}

	

}
