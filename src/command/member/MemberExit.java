package command.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.CommonExecute;
import common.CommonUtil;
import dao.Member_dao;

public class MemberExit implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		Member_dao dao = new Member_dao();
		HttpSession session = request.getSession();
		
		String id = request.getParameter("t_id");
		String exit_date = CommonUtil.getToday();
		
		String sessionName = (String)session.getAttribute("sessionName");
		
		int result = dao.MemberExit(id, exit_date);
		
		String msg = sessionName + "님 탈퇴되었습니다.";
		
		session.invalidate();
		
		if(result != 1) {
			msg = "탈퇴에 실패하였습니다.";
		}
		
		request.setAttribute("t_msg", msg);
		request.setAttribute("t_url", "/Index");
		
	}

}
