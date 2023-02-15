package command.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.CommonUtil;
import dao.Member_dao;
import dao.Store_dao;

/**
 * Servlet implementation class MemberSaveFavorite
 */
@WebServlet("/MemberSaveFavorite")
public class MemberSaveFavorite extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberSaveFavorite() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		 Member_dao dao = new Member_dao();
		 Store_dao sdao = new Store_dao();
	      String msg = "";
	      String url = "";
	      
	      HttpSession session = request.getSession();
	      String id   = (String)session.getAttribute("sessionId");
	      String s_no = request.getParameter("t_s_no");
	      String f_date = CommonUtil.getToday();

//	      Member_dto dto = new Member_dto(s_no, id, f_date);
	      int result = dao.checkFav(s_no, id);
	      
	      if(result == 0) {
	    	  int favSaveResult = dao.saveFav(s_no, id, f_date);
	    	  int favCount = Integer.parseInt(sdao.getStoreView(s_no, "view").getFavCount());
	    	  if(favSaveResult ==1) out.print(favCount);
	      } else {
	    	  int favDelResult = dao.delFav(s_no,id);
	    	  int favCount = Integer.parseInt(sdao.getStoreView(s_no, "view").getFavCount());
	    	  if(favDelResult ==1) out.print(favCount);
	      }
	      
	      
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
