package command.member;

import java.security.NoSuchAlgorithmException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.CommonExecute;
import common.CommonUtil;
import dao.Member_dao;
import dao.Store_dao;
import dto.Member_dto;
import dto.Store_dto;

public class BusinessSave implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		Member_dao memberDao = new Member_dao();
		Store_dao storeDao = new Store_dao();
			
		//멤버
		String id = request.getParameter("t_id");
		String password = request.getParameter("t_password");
		try {
			password = memberDao.encryptSHA256(password);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		String name = request.getParameter("t_name");
		String birth = request.getParameter("t_birth");
		String gender = request.getParameter("t_gender");
		String city = request.getParameter("t_city");
		city = storeDao.CodeNameChange("city_tbl", "city_code", "city_name", city);
		String email = request.getParameter("t_email1");
		String domain = request.getParameter("t_email2");
		String tel1 = request.getParameter("t_tel1");
		String tel2 = request.getParameter("t_tel2");
		String tel3 = request.getParameter("t_tel3");
		String reg_date = CommonUtil.getToday();
		String bs = request.getParameter("t_bs_no");

		//스토어
		String s_no = storeDao.getMaxNo();
		String s_name = request.getParameter("t_s_name");
		String s_city_code = request.getParameter("t_s_city");
		String s_local_code = request.getParameter("t_s_local");
		String address = request.getParameter("t_s_address");
		String x_code = request.getParameter("x_code");
		String y_code = request.getParameter("y_code");
		String s_time = request.getParameter("t_s_time");
		String s_tell = request.getParameter("t_s_tell");
		String s_content = request.getParameter("t_s_content");
		s_content = s_content.replace("'", "''");
		String s_menu_code = request.getParameter("t_menu_code");
		String s_menu_name_1 = request.getParameter("t_s_menu_name_1");
		String s_menu_name_2 = request.getParameter("t_s_menu_name_2");
		String s_menu_name_3 = request.getParameter("t_s_menu_name_3");
		String s_menu_name_4 = request.getParameter("t_s_menu_name_4");
		String s_menu_name_5 = request.getParameter("t_s_menu_name_5");
		String s_menu_price_1 = request.getParameter("t_s_menu_price_1");
		String s_menu_price_2 = request.getParameter("t_s_menu_price_2");
		String s_menu_price_3 = request.getParameter("t_s_menu_price_3");
		String s_menu_price_4 = request.getParameter("t_s_menu_price_4");
		String s_menu_price_5 = request.getParameter("t_s_menu_price_5");
		String[] attach = request.getParameterValues("t_attach");
		String theme_1 = request.getParameter("t_theme_1");
		String theme_2 = request.getParameter("t_theme_2");
		String theme_3 = request.getParameter("t_theme_3");
		String attach_1="";
		String attach_2="";
		String attach_3="";
		String attach_4="";
		String attach_5="";
		
		if(attach.length==5) {
			attach_1=attach[0];
			attach_2=attach[1];
			attach_3=attach[2];
			attach_4=attach[3];
			attach_5=attach[4];
			
		}else if(attach.length==4){
			attach_1=attach[0];
			attach_2=attach[1];
			attach_3=attach[2];
			attach_4=attach[3];
			
		}else if(attach.length==3){
			attach_1=attach[0];
			attach_2=attach[1];
			attach_3=attach[2];
			
		}else if(attach.length==2){
			attach_1=attach[0];
			attach_2=attach[1];
			
		}else if(attach.length==1){
			attach_1=attach[0];
		}
		
		
		
		//멤버  dto
		Member_dto memberDto = new Member_dto(id, password, name, birth, gender, city, email, domain, tel1, tel2, tel3, reg_date, bs);
		//가게정보 dto
		Store_dto storeDto = new Store_dto(s_no, s_name, s_city_code, s_local_code, s_menu_code, theme_1, theme_2, theme_3, address, x_code, y_code, s_content, s_tell,
				s_time, s_menu_name_1, s_menu_price_1, s_menu_name_2, s_menu_price_2, s_menu_name_3,
				s_menu_price_3, s_menu_name_4, s_menu_price_4, s_menu_name_5, s_menu_price_5, attach_1, attach_2, attach_3, attach_4, attach_5,reg_date,id);
		
		int m_result = memberDao.businessSave(memberDto);
		int s_result = storeDao.storeSave(storeDto);
		
		String msg ="회원가입되셨습니다! 입력해주신 가게정보는 관리자 검토 후 등록될 예정입니다.";
		if(m_result!=1 || s_result!=1) {
			msg="등록에 오류가 발생하였습니다.";
		}
		
		request.setAttribute("t_msg", msg);
		request.setAttribute("t_url", "/Index");
		
		
	}

}
