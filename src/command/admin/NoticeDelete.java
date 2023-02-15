package command.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.CommonExecute;
import dao.Notice_dao;

public class NoticeDelete implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		Notice_dao dao = new Notice_dao();
		
		String no = request.getParameter("t_no");
		
		int result = dao.noticeDelete(no);
		
		String msg ="공지사항이 삭제되었습니다.";
		if(result !=1) msg ="공지사항 삭제에 실패하였습니다.";
		
		request.setAttribute("t_msg", msg);
		request.setAttribute("t_url", "/Admin");
		request.setAttribute("t_gubun", "noticeList");
	}

}
