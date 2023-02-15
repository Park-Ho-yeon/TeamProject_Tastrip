package command.admin;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.CommonExecute;
import common.CommonUtil;
import dao.Store_dao;
import dto.Store_dto;

public class AdminNOStoreList implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		Store_dao dao = new  Store_dao();
		
		
		String t_desc     = request.getParameter("t_desc");
		String list_count = request.getParameter("t_list_count");
		String select 	  = request.getParameter("t_select");
		String search	  = request.getParameter("t_search");
		if(select == null) {
			select = "m.bs_no";
			search ="";
			list_count ="10";
			t_desc  ="s.reg_date desc";
		}
		
		
		/* paging 설정 start*/
		String nowPage = request.getParameter("t_nowPage");
		int current_page = 0; // 현재페이지 번호
		int total_page = 0;    // 전체 페이지 수
		int total_count = dao.getStoreTotalCount("N",select,search); 
		int list_setup_count = Integer.parseInt(list_count);  //한페이지당 출력 행수 =
		int pageNumber_count = 5;  //한페이지당 출력 패이지 갯수
		
		if(nowPage == null || nowPage.equals("")) current_page = 1; 
		else current_page = Integer.parseInt(nowPage);
		
		total_page = total_count / list_setup_count;  // 몫 : 2
		int rest = 	total_count % list_setup_count;   // 나머지:1
		if(rest !=0) total_page = total_page + 1;     // 3
		
		int start = (current_page -1) * list_setup_count + 1;
		int end   = current_page * list_setup_count;
		/* paging 설정 end*/	
		int order = total_count - ((current_page -1) * list_setup_count);
		
		
		//관리자가 아직 허락하진 않은 가게목록
		ArrayList<Store_dto> adminListN = dao.AdminStoreListN(select,search,start,end,t_desc);
		
		String pageDisplay = CommonUtil.pageListPost(current_page, total_page, pageNumber_count);
		
		request.setAttribute("adminListN",adminListN);
		request.setAttribute("select",select);
		request.setAttribute("search",search);
		request.setAttribute("total_count",total_count);
		request.setAttribute("order",order);
		request.setAttribute("pageDisplay",pageDisplay);
		request.setAttribute("list_count", list_count);
		request.setAttribute("t_desc", t_desc);
	}

}
