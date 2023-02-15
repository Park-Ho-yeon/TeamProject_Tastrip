package command.review;

import java.io.File;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.CommonExecute;
import common.CommonUtil;
import dao.Review_dao;

public class ReviewDelete implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		Review_dao dao = new Review_dao();
		
		String r_no = request.getParameter("t_r_no");
		String s_no = request.getParameter("t_s_no");
		
		ArrayList<String> reviewImages = dao.getReviewImages(r_no);
		
		int result = dao.ReviewDelete(r_no);
		String ava = dao.getStarTotal(s_no);
		
		String fileDir = CommonUtil.getFile_dir_review(request);
		int result2 = 0;
		if(result==1) {
			for(int k=0; k<reviewImages.size(); k++) {
				File delFile = new File(fileDir,reviewImages.get(k)); //(삭제할 파일 경로, 삭제할 파일 이름)
				boolean tf = delFile.delete(); //삭제되면 true, 삭제실패면 false 리턴
				if(!tf) System.out.println("!!! 리뷰 첨부파일 삭제 오류!!!!");
			}
			result2 = dao.ReviewSave_store(s_no, ava);
		}
		
		String msg = "리뷰가 삭제되었습니다.";
		
		if(result!=1&&result2!=1) msg="리뷰 삭제 실패";
		
		request.setAttribute("t_msg", msg);
		request.setAttribute("t_url", "javascript:opener.parent.location.reload(); window.close();");

	}

}
