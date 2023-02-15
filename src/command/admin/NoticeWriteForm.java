package command.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.CommonExecute;
import common.CommonUtil;
import dao.Notice_dao;
import dto.Notice_dto;

public class NoticeWriteForm implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		Notice_dao dao =new Notice_dao();
		
		String n_no     = dao.getMaxNo();
		String title 	= request.getParameter("t_title");
		String content  = request.getParameter("t_content");
		String reg_date = CommonUtil.getToday();

		HttpSession session =request.getSession();
		String reg_id  = (String)session.getAttribute("sessionId");
		
		Notice_dto dto =new Notice_dto(n_no,title,content,reg_date,reg_id);
		
		int result = dao.writeSave(dto);
		
		String msg ="";
		if(result == 1)msg ="공지사항이 등록되었습니다";
		if(result != 1)msg ="공지사항이 등록 실패 했습니다.";
		
		request.setAttribute("t_msg",msg);
		request.setAttribute("t_url","/Admin");
		request.setAttribute("t_gubun", "noticeList");
		
	}

}
