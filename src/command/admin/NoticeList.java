package command.admin;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.CommonExecute;
import common.CommonUtil;
import dao.Notice_dao;
import dto.Notice_dto;

public class NoticeList implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		Notice_dao dao = new Notice_dao();
		String select = request.getParameter("t_select");
		String search = request.getParameter("t_search");
		String listCount = request.getParameter("t_list_count");
		String listorder = request.getParameter("t_list_order");
		if(select ==null) {
			select ="title";
			search ="";
			listCount ="5";
			listorder ="reg_date desc,a.n_no desc";
		}
		
		/* paging 설정 start*/
		String nowPage = request.getParameter("t_nowPage");
		int current_page = 0; // 현재페이지 번호
		int total_page = 0;    // 전체 페이지 수
		int total_count = dao.getTotalCount(select,search); 
		int list_setup_count = Integer.parseInt(listCount);  //한페이지당 출력 행수 =
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
		
		ArrayList<Notice_dto> notice =dao.adminNotice(select,search,start,end,listorder);
		
		
		String pageDisplay = CommonUtil.pageListPost(current_page, total_page, pageNumber_count);
		
		request.setAttribute("t_notice",notice);
		request.setAttribute("order",order);
		request.setAttribute("pageDisplay", pageDisplay);
		request.setAttribute("search",search);
		request.setAttribute("select",select);
		request.setAttribute("listCount",listCount);
		request.setAttribute("listorder",listorder);
	}

}
