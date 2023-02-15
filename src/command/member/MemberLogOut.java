package command.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.CommonExecute;

public class MemberLogOut implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		//Member_dao dao = new Member_dao();
		String msg = "";
		String url = "";
		
		HttpSession session = request.getSession();
		//String id = (String)session.getAttribute("sessionId");
		String name = (String)session.getAttribute("sessionName");
		String nickname = (String)session.getAttribute("sessionNickname");
		
		msg = name+"님 로그아웃 되었습니다.";
		url = "Index";
		
		session.invalidate();
		
		request.setAttribute("t_msg", msg);
		request.setAttribute("t_url", url);
	}

}
