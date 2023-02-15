package command.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;

import dao.Member_dao;
import dto.Member_dto;

/**
 * Servlet implementation class MemberLocPlz
 */
@WebServlet("/MemberLocPlz")
public class MemberLocPlz extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberLocPlz() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member_dao dao = new Member_dao();

		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		
		String city = request.getParameter("t_city_select");
		JSONArray array = new JSONArray();
		
		if(city.equals("DJ")) {
			array = dao.getLocPlz("1__");
		}else if(city.equals("SE")){
			array = dao.getLocPlz("2__");
		}else if(city.equals("DG")){
			array = dao.getLocPlz("3__");
		}else if(city.equals("US")){
			array = dao.getLocPlz("4__");
		}else if(city.equals("BS")){
			array = dao.getLocPlz("5__");
		}else if(city.equals("GJ")){
			array = dao.getLocPlz("6__");
		}else if(city.equals("IC")){
			array = dao.getLocPlz("7__");
		}else if(city.equals("JJ")){
			array = dao.getLocPlz("8__");
		}					
		
		out.print(array.toJSONString());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
