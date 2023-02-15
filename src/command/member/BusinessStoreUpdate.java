package command.member;

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
import dao.Store_dao;
import dto.Store_dto;

public class BusinessStoreUpdate implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		Store_dao storeDao = new Store_dao();

		String s_no = request.getParameter("t_no");
		String s_name = request.getParameter("t_s_name");
		String city_code = request.getParameter("t_city_select");
		String city = storeDao.CodeNameChange("city_tbl", "city_name", "city_code", city_code);
		String local_code = request.getParameter("t_local_select");
		String local = storeDao.CodeNameChange("local_tbl", "local_name", "local_code", local_code);
		String address = request.getParameter("t_s_address");
		String s_address = city+" "+local+" "+address;
		String x_code = request.getParameter("x_code");
		String y_code = request.getParameter("y_code");
		String opentime = request.getParameter("t_opentime");
		String endtime = request.getParameter("t_endtime");
		String s_time = opentime+" ~ "+endtime;
		String tell1 = request.getParameter("t_tell1");
		String tell2 = request.getParameter("t_tell2");
		String tell3 = request.getParameter("t_tell3");
		String tell = tell1+"-"+tell2+"-"+tell3;
		String s_content = request.getParameter("t_s_content");
		String s_menu = request.getParameter("t_s_menu");
		String menu_name_1 = request.getParameter("t_menu_name_1");
		String menu_name_2 = request.getParameter("t_menu_name_2");
		String menu_name_3 = request.getParameter("t_menu_name_3");
		String menu_name_4 = request.getParameter("t_menu_name_4");
		String menu_name_5 = request.getParameter("t_menu_name_5");
		String menu_price_1 = request.getParameter("t_price_1");
		String menu_price_2 = request.getParameter("t_price_2");
		String menu_price_3 = request.getParameter("t_price_3");
		String menu_price_4 = request.getParameter("t_price_4");
		String menu_price_5 = request.getParameter("t_price_5");
		String[] themes = request.getParameterValues("t_theme");
		
		String theme_1 = "";
		String theme_2 = "";
		String theme_3 = "";
		
		if(themes!=null) {
			if(themes.length==1) {
				theme_1 = themes[0];
				theme_2 ="";
				theme_3 ="";
			}else if(themes.length==2) {
				theme_1 = themes[0];
				theme_2 = themes[1];
				theme_3 = "";
			}else if(themes.length==3) {
				theme_1 = themes[0];
				theme_2 = themes[1];
				theme_3 = themes[2];
			}
			
			String attach_1="";
			String attach_2="";
			String attach_3="";
			String attach_4="";
			String attach_5="";
			
			String storeDir = CommonUtil.getFile_dir_store(request);
			storeDir = storeDir+s_name+"/";
			
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
				
				uploadUtil.saveFiles(part, "attach\\store\\"+s_name+"\\");
				
				File f = new File(storeDir,fileName);
				fileName=s_no+"_"+fileName;
				File new_f = new File(storeDir,fileName);
				f.renameTo(new_f);
				
				attachFiles.add(fileName);
			}
			
			
			//not_delFiles랑 attachFiles에 있는 이름들 합치면 => 최종 저장할 파일이름들이다..
			
			ArrayList<String> LastAttachFiles = new ArrayList<String>();
			
			for(String f : not_delFiles) {
				LastAttachFiles.add(f);
			}
			for(String f : attachFiles) {
				LastAttachFiles.add(f);
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
			
			int result = storeDao.StoreUpdate(s_no,s_name,s_menu,theme_1,theme_2,theme_3,city_code,local_code,s_address,x_code,y_code,s_content,tell,s_time,menu_name_1,menu_price_1,menu_name_2,menu_price_2,menu_name_3,menu_price_3,menu_name_4,menu_price_4,menu_name_5,menu_price_5,attach_1,attach_2,attach_3,attach_4,attach_5);
			
			if(result==1) {
				if(delFiles!=null) {
					//파일 삭제
					for(String delName : delFiles) {
						File delFile = new File(storeDir,delName); //(삭제할 파일 경로, 삭제할 파일 이름)
						boolean tf = delFile.delete(); //삭제되면 true, 삭제실패면 false 리턴
						if(!tf) {
							System.out.println("가게 첨부파일 삭제 오류!! "+delName);
						}else {
							System.out.println("가게 파일 삭제됨 : "+delName);
						}
					}
				}
			}
			String msg = "가게가 수정되었습니다.";
			if(result!=1) msg="가게 수정 실패";
			
			request.setAttribute("t_msg", msg);
			request.setAttribute("t_url", "Member");
			request.setAttribute("t_gubun", "b_mystore");
		}
	}

}

