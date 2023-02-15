package command.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.CommonExecute;
import common.CommonUtil;
import dao.Notice_dao;
import dto.Notice_dto;

public class NoticeUpdate implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		Notice_dao dao = new Notice_dao();
		
		String no = request.getParameter("t_no");
		String title = request.getParameter("t_title");
		String content = request.getParameter("t_content");
		String reg_date = request.getParameter("t_date");
		String reg_id	= request.getParameter("t_id");
		
		Notice_dto dto = new Notice_dto(no, title, content, reg_date, reg_id);
		
		int result = dao.noticeUpdate(dto);
		
		String msg ="공지사항이 수정되었습니다.";
		if(result !=1) msg ="공지사항 수정에 실패하였습니다.";
		
		request.setAttribute("t_msg", msg);
		request.setAttribute("t_url", "/Admin");
		request.setAttribute("t_gubun", "noticeList");
	}

}
