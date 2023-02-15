package command.member;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.CommonExecute;
import dao.Member_dao;
import dao.Store_dao;
import dto.Store_dto;

public class BusinessStoreUpdateForm implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		Store_dao storeDao = new Store_dao();
		Member_dao mDao = new Member_dao();

		String s_no = request.getParameter("t_s_no");
		
		Store_dto storeDto = storeDao.getStoreView(s_no, "update");
		
		String city = storeDto.getS_address().substring(0, 2);
		
		String local = storeDto.getS_address();
		String address = storeDto.getS_address();
		
		int local2 = local.indexOf("구"); //받은 로컬을 '구' 앞에서 글자 수를 자른 값
		 if(local2 == 4){
			 local = local.substring(3,5);
			 address = address.substring(6);
		 }else if(local2 == 5){
			 local = local.substring(3,6); 
			 address = address.substring(7);
		 }else if(local2 == 6){
			 local = local.substring(3,7); 
			 address = address.substring(8);
		 }
		 
		
		String tell = storeDto.getS_tell(); //번호원본 02-252-2121
		String tell1 = "";
		String tell2 = "";
		String tell3 = "";
		
		int index_1 = tell.indexOf("-"); //받은 첫째번호를 '-' 앞에서 글자 수를 자른 값 = 지역번호 글자수 2
	
		tell1 = tell.substring(0,index_1); //02

		tell2 = tell.substring(index_1+1);
		
		int index_2 = tell2.indexOf("-"); //3
		
		String tell_2 = tell.substring(index_1+1);
		
		tell2 = tell_2.substring(0,index_2);

		tell3 = tell_2.substring(index_2+1);
		
		String opentime = storeDto.getS_time().substring(0,5);
		String endtime = storeDto.getS_time().substring(8);
		 
		ArrayList<Store_dto> menuDto = storeDao.getMenuList();
		ArrayList<Store_dto> cityDto = storeDao.getCityList();
		ArrayList<Store_dto> localDto = new ArrayList<Store_dto>();
		
		System.out.println("city =======" +city);
		System.out.println("local =======" +local);
		
		String city_code = storeDto.getCity_code();
		if(city_code.equals("DJ")) {
			localDto = mDao.getLocalList("1__");
		}else if(city_code.equals("SE")){
			localDto = mDao.getLocalList("2__");
		}else if(city_code.equals("DG")){
			localDto = mDao.getLocalList("3__");
		}else if(city_code.equals("US")){
			localDto = mDao.getLocalList("4__");
		}else if(city_code.equals("BS")){
			localDto = mDao.getLocalList("5__");
		}else if(city_code.equals("GJ")){
			localDto = mDao.getLocalList("6__");
		}else if(city_code.equals("IC")){
			localDto = mDao.getLocalList("7__");
		}else if(city_code.equals("JJ")){
			localDto = mDao.getLocalList("8__");
		}		
		
		ArrayList<Store_dto> themeDto = storeDao.getThemeList();
		ArrayList<String> attachDto = storeDao.getImageList(s_no);
		
		
		request.setAttribute("t_s_no", s_no);
		request.setAttribute("t_storeDto", storeDto);
		request.setAttribute("t_tell1", tell1);
		request.setAttribute("t_tell2", tell2);
		request.setAttribute("t_tell3", tell3);
		request.setAttribute("t_address", address);
		request.setAttribute("t_city", city);
		request.setAttribute("t_local", local);
		request.setAttribute("t_opentime", opentime);
		request.setAttribute("t_endtime", endtime);
		request.setAttribute("t_menuDto", menuDto);
	 	request.setAttribute("t_cityDto", cityDto);
	 	request.setAttribute("t_localDto", localDto);
	 	request.setAttribute("t_themeDto", themeDto);
	 	request.setAttribute("t_attachDto", attachDto);
	}

}
