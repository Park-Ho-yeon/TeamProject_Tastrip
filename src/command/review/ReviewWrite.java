package command.review;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.CommonExecute;
import common.CommonUtil;
import dao.Review_dao;
import dto.Store_dto;

public class ReviewWrite implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		Review_dao dao = new Review_dao();
		
		String s_no = request.getParameter("t_s_no");
		
		Store_dto dto = dao.getReviewWrite(s_no);
		
		request.setAttribute("t_s_no", s_no);
		request.setAttribute("t_dto", dto);
		request.setAttribute("t_today", CommonUtil.getToday());
	}

}
