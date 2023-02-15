package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.review.ReviewDelete;
import command.review.ReviewSave;
import command.review.ReviewUpdate;
import command.review.ReviewView;
import command.review.ReviewWrite;
import common.CommonExecute;

/**
 * Servlet implementation class Review
 */
@WebServlet("/Review")
@MultipartConfig(
    fileSizeThreshold = 1024*1024,
    maxFileSize = 1024*1024*50, //50메가
    maxRequestSize = 1024*1024*50*5 // 50메가 5개까지
)
public class Review extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Review() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		request.setCharacterEncoding("utf-8");
		String gubun = request.getParameter("t_gubun");
		
		if(gubun==null) gubun ="reviewView";
		String viewPage ="";
		
		if(gubun.equals("reviewView")) {
			CommonExecute review = new ReviewView();
			review.execute(request, response);
			viewPage ="/review/review_view.jsp";
		
		}else if(gubun.equals("reviewWrite")) {
			CommonExecute review = new ReviewWrite();
			review.execute(request, response);
			viewPage ="/review/review_write.jsp";
		
		}else if(gubun.equals("reviewSave")) {
			CommonExecute review = new ReviewSave();
			review.execute(request, response);
			viewPage = "/common_alert_page.jsp";
		
		}else if(gubun.equals("reviewUpdateForm")) {
			CommonExecute review = new ReviewView();
			review.execute(request, response);
			viewPage = "/review/review_update.jsp";
		
		}else if(gubun.equals("reviewDelete")) {
			CommonExecute review = new ReviewDelete();
			review.execute(request, response);
			viewPage = "/common_alert_page.jsp";
		
		}else if(gubun.equals("reviewUpdate")) {
			CommonExecute review = new ReviewUpdate();
			review.execute(request, response);
			viewPage = "/common_alert_page.jsp";
		}
		
		String servletPath = request.getServletPath();
		request.setAttribute("t_path", servletPath);
		
		
		
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
