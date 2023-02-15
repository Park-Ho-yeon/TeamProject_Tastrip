package command.store;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Store_dao;
import dto.Store_dto;

/**
 * Servlet implementation class StorePaging
 */
@WebServlet("/StorePaging")
public class StorePaging extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StorePaging() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Store_dao dao = new Store_dao();
		
		String city = request.getParameter("t_city");
		String city_code = dao.CodeNameChange("city_tbl", "city_code" , "city_name", city);
		
		String local = "";
		
		String menu = request.getParameter("t_menu_code");
		String keyword = request.getParameter("t_keyword");
		String theme_1 = request.getParameter("t_theme_1");
		String theme_2 = request.getParameter("t_theme_2");
		String theme_3 = request.getParameter("t_theme_3");
		String start = request.getParameter("pageNum");
		String end = Integer.toString(Integer.parseInt(start)+10);
		String order = request.getParameter("t_order");
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("sessionId");
		if(id==null) id = "";
		
		ArrayList<Store_dto> dtos = dao.AjaxStoreList(id, city_code, local, menu, keyword, theme_1, theme_2, theme_3, start, end, order);
//		ArrayList<Store_dto> favoriteDto = dao.getFavCheck();
		
		request.setAttribute("dtos", dtos);
//		request.setAttribute("f_dto", favoriteDto);

		RequestDispatcher rd = request.getRequestDispatcher("/store/store_list_ajax.jsp");
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
