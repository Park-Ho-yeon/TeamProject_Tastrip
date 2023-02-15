package command.member;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.swing.internal.plaf.metal.resources.metal;

import common.CommonExecute;
import common.CommonUtil;
import dao.Member_dao;
import dao.Store_dao;
import dto.Member_dto;
import dto.Store_dto;

public class BusinessJoinStep3 implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		Store_dao storeDao = new Store_dao();
		Member_dao memberDao = new Member_dao();
		
		String id = request.getParameter("t_id");
		String password = request.getParameter("t_password");
//		String password_confirm = request.getParameter("t_password_confirm");
		String name = request.getParameter("t_name");
		String year = request.getParameter("t_year");
		String monSelect = request.getParameter("t_monSelect");
		String dateSelect = request.getParameter("t_dateSelect");
		String birth = year+monSelect+dateSelect;
		String gender = request.getParameter("t_gender");
		String city = request.getParameter("t_city");
		String email = request.getParameter("t_email");
		String domain = request.getParameter("t_domain");
		String tel1 = request.getParameter("t_tel1");
		String tel2 = request.getParameter("t_tel2");
		String tel3 = request.getParameter("t_tel3");
		String reg_date = CommonUtil.getToday();
		String bs1 = request.getParameter("t_bs1");
		String bs2 = request.getParameter("t_bs2");
		String bs3 = request.getParameter("t_bs3");
		Member_dto dto = new Member_dto(id, password, name, birth, gender, city, email, domain, tel1, tel2, tel3, reg_date, "");
		
		ArrayList<Store_dto> menu = storeDao.getMenuList();
		ArrayList<Store_dto> theme = storeDao.getThemeList();
		ArrayList<Store_dto> city_2	= storeDao.getCityList();
		ArrayList<Store_dto> local	= storeDao.getLocalList();
		
		request.setAttribute("t_memberDto", dto);
		request.setAttribute("t_menuDto", menu);
		request.setAttribute("t_themeDto", theme);
		request.setAttribute("t_cityDto", city_2);
		request.setAttribute("t_localDto", local);
		request.setAttribute("t_year", year);
		request.setAttribute("t_monSelect", monSelect);
		request.setAttribute("t_dateSelect", dateSelect);
		request.setAttribute("t_bs1", bs1);
		request.setAttribute("t_bs2", bs2);
		request.setAttribute("t_bs3", bs3);
		
		
	}

}
