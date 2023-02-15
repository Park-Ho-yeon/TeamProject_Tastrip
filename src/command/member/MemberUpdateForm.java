package command.member;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.CommonExecute;
import dao.Member_dao;
import dao.Store_dao;
import dto.Member_dto;
import dto.Store_dto;

public class MemberUpdateForm implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		Member_dao memberDao = new Member_dao();
		Store_dao storeDao = new Store_dao();
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("sessionId");
		
		ArrayList<Store_dto> city_dto = storeDao.getCityList();
		Member_dto memberDto = memberDao.myInfo(id);
		
		request.setAttribute("t_cityDto", city_dto);
		request.setAttribute("t_memberDto", memberDto);
	}
	
}
