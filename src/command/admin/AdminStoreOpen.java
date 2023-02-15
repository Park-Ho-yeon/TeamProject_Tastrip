package command.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.CommonExecute;
import dao.Store_dao;

public class AdminStoreOpen implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		Store_dao dao = new Store_dao();
		
		String s_no = request.getParameter("t_s_no");
		
		int result = dao.AdminStoreOpen(s_no);
		
		String msg = "등록 허가되었습니다.";
		if(result!=1) msg="오류가 발생하였습니다.";
		
		request.setAttribute("t_msg", msg);
		request.setAttribute("t_url", "/Admin");
		request.setAttribute("t_gubun", "requestList");
		
	}

}
