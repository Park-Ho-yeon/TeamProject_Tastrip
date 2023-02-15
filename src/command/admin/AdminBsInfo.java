package command.admin;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.CommonExecute;
import dao.Member_dao;
import dao.Store_dao;
import dto.Member_dto;
import dto.Store_dto;

public class AdminBsInfo implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		Member_dao memberDao = new Member_dao();
		Store_dao storeDao = new Store_dao();

		String id = request.getParameter("t_id");

		ArrayList<Store_dto> myStore = storeDao.myStoreList(id);
		ArrayList<Store_dto> waitStore = storeDao.waitStoreList(id);
		ArrayList<Store_dto> closeStore = storeDao.closeStoreList(id);
		
		Member_dto memberDto = memberDao.BsmyInfo(id);
		String city_name = storeDao.CodeNameChange("city_tbl", "city_name", "city_code", memberDto.getCity_code());
		
		request.setAttribute("t_id", id);
		request.setAttribute("t_memberDto", memberDto);
		request.setAttribute("t_city_name", city_name);
		request.setAttribute("t_myStore", myStore);
		request.setAttribute("t_waitStore", waitStore);
		request.setAttribute("t_closeStore", closeStore);
	}

}
