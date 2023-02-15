package command.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.CommonExecute;
import dao.Member_dao;

public class MemberExit implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		Member_dao dao = new Member_dao();
		
		String id = request.getParameter("t_id");
		
		int result = dao.MemberDelect(id);
		
		String msg ="회원삭제 되었습니다.";
//		String url ="/Admin?t_gubun=memberOutList";
		if(result != 1)msg ="회원삭제 실패했습니다!";
		
		request.setAttribute("t_msg",msg);
		request.setAttribute("t_url","/Admin?t_gubun=memberOutList");

	}

}
