package command.member;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import common.CommonExecute;
import common.UploadUtil;
import dao.Store_dao;
import dto.Store_dto;

public class BusinessStoreAddForm implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		Store_dao storeDao = new Store_dao();
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("sessionId");
		
		ArrayList<Store_dto> menuDto = storeDao.getMenuList();
		ArrayList<Store_dto> cityDto = storeDao.getCityList();
		ArrayList<Store_dto> localDto = storeDao.getLocalList();
		ArrayList<Store_dto> themeDto = storeDao.getThemeList();
		ArrayList<Store_dto> myStore = storeDao.myStoreList(id);
		ArrayList<Store_dto> waitStore = storeDao.waitStoreList(id);
		
		request.setAttribute("t_myStore", myStore);
		request.setAttribute("t_waitStore", waitStore);
		request.setAttribute("t_menuDto", menuDto);
	 	request.setAttribute("t_cityDto", cityDto);
	 	request.setAttribute("t_localDto", localDto);
	 	request.setAttribute("t_themeDto", themeDto);
	}
}
