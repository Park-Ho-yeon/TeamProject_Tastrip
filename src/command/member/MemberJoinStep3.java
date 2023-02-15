package command.member;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import common.CommonExecute;
import common.CommonUtil;
import common.UploadUtil;
import dao.Store_dao;
import dto.Member_dto;

public class MemberJoinStep3 implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		Store_dao storeDao = new Store_dao();
		//파일 경로 나오는 메소드
		String profileDir = CommonUtil.getFile_dir_profile(request);
		
		String id = request.getParameter("t_id");
		
		
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
		
//		int maxsize=1024*1024*10;
//		MultipartRequest mpr=null;
//		try {
//			mpr = new MultipartRequest(request,profileDir,maxsize,"utf-8",new DefaultFileRenamePolicy());
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
		
		String password = request.getParameter("t_password");
		String password_confirm = request.getParameter("t_password_confirm");
		String name = request.getParameter("t_name");
		String year = request.getParameter("t_year");
		String monSelect = request.getParameter("t_monSelect");
		if(monSelect.length()==1) {
			monSelect="0"+monSelect;
		}
		String dateSelect = request.getParameter("t_dateSelect");
		if(dateSelect.length()==1) {
			dateSelect="0"+dateSelect;
		}
		String birth = year+monSelect+dateSelect;
		String gender = request.getParameter("t_gender");
		String citySelect = request.getParameter("t_citySelect");
		String email = request.getParameter("t_email");
		String domain = request.getParameter("t_domain");
		String tel1 = request.getParameter("t_tel1");
		String tel2 = request.getParameter("t_tel2");
		String tel3 = request.getParameter("t_tel3");
//		String photo = request.getParameter("t_photo");
		String photo_name = request.getParameter("fileName");
		String ori_photo = request.getParameter("t_ori_photo");
		String nickname = request.getParameter("t_nickname");
		
//		if(photo == null) photo = "";
		
		if(!photo_name.equals(ori_photo)) {
			if(!ori_photo.equals("")) {
				File file = new File(profileDir,ori_photo);
				file.delete();
			}
		}else {
			fileName = ori_photo;
		}
		
		String reg_date = CommonUtil.getToday();
		
		String city_name = storeDao.CodeNameChange("city_tbl", "city_name", "city_code", citySelect);
		
		Member_dto memberDto = new Member_dto(id, password, name, birth , gender,
				citySelect, email, domain, tel1, tel2, tel3, fileName, reg_date, nickname);

		request.setAttribute("t_memberDto", memberDto);
		request.setAttribute("t_year", year);
		request.setAttribute("t_monSelect", monSelect);
		request.setAttribute("t_dateSelect", dateSelect);
		request.setAttribute("t_password_confirm", password_confirm);
		request.setAttribute("t_city_name", city_name);
		request.setAttribute("t_fileName", photo_name);
		request.setAttribute("t_ori_photo", ori_photo);

	}

}
