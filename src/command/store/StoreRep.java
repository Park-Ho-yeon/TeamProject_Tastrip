package command.store;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.CommonExecute;
import dao.Store_dao;

public class StoreRep implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		Store_dao dao = new Store_dao();
		
		String s_no = request.getParameter("t_s_no");
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("sessionId");
		int result = dao.setStoreRep(s_no, id);
		
		String msg = "대표가게가 변경되었습니다.";
		if(result!=1) msg="대표가게 설정 오류!";
		
		request.setAttribute("t_msg", msg);
		request.setAttribute("t_url", "/Member");
		request.setAttribute("t_gubun", "b_mystore");
	}

}
