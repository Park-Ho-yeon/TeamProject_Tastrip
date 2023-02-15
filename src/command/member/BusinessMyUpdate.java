package command.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.CommonExecute;
import dao.Member_dao;
import dto.Member_dto;

public class BusinessMyUpdate implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String  msg = "";
		Member_dao memberDao = new Member_dao();
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("sessionId");
		
		String name = request.getParameter("t_name");
		String gender = request.getParameter("t_gender");
		String city = request.getParameter("t_selectCity");
		String email = request.getParameter("t_email");
		String domain = request.getParameter("t_domain");
		String tell_1 = request.getParameter("t_tel1");
		String tell_2 = request.getParameter("t_tel2");
		String tell_3 = request.getParameter("t_tel3");
		
		System.out.println(name+"=="+gender+"=="+city+"=="+email+"=="+domain+"=="+tell_1+"=="+tell_2+"=="+tell_3);
		
		Member_dto dto = new Member_dto(name, gender, city, email, domain, tell_1, tell_2, tell_3);
		
		int result = memberDao.BsmyInfoUpdate(id,dto);
		
		if(result == 1) {
			msg="수정 되었습니다.";
		} else {
			msg="수정 실패했습니다.";
		}
		request.setAttribute("t_msg", msg);
		request.setAttribute("t_url", "/Member");
		request.setAttribute("t_gubun", "b_mypage");
	}

}
