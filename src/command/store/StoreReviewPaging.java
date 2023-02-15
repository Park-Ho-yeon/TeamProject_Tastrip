package command.store;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Review_dao;
import dto.Review_dto;

/**
 * Servlet implementation class StoreReviewPaging
 */
@WebServlet("/StoreReviewPaging")
public class StoreReviewPaging extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StoreReviewPaging() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Review_dao dao = new Review_dao();
		
		String s_no = request.getParameter("t_s_no");
		String about = request.getParameter("t_star");
		String order = request.getParameter("t_desc");
		String start = request.getParameter("pageNum");
		String end = Integer.toString(Integer.parseInt(start)+5);
		
		ArrayList<Review_dto> dtos = dao.AjaxStoreReviewList(s_no, about, order, start, end);
		
		request.setAttribute("t_rdtos", dtos);
		
		RequestDispatcher rd = request.getRequestDispatcher("/store/store_review_ajax.jsp");
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
