package command.store;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.CommonExecute;
import dao.Review_dao;
import dao.Store_dao;
import dto.Review_dto;
import dto.Store_dto;

public class StoreView implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		Store_dao sdao = new Store_dao();
		Review_dao rdao = new Review_dao();
		
		String s_no = request.getParameter("t_s_no");
		String about = request.getParameter("t_star");
		String order = request.getParameter("t_desc");
		String scroll = request.getParameter("t_scroll");
		HttpSession session = request.getSession();
		String id	= (String)session.getAttribute("sessionId");
		String pageNum = "5";
		
		if(about==null) {
			about="a.r_no";
			order="desc";
			scroll="";
			pageNum="5";
		}
		
		Store_dto sdto = sdao.getStoreView(s_no,"view");
		ArrayList<Review_dto> rdtos = rdao.getStoreReviewList(s_no, about, order, pageNum);
		ArrayList<Store_dto> favoriteDto = sdao.getFavCheck();
		ArrayList<String> storeImg = sdao.getImageList(s_no);
		int total_count = rdao.getReviewCount(s_no);
		
		request.setAttribute("t_sdto", sdto);
		request.setAttribute("t_rdtos", rdtos);
		request.setAttribute("f_dto", favoriteDto);
		request.setAttribute("storeImg", storeImg);

		request.setAttribute("t_s_no", s_no);
		request.setAttribute("t_scroll", scroll);
		request.setAttribute("order", order);
		request.setAttribute("about", about);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("total_count", total_count);
	}

}
