package command.review;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import common.CommonExecute;
import common.CommonUtil;
import common.UploadUtil;
import dao.Review_dao;

public class ReviewUpdate implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		Review_dao dao = new Review_dao();
		
		String r_no = request.getParameter("t_r_no");
		String s_no = request.getParameter("t_s_no");
		String content = request.getParameter("t_content");
		String star = request.getParameter("t_star");
		if(star.length()==1) star = star+".0";

		String attach_1="";
		String attach_2="";
		String attach_3="";
		String attach_4="";
		String attach_5="";
		
		int result2 = 0;
		
		String reviewDir = CommonUtil.getFile_dir_review(request);
		
		String[] delFiles = request.getParameterValues("t_del_attach"); //삭제할 파일담긴 배열
		String[] not_delFiles = request.getParameterValues("t_not_delete"); //기존파일중 삭제 안하는 파일들
		ArrayList<String> attachFiles = new ArrayList<String>(); //추가한 파일있는만큼만 늘어날 배열
		
		
		
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
			
			File f = new File(reviewDir,fileName);
			fileName=r_no+"_"+fileName;
			File new_f = new File(reviewDir,fileName);
			f.renameTo(new_f);
			
			attachFiles.add(fileName);
		}
		
		
		//not_delFiles랑 attachFiles에 있는 이름들 합치면 => 최종 저장할 파일이름들이다..
		
		ArrayList<String> LastAttachFiles = new ArrayList<String>();
		if(not_delFiles!=null) {
			for(String f : not_delFiles) {
				LastAttachFiles.add(f);
			}
		}
		
		if(attachFiles!=null) {
			for(String f : attachFiles) {
				LastAttachFiles.add(f);
			}
		}
		
		if(LastAttachFiles.size()==5) {
			attach_1=LastAttachFiles.get(0);
			attach_2=LastAttachFiles.get(1);
			attach_3=LastAttachFiles.get(2);
			attach_4=LastAttachFiles.get(3);
			attach_5=LastAttachFiles.get(4);
			
		}else if(LastAttachFiles.size()==4){
			attach_1=LastAttachFiles.get(0);
			attach_2=LastAttachFiles.get(1);
			attach_3=LastAttachFiles.get(2);
			attach_4=LastAttachFiles.get(3);
			
		}else if(LastAttachFiles.size()==3){
			attach_1=LastAttachFiles.get(0);
			attach_2=LastAttachFiles.get(1);
			attach_3=LastAttachFiles.get(2);
			
		}else if(LastAttachFiles.size()==2){
			attach_1=LastAttachFiles.get(0);
			attach_2=LastAttachFiles.get(1);
			
		}else if(LastAttachFiles.size()==1){
			attach_1=LastAttachFiles.get(0);
		}
		
		int result = dao.ReviewUpdate(r_no, content, attach_1, attach_2, attach_3, attach_4, attach_5, star);
		String ava = dao.getStarTotal(s_no);
		
		if(result==1) {
			result2 = dao.ReviewSave_store(s_no, ava);
			if(delFiles!=null) {
				//파일 삭제
				for(String delName : delFiles) {
					File delFile = new File(reviewDir,delName); //(삭제할 파일 경로, 삭제할 파일 이름)
					boolean tf = delFile.delete(); //삭제되면 true, 삭제실패면 false 리턴
					if(!tf) {
						System.out.println("리뷰 첨부파일 삭제 오류!! "+delName);
					}else {
						System.out.println("리뷰 파일 삭제됨 : "+delName);
					}
				}
			}
		}
			
		String msg = "리뷰가 수정되었습니다.";
		
		if(result!=1&&result2!=1) msg="리뷰 수정 실패";
		
		request.setAttribute("t_msg", msg);
		request.setAttribute("t_url", "javascript:window.close()");
	}

}
