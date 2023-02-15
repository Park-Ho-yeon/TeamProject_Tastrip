package command.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.CommonExecute;
import dao.Member_dao;
import dto.Member_dto;

public class MemberMyinfo implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		Member_dao dao = new Member_dao();
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("sessionId");
		
		Member_dto memberDto = dao.myInfo(id);
		
		
		request.setAttribute("t_memberDto", memberDto);
			
	}

}
