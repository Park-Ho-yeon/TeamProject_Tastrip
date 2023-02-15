package command.member;

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
import dao.Member_dao;
import dao.Store_dao;
import dto.Member_dto;
import dto.Store_dto;

public class BusinessStoreAdd implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		Store_dao storeDao = new Store_dao();
	
		//스토어
		String s_no = storeDao.getMaxNo();
		String s_name = request.getParameter("t_s_name");
		String s_city_select = request.getParameter("t_city_select");
		String city = storeDao.CodeNameChange("city_tbl", "city_name", "city_code",s_city_select);
		String s_local_select = request.getParameter("t_local_select");
		String local = storeDao.CodeNameChange("local_tbl", "local_name", "local_code",s_local_select);
		String address = request.getParameter("t_address");
			address = city+" "+local+" "+address;
		String x_code = request.getParameter("t_x_code");
		String y_code = request.getParameter("t_y_code");
		String opentime = request.getParameter("t_opentime");
		String endtime = request.getParameter("t_endtime");
		String s_time = opentime+" ~ "+endtime;
		String s_tell1 = request.getParameter("t_s_tell1");
		String s_tell2 = request.getParameter("t_s_tell2");
		String s_tell3 = request.getParameter("t_s_tell3");
		String s_tell  = s_tell1+"-"+s_tell2+"-"+s_tell3;
		String s_content = request.getParameter("t_s_content");
		String v_content = s_content.replace("\r\n","<br>");
		String s_menu = request.getParameter("t_s_menu");
		String s_menu_name_1 = request.getParameter("t_s_menu_name_1");
		String s_menu_name_2 = request.getParameter("t_s_menu_name_2");
		String s_menu_name_3 = request.getParameter("t_s_menu_name_3");
		String s_menu_name_4 = request.getParameter("t_s_menu_name_4");
		String s_menu_name_5 = request.getParameter("t_s_menu_name_5");
		String s_menu_price_1 = request.getParameter("t_s_menu_price_1");
		String s_menu_price_2 = request.getParameter("t_s_menu_price_2");
		String s_menu_price_3 = request.getParameter("t_s_menu_price_3");
		String s_menu_price_4 = request.getParameter("t_s_menu_price_4");
		String s_menu_price_5 = request.getParameter("t_s_menu_price_5");
		String reg_date = CommonUtil.getToday();
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("sessionId");
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
				
				
				ArrayList<String> attachFiles = new ArrayList<String>(); //파일있는만큼만 늘어날 배열
				String storeDir = CommonUtil.getFile_dir_store(request);
				
				/*파일업로드*/
				UploadUtil uploadUtil = UploadUtil.create(request.getServletContext());
				
				CommonUtil.createFolder(storeDir,s_name);
				
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
					
					System.out.println(fileName);
					
					File f = new File(storeDir+"s_name\\",fileName);
					fileName=s_no+"_"+fileName;
					File new_f = new File(storeDir+"s_name\\",fileName);
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
				 
				//가게정보 dto
				Store_dto storeDto = new Store_dto(s_no, s_name, s_city_select, s_local_select, s_menu, theme_1, theme_2, theme_3, address, x_code, y_code, s_content, s_tell,
						s_time, s_menu_name_1, s_menu_price_1, s_menu_name_2, s_menu_price_2, s_menu_name_3,
						s_menu_price_3, s_menu_name_4, s_menu_price_4, s_menu_name_5, s_menu_price_5, attach_1, attach_2, attach_3, attach_4, attach_5,reg_date,id);
				
				int s_result = storeDao.storeSave(storeDto);
				
				String msg ="가게 추가등록이 되셨습니다! 입력해주신 가게정보는 관리자 검토 후 등록될 예정입니다.";
				if( s_result!=1) {
					msg="등록에 오류가 발생하였습니다.";
				}
				
				request.setAttribute("t_msg", msg);
				request.setAttribute("t_url", "/Index");
				request.setAttribute("t_gubun", "검토중에 뜰 가게>??, 대표가게창?");
				
				
			}
		}
}
