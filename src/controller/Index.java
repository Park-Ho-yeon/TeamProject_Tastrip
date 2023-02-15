
package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Member_dao;
import dao.Notice_dao;
import dao.Review_dao;
import dao.Store_dao;
import dto.Notice_dto;
import dto.Review_dto;
import dto.Store_dto;

/*
 * Servlet implementation class Index
 */
@WebServlet("/Index")
public class Index extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Index() {
        super();
        // TODO Auto-generated constructor stub
    }
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Store_dao sdao = new Store_dao();
		Notice_dao ndao = new Notice_dao();
		Review_dao rdao = new Review_dao();
		Member_dao mdao = new Member_dao();
		
		ArrayList<Store_dto> sdtos_2 = sdao.getStoreFavList(); 
		request.setAttribute("t_sdtos_2", sdtos_2);
		
		ArrayList<Store_dto> sdtos = sdao.getMenuList();		
		request.setAttribute("t_sdtos", sdtos);
		
		ArrayList<Review_dto> rdtos = rdao.getIndexReviewList();
		request.setAttribute("t_rdtos", rdtos);
		
		ArrayList<Store_dto> theme = sdao.getThemeList();
		request.setAttribute("theme",theme);

		ArrayList<Notice_dto> notiDtos = ndao.getNotice();
		request.setAttribute("t_notiDtos", notiDtos);
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("sessionId");
		String level = (String) session.getAttribute("sessionLevel_code");
		
		if(id!=null) {
			if(level.equals("member")) {
				int favorite_count = mdao.getTotalCount(id);
				request.setAttribute("f_count", favorite_count);
				int review_count = rdao.getTotalCount(id);
				request.setAttribute("r_count", review_count);
			}else if(level.equals("business")) {
				String rep_no = sdao.repNumber(id);
				String low_no = sdao.lowNumber(id);
				if(rep_no=="") rep_no = low_no;
				String bs_s_name=sdao.CodeNameChange("store", "s_name", "s_no", rep_no);
				String representReview = sdao.getRepresentReviewCount(rep_no);
				request.setAttribute("rep_no", rep_no);
				request.setAttribute("bs_s_name", bs_s_name);
				request.setAttribute("bs_r_count", representReview);
			}
		}
		
		ArrayList<Store_dto> adtos = sdao.AdminStoreListN("m.bs_no", "", 0, 999, "s.reg_date desc");
		int admin_count = adtos.size();
		request.setAttribute("t_admin_count", admin_count);
		
		RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
		rd.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
