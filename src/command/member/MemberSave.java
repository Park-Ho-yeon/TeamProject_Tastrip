package command.member;

import java.security.NoSuchAlgorithmException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.CommonExecute;
import common.CommonUtil;
import dao.Member_dao;
import dto.Member_dto;

public class MemberSave implements CommonExecute {

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
		String name = request.getParameter("t_name");
		
//		String year = request.getParameter("t_year");
//		String monSelect = request.getParameter("t_monSelect");
//		if(monSelect.length()==1) {
//			monSelect="0"+monSelect;
//		}
//		String dateSelect = request.getParameter("t_dateSelect");
//		if(dateSelect.length()==1) {
//			dateSelect="0"+dateSelect;
//		}
//		String birth = year+monSelect+dateSelect;
		
		String birth = request.getParameter("t_birth");
		String gender = request.getParameter("t_gender");
		String citySelect = request.getParameter("t_city_code");
		String email = request.getParameter("t_email");
		String domain = request.getParameter("t_domain");
		String tel1 = request.getParameter("t_tel1");
		String tel2 = request.getParameter("t_tel2");
		String tel3 = request.getParameter("t_tel3");
		String photo = request.getParameter("t_ori_photo");
		if(photo.equals("")) photo= "default_profile.png";
		String reg_date = CommonUtil.getToday();
		String nickname = request.getParameter("t_nickname");
		
		
		Member_dto memberDto = new Member_dto(id, password, name, birth , gender,
				citySelect, email, domain, tel1, tel2, tel3, photo, reg_date, nickname);
		memberDto.setApi("");
		int result = dao.memberSave(memberDto);
		
		if(result == 1) {
			
			msg = "회원가입이 되었습니다.";
			url = "Index";
		}else {
			msg = "회원가입 실패하였습니다.";
			url = "Index";
		}
		request.setAttribute("t_msg", msg);
		request.setAttribute("t_url", url);
		request.setAttribute("memberDto", memberDto);
	}

}
