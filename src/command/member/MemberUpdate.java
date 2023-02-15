package command.member;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import common.CommonExecute;
import common.CommonUtil;
import common.UploadUtil;
import dao.Member_dao;
import dao.Store_dao;
import dto.Member_dto;

public class MemberUpdate implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		Member_dao memberDao = new Member_dao();
		Store_dao storeDao = new Store_dao();
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("sessionId");
		
		//파일 경로 나오는 메소드
		String profileDir = CommonUtil.getFile_dir_profile(request);
		
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
		
		String fileName = "";
		
		for(Part part : parts) {
			
			if(!part.getName().equals("t_photo")) continue; //t_photo로 들어온 Part가 아니면 스킵
			if(part.getSubmittedFileName().equals("")) continue; //업로드 된 파일 이름이 없으면 스킵
			
			fileName = part.getSubmittedFileName();
			
			uploadUtil.saveFiles(part, "attach\\member\\profile\\");
			
			System.out.println(fileName);
			
			File f = new File(profileDir,fileName);
			fileName=id+"_"+fileName;
			File new_f = new File(profileDir,fileName);
			f.renameTo(new_f);
			
		}
		
//				int maxsize=1024*1024*10;
//				
//				MultipartRequest mpr=null;
//				try {
//					mpr = new MultipartRequest(request,profileDir,maxsize,"utf-8",new DefaultFileRenamePolicy());
//				} catch (IOException e) {
//					e.printStackTrace();
//				}
		
			String ori_photo = request.getParameter("t_ori_photo"); //DB사진이름
			
			String photo = request.getParameter("fileName"); //변경전-DB사진이름 변경후-새 파일이름
				
			
			if(!photo.equals(ori_photo)) {
				//사진변경했을때
				if(!ori_photo.equals("default_profile.png")) {
					//원래 사진은 삭제하라
					File file = new File(profileDir,ori_photo);
					file.delete();
				}
				photo = fileName;
				
			}else {
				//사진변경 안했을때
				photo = ori_photo;
			}
			
			String nickname = request.getParameter("t_nickname");
			String name = request.getParameter("t_name");
			String gender = request.getParameter("t_gender");
			String city = request.getParameter("t_city");
			String email_1 = request.getParameter("t_email_1");
			String email_2 = request.getParameter("t_email_2");
			String tel1	= request.getParameter("t_tel1");
			String tel2	= request.getParameter("t_tel2");
			String tel3	= request.getParameter("t_tel3");
			
			String city_name = storeDao.CodeNameChange("city_tbl", "city_code", "city_name", city);
			Member_dto dto = new Member_dto(id, photo, nickname, name, gender, city_name, email_1, email_2, tel1, tel2, tel3);
			
			int result = memberDao.memberUpdate(dto);
			
			String msg = "";
			String url = "";
			if(result == 1) {msg = "회원정보가 수정되었습니다."; url = "Index";}
			else {msg = "회원정보가 수정되지 않았습니다."; url = "Index";}
			
			if(result==1) {
				session.setAttribute("sessionNickname", dto.getNickname());
				session.setAttribute("sessionProfile", dto.getProfile_photo());
			}
			
			request.setAttribute("t_msg", msg);
			request.setAttribute("t_url", "/Member");
			
	}

}
