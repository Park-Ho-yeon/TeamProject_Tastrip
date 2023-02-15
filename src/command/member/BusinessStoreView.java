package command.member;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.CommonExecute;
import dao.Store_dao;
import dto.Store_dto;

public class BusinessStoreView implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		Store_dao storeDao = new Store_dao();
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("sessionId");
		
		String s_no = request.getParameter("t_s_no");
		String rep_no = storeDao.repNumber(id);
		String low_no = storeDao.lowNumber(id);
		if(rep_no == "") rep_no = low_no;
		if(s_no == null) s_no = rep_no;
		
		Store_dto storeDto = storeDao.getStoreView(s_no, "view");
		
		ArrayList<String> storeImages = storeDao.getImageList(s_no);
		
		request.setAttribute("t_storeDto", storeDto);
		request.setAttribute("t_storeImages", storeImages);
		request.setAttribute("t_s_no", s_no);
		request.setAttribute("admin_check", storeDto.getAdmin_check());
		request.setAttribute("close_check", storeDto.getClose_check());
		request.setAttribute("rep", storeDto.getRep());
		
	}

}
