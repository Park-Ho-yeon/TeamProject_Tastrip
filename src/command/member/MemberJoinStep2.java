package command.member;

import java.io.File;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.CommonExecute;
import common.CommonUtil;
import dao.Store_dao;
import dto.Member_dto;
import dto.Store_dto;

public class MemberJoinStep2 implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		Store_dao cityDao = new Store_dao();
		Store_dao localDao = new Store_dao();
		
		//String profileDir = CommonUtil.getFile_dir_profile();
		
		Store_dao storeDao = new Store_dao();
		Member_dto memberDto = null;
		String id = request.getParameter("t_id");
			if(id!=null) {
				String password = request.getParameter("t_password");
				String password_confirm = request.getParameter("t_password_confirm");
				String name = request.getParameter("t_name");
				String year = request.getParameter("t_year");
				String monSelect = request.getParameter("t_monSelect");
				if(monSelect.length()==1) {
					monSelect="0"+monSelect;
				}
				String dateSelect = request.getParameter("t_dateSelect");
				if(dateSelect.length()==1) {
					dateSelect="0"+dateSelect;
				}
				String birth = year+monSelect+dateSelect;
				String gender = request.getParameter("t_gender");
				String citySelect = request.getParameter("t_city_code");
				String email = request.getParameter("t_email");
				String domain = request.getParameter("t_domain");
				String tel1 = request.getParameter("t_tel1");
				String tel2 = request.getParameter("t_tel2");
				String tel3 = request.getParameter("t_tel3");
					
				String photo = request.getParameter("t_fileName");
				if(photo!="") photo = id+"_"+photo;
				else photo="default_profile.png";
				
				String ori_photo = request.getParameter("t_ori_photo");
				/*
				 * if(!photo.equals("default_profile.png")) { File file = new
				 * File(profileDir,photo); file.delete(); }
				 */
				String reg_date = CommonUtil.getToday();
				String nickname = request.getParameter("t_nickname");
				
				String city_name = storeDao.CodeNameChange("city_tbl", "city_name", "city_code", citySelect);
				
				memberDto = new Member_dto(id, password, name, birth , gender,
					citySelect, email, domain, tel1, tel2, tel3, photo, reg_date, nickname);
					
				request.setAttribute("t_memberDto", memberDto);
				request.setAttribute("t_year", year);
				request.setAttribute("t_monSelect", monSelect);
				request.setAttribute("t_dateSelect", dateSelect);
				request.setAttribute("t_password_confirm", password_confirm);
				request.setAttribute("t_city_name", city_name);
				request.setAttribute("t_ori_photo", ori_photo);
			}else {
					memberDto = new Member_dto("", "", "", "" , "",
						"", "", "", "", "", "", "", "", "");
			}
		
		
		
		
		ArrayList<Store_dto> cityDto = cityDao.getCityList();
		ArrayList<Store_dto> localDto = localDao.getLocalList();
		
		request.setAttribute("t_memberDto", memberDto);
		request.setAttribute("t_cityDto", cityDto);
		request.setAttribute("t_localDto", localDto);
	}
}
