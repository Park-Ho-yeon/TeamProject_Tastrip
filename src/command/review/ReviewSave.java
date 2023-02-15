package command.review;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import common.CommonExecute;
import common.CommonUtil;
import common.UploadUtil;
import dao.Review_dao;

public class ReviewSave implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		Review_dao dao = new Review_dao();
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("sessionId");
		
		String r_no = dao.getMaxNo();
		String s_no = request.getParameter("t_s_no");
		String content = request.getParameter("t_content");
		String star = request.getParameter("t_star");
		if(star.length()==1) star = star+".0";
		String reg_date = CommonUtil.getToday();
		
		String attach_1="";
		String attach_2="";
		String attach_3="";
		String attach_4="";
		String attach_5="";
		
		
		ArrayList<String> attachFiles = new ArrayList<String>(); //파일있는만큼만 늘어날 배열
		
		/*파일업로드*/
		UploadUtil uploadUtil = UploadUtil.create(request.getServletContext());
		
		List<Part> parts=null;
		
		try {
			parts = (List<Part>) request.getParts();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ServletException e) {
			e.printStackTrace();
		}
		
		for(Part part : parts) {
			
			if(!part.getName().equals("t_photo")) continue; //t_photo로 들어온 Part가 아니면 스킵
			if(part.getSubmittedFileName().equals("")) continue; //업로드 된 파일 이름이 없으면 스킵
			
			String fileName = part.getSubmittedFileName();
			
			uploadUtil.saveFiles(part, "attach\\review\\");
			
			File f = new File("C:/Users/PHY/Desktop/eclipse_source/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/pjt_taste/attach/review",fileName);
			fileName=r_no+"_"+fileName;
			File new_f = new File("C:/Users/PHY/Desktop/eclipse_source/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/pjt_taste/attach/review",fileName);
			f.renameTo(new_f);
			
			attachFiles.add(fileName);
		}
		
		/*--------*/
		
		if(attachFiles.size()==5) {
			attach_1=attachFiles.get(0);
			attach_2=attachFiles.get(1);
			attach_3=attachFiles.get(2);
			attach_4=attachFiles.get(3);
			attach_5=attachFiles.get(4);
			
		}else if(attachFiles.size()==4){
			attach_1=attachFiles.get(0);
			attach_2=attachFiles.get(1);
			attach_3=attachFiles.get(2);
			attach_4=attachFiles.get(3);
			
		}else if(attachFiles.size()==3){
			attach_1=attachFiles.get(0);
			attach_2=attachFiles.get(1);
			attach_3=attachFiles.get(2);
			
		}else if(attachFiles.size()==2){
			attach_1=attachFiles.get(0);
			attach_2=attachFiles.get(1);
			
		}else if(attachFiles.size()==1){
			attach_1=attachFiles.get(0);
		}
		
		
		
		int result = dao.ReviewSave(id,r_no,s_no,content,star,reg_date,attach_1,attach_2,attach_3,attach_4,attach_5);

		String ava = dao.getStarTotal(s_no);
		
		int result2 = 0;
		if(result==1) {
			result2 = dao.ReviewSave_store(s_no, ava);
		}
		
		String msg = "리뷰가 등록되었습니다.";
		
		if(result!=1&&result2!=1) msg="리뷰 등록 실패";
		
		request.setAttribute("t_msg", msg);
		request.setAttribute("t_url", "javascript:opener.parent.location.reload(); window.close();");
		

	}

}
