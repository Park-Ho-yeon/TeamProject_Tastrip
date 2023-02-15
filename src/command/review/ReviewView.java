package command.review;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.CommonExecute;
import dao.Review_dao;
import dto.Review_dto;

public class ReviewView implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		Review_dao dao= new Review_dao();
		
		String r_no = request.getParameter("t_r_no");
		
		//상세보기용
		Review_dto v_dto = dao.getReviewView(r_no, "view");

		//수정하기용
		Review_dto u_dto = dao.getReviewView(r_no, "update");
		int starRange = (int)(Double.parseDouble(u_dto.getStar())*2);
		
		//리뷰 사진만 담은 배열
		ArrayList<String> reviewImages = dao.getReviewImages(r_no);
		
		request.setAttribute("r_no", r_no);
		request.setAttribute("v_dto", v_dto);
		request.setAttribute("u_dto", u_dto);
		request.setAttribute("r_imgs", reviewImages);
		request.setAttribute("starRange", starRange);
		

	}

}
