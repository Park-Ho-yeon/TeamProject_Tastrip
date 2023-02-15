package command.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.CommonExecute;
import common.CommonUtil;
import dao.Notice_dao;
import dto.Notice_dto;

public class NoticeUpdateForm implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		Notice_dao dao = new Notice_dao();
		
		String no = request.getParameter("t_no");
		String page_type = "updateForm";
		HttpSession session = request.getSession();
		String sessionId	=(String)session.getAttribute("sessionId");
		String today		= CommonUtil.getToday();
		
		Notice_dto dto = dao.noticeView(no, page_type);
		
		request.setAttribute("t_dto", dto);
		request.setAttribute("sessionId", sessionId);
		request.setAttribute("today", today);	
		request.setAttribute("t_no", no);
	}

}
