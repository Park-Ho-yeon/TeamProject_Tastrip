package command.store;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.CommonExecute;
import dao.Store_dao;
import dto.Store_dto;

public class StoreList implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		Store_dao dao = new Store_dao();

		String s_no	= request.getParameter("t_s_no");
		HttpSession session = request.getSession();
		String id	= (String)session.getAttribute("sessionId");
		
		String kg = request.getParameter("t_kg");
		
		if(id == null) id =""; 
		
		String city_name = request.getParameter("t_city");
		String city_code = dao.CodeNameChange("city_tbl", "city_code" , "city_name", city_name);
		
		String local_code = request.getParameter("t_local");
		String local_name = dao.CodeNameChange("local_tbl", "local_name" , "local_code", local_code);
		
		String menu_code = request.getParameter("t_menu_code");
		String menu_name = dao.CodeNameChange("menu_tbl", "menu_name" , "menu_code", menu_code);
		
		String theme_1 = request.getParameter("t_theme_1");
		String theme_2 = request.getParameter("t_theme_2");
		String theme_3 = request.getParameter("t_theme_3");
		
		String keyword = request.getParameter("t_keyword");

//		String pageNum = request.getParameter("pageNum");
		String pageNum = "10";
		String order  = request.getParameter("t_order");
		String[] themes = request.getParameterValues("t_theme");

		if(themes!=null) {
			if(themes.length==1) {
				theme_1 = themes[0];
				theme_2 ="";
				theme_3 ="";
			}else if(themes.length==2) {
				theme_1 = themes[0];
				theme_2 = themes[1];
				theme_3 = "";
			}else if(themes.length==3) {
				theme_1 = themes[0];
				theme_2 = themes[1];
				theme_3 = themes[2];
			}
		}
		
		if(city_name==null) {
			if(kg!=null) {
				city_code ="";
				local_code ="";
				menu_code ="";
				theme_1 ="";
				theme_2 ="";
				theme_3 ="";
				pageNum ="10";
			}else {
				city_code ="";
				local_code ="";
				menu_code ="";
				theme_1 ="";
				theme_2 ="";
				theme_3 ="";
				keyword ="";
				pageNum ="10";
			}
		}
		
		if(order == null || order == "") {
			order  = "TO_NUMBER(s.star) desc";
		}

		String theme_1_name = dao.CodeNameChange("theme_tbl", "theme_name" , "theme_code", theme_1);
		String theme_2_name = dao.CodeNameChange("theme_tbl", "theme_name" , "theme_code", theme_2);
		String theme_3_name = dao.CodeNameChange("theme_tbl", "theme_name" , "theme_code", theme_3);
		
		ArrayList<Store_dto> dtos = dao.StoreList(city_code, local_code, menu_code, keyword, theme_1, theme_2, theme_3, pageNum, order);
		ArrayList<Store_dto> cityDtos = dao.getCityList();
		ArrayList<Store_dto> themeDtos = dao.getThemeList();
		ArrayList<Store_dto> menuDtos = dao.getMenuList();
		ArrayList<Store_dto> favoriteDto = dao.getFavCheck();
		
		int total_count = dao.getListCount(city_code, local_code, menu_code, keyword, theme_1, theme_2, theme_3, pageNum, order);
		
		request.setAttribute("dtos", dtos);
		
		request.setAttribute("cityDtos", cityDtos);
		request.setAttribute("themeDtos",themeDtos);
		request.setAttribute("menuDtos", menuDtos);
		request.setAttribute("f_dto", favoriteDto);
		
		request.setAttribute("city_code",city_code);
		request.setAttribute("city_name",city_name);
		request.setAttribute("local_code",local_code);
		request.setAttribute("local_name",local_name);
		request.setAttribute("menu_code",menu_code);
		request.setAttribute("menu_name",menu_name);
		request.setAttribute("keyword",keyword);
		request.setAttribute("theme_1",theme_1);
		request.setAttribute("theme_2",theme_2);
		request.setAttribute("theme_3",theme_3);
		request.setAttribute("theme_1_name",theme_1_name);
		request.setAttribute("theme_2_name",theme_2_name);
		request.setAttribute("theme_3_name",theme_3_name);
		request.setAttribute("pageNum",pageNum);
		request.setAttribute("order",order);
		request.setAttribute("total_count",total_count);
	}

}
