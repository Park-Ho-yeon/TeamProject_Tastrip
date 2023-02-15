package command.member;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.CommonExecute;
import dao.Store_dao;
import dto.Store_dto;

public class MemberJoinBusiness implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		Store_dao cityDao = new Store_dao();
		Store_dao localDao = new Store_dao();
		
		ArrayList<Store_dto> cityDto = cityDao.getCityList();
		ArrayList<Store_dto> localDto = localDao.getLocalList();
		
		request.setAttribute("t_cityDto", cityDto);
		request.setAttribute("t_localDto", localDto);
	}

}
