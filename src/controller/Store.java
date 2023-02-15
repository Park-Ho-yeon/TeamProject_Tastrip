package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.store.StoreClose;
import command.store.StoreList;
import command.store.StoreRep;
import command.store.StoreView;
import common.CommonExecute;

/**
 * Servlet implementation class Store
 */
@WebServlet("/Store")
public class Store extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Store() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String gubun = request.getParameter("t_gubun");
		if(gubun == null) gubun="storeList";
		String viewPage ="";

		if(gubun.equals("storeList")) {
			CommonExecute store = new StoreList();
			store.execute(request, response);
			viewPage ="/store/store_list.jsp";
			
		}else if(gubun.equals("storeView")){
			CommonExecute store = new StoreView();
			store.execute(request, response);
			viewPage ="/store/store_view.jsp";
		
		}else if(gubun.equals("storeClose")) {
			CommonExecute store = new StoreClose();
			store.execute(request, response);
			viewPage = "/common_alert_page_mypage.jsp";
		
		}else if(gubun.equals("setStoreRep")) {
			CommonExecute store = new StoreRep();
			store.execute(request, response);
			viewPage = "/common_alert_page_mypage.jsp";
		}
		
		RequestDispatcher rd = request.getRequestDispatcher(viewPage);
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
