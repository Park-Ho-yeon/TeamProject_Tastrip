package command.member;

import java.security.NoSuchAlgorithmException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.CommonExecute;
import dao.Member_dao;
import dto.Member_dto;

public class MemberLogin implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		Member_dao dao = new Member_dao();
		String msg = "";
		String url = "";
		String id = request.getParameter("t_id");
		String password = request.getParameter("t_password");
		try {
			password = dao.encryptSHA256(password);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		
		Member_dto dto = dao.memberLogin(id, password);
		
		if(dto!=null) {
			msg = dto.getName()+"님 환영합니다.";
			url = "/Index";
			HttpSession session = request.getSession();
			session.setAttribute("sessionId", id);
			session.setAttribute("sessionName", dto.getName());
			session.setAttribute("sessionLevel_code", dto.getLevel_code());
			session.setAttribute("sessionNickname", dto.getNickname());
			session.setAttribute("sessionProfile", dto.getProfile_photo());
			session.setAttribute("sessionApi", dto.getApi());
			session.setMaxInactiveInterval(60*30);
		}else {
			msg = "아이디와 비밀번호를 확인해주세요.";
			url = "/Member";
		}
		
		request.setAttribute("t_msg", msg);
		request.setAttribute("t_url", url);
		
	}

}
