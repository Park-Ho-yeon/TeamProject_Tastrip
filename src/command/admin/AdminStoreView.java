package command.admin;

import java.text.DecimalFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.CommonExecute;
import dao.Member_dao;
import dao.Store_dao;
import dto.Store_dto;

public class AdminStoreView implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		Store_dao storeDao = new Store_dao();
//		Member_dao memberDao = new Member_dao();
		
		String s_no = request.getParameter("t_s_no");
		Store_dto storeDto = storeDao.getStoreView(s_no,"view");
		
		ArrayList<String> storeImages = storeDao.getImageList(s_no);
		
		request.setAttribute("t_storeImages", storeImages);
		request.setAttribute("t_s_no", s_no);
		request.setAttribute("t_storeDto", storeDto);

		
	}
}
