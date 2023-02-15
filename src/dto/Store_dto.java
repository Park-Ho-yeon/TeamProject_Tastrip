package dto;

public class Store_dto {

	private String s_no, s_name, city_code, city_name, local_code, local_name, menu_code, menu_name, theme_code_1, theme_name_1, theme_code_2, theme_name_2, theme_code_3, theme_name_3,  s_address, 
					x_code, y_code, s_content, s_tell, s_time, s_menu_1, s_price_1, s_menu_2, s_price_2, s_menu_3, s_price_3, 
					s_menu_4, s_price_4, s_menu_5, s_price_5, s_attach_1, s_attach_2, s_attach_3, s_attach_4, s_attach_5,
					reg_date, id, admin_check, common_code, common_name, star, f_date, bs_no, favCount, close_check, review_count, rep, f_check;

	int star_front, star_end, star_empty;
	String gubun;

	
	/*코드-네임 리스트 가져오기 공동사용*/
	public Store_dto(String empty, String gubun, String common_code, String common_name) {
		super();
		this.gubun = gubun;
		this.common_code = common_code;
		this.common_name = common_name;
	}

	public String getGubun() {
		return gubun;
	}

	public Store_dto(String common_code, String common_name) {
		this.common_code = common_code;
		this.common_name = common_name;
	}
	
	/*가게 목록 정보*/
	public Store_dto(String star, String s_no, String s_name,String s_address, String s_content,
			String theme_name_1, String theme_name_2, String theme_name_3,String s_attach_1, int star_front, int star_end, int star_empty) {
		this.star = star;
		this.s_no = s_no;
		this.s_name = s_name;
		this.s_address = s_address;
		this.s_content = s_content;
		this.theme_name_1 = theme_name_1;
		this.theme_name_2 = theme_name_2;
		this.theme_name_3 = theme_name_3;
		this.s_attach_1 = s_attach_1;
		this.star_front = star_front;
		this.star_end = star_end;
		this.star_empty = star_empty;
	}

	//인덱스 관심순 정렬
	public Store_dto(String s_no, String s_attach_1, String s_name, String star, String s_content, String s_address, 
					String theme_name_1, String theme_name_2, String theme_name_3, String favCount, int star_front,
					int star_end, int star_empty) {
		super();
		this.s_no = s_no;
		this.s_name = s_name;
		this.theme_name_1 = theme_name_1;
		this.theme_name_2 = theme_name_2;
		this.theme_name_3 = theme_name_3;
		this.s_address = s_address;
		this.s_content = s_content;
		this.s_attach_1 = s_attach_1;
		this.star = star;
		this.favCount = favCount;
		this.star_front = star_front;
		this.star_end = star_end;
		this.star_empty = star_empty;
	}
	
	//가게상세보기
	public Store_dto(String s_attach_1, String s_attach_2, String s_attach_3, String s_attach_4, String s_attach_5, 
				String s_name, String s_content, String x_code, String y_code, String s_address, String s_tell,  
				String menu_name, String s_time, String s_menu_1, String s_price_1, String s_menu_2, String s_price_2, 
				String s_menu_3, String s_price_3, String s_menu_4, String s_price_4, String s_menu_5, String s_price_5,  
				String theme_name_1, String theme_name_2, String theme_name_3, String star,String favCount) {
			this.s_name = s_name;
			this.menu_name = menu_name;
			this.theme_name_1 = theme_name_1;
			this.theme_name_2 = theme_name_2;
			this.theme_name_3 = theme_name_3;
			this.s_tell = s_tell;
			this.s_address = s_address;
			this.x_code = x_code;
			this.y_code = y_code;
			this.s_content = s_content;
			this.s_time = s_time;
			this.s_menu_1 = s_menu_1;
			this.s_price_1 = s_price_1;
			this.s_menu_2 = s_menu_2;
			this.s_price_2 = s_price_2;
			this.s_menu_3 = s_menu_3;
			this.s_price_3 = s_price_3;
			this.s_menu_4 = s_menu_4;
			this.s_price_4 = s_price_4;
			this.s_menu_5 = s_menu_5;
			this.s_price_5 = s_price_5;
			this.s_attach_1 = s_attach_1;
			this.s_attach_2 = s_attach_2;
			this.s_attach_3 = s_attach_3;
			this.s_attach_4 = s_attach_4;
			this.s_attach_5 = s_attach_5;
			this.star = star;
			this.favCount = favCount;
	}
	
	//사업자 회원가입
	public Store_dto(String s_no, String s_name, String city_code, String local_code, String menu_code,
			String theme_code_1, String theme_code_2, String theme_code_3, String s_address,
			String x_code, String y_code, String s_content, String s_tell, String s_time, String s_menu_1,
			String s_price_1, String s_menu_2, String s_price_2, String s_menu_3, String s_price_3, String s_menu_4,
			String s_price_4, String s_menu_5, String s_price_5, String s_attach_1, String s_attach_2,
			String s_attach_3, String s_attach_4, String s_attach_5, String reg_date, String id) {
		this.s_no = s_no;
		this.s_name = s_name;
		this.city_code = city_code;
		this.local_code = local_code;
		this.menu_code = menu_code;
		this.theme_code_1 = theme_code_1;
		this.theme_code_2 = theme_code_2;
		this.theme_code_3 = theme_code_3;
		this.s_address = s_address;
		this.x_code = x_code;
		this.y_code = y_code;
		this.s_content = s_content;
		this.s_tell = s_tell;
		this.s_time = s_time;
		this.s_menu_1 = s_menu_1;
		this.s_price_1 = s_price_1;
		this.s_menu_2 = s_menu_2;
		this.s_price_2 = s_price_2;
		this.s_menu_3 = s_menu_3;
		this.s_price_3 = s_price_3;
		this.s_menu_4 = s_menu_4;
		this.s_price_4 = s_price_4;
		this.s_menu_5 = s_menu_5;
		this.s_price_5 = s_price_5;
		this.s_attach_1 = s_attach_1;
		this.s_attach_2 = s_attach_2;
		this.s_attach_3 = s_attach_3;
		this.s_attach_4 = s_attach_4;
		this.s_attach_5 = s_attach_5;
		this.reg_date = reg_date;
		this.id = id;
	}
	
	
	//리뷰쓰기페이지 - 가게정보
	public Store_dto(String s_name, String city_name, String local_name) {
		this.s_name = s_name;
		this.city_name = city_name;
		this.local_name = local_name;
	}
	
	//관심가게목록
	public Store_dto(String s_no, String id, String f_date, int i) {
		this.s_no = s_no;
		this.id = id;
		this.f_date = f_date;
	}


	// 관리자 페이지에서 허락한 가게목록 or 아직 허락하지 않은 가게 목록
	public Store_dto(String bs_no, String s_no, String s_name, String s_address, String reg_date, String id) {
		this.bs_no = bs_no;
		this.s_no = s_no;
		this.s_name = s_name;
		this.s_address = s_address;
		this.reg_date = reg_date;
		this.id = id;
	}

	//사업자 마이페이지 - 내 가게 정보
	public Store_dto(String id, String s_no, String s_name, String city_code, String local_code, String menu_code, String theme_code_1, String theme_code_2,
			String theme_code_3, String s_address, String x_code, String y_code, String s_content, String s_tell,
			String s_time, String s_menu_1, String s_price_1, String s_menu_2, String s_price_2, String s_menu_3,
			String s_price_3, String s_menu_4, String s_price_4, String s_menu_5, String s_price_5, String s_attach_1,
			String s_attach_2, String s_attach_3, String s_attach_4, String s_attach_5) {
		this.id = id;
		this.s_no = s_no;
		this.s_name = s_name;
		this.city_code = city_code;
		this.local_code = local_code;
		this.menu_code = menu_code;
		this.theme_code_1 = theme_code_1;
		this.theme_code_2 = theme_code_2;
		this.theme_code_3 = theme_code_3;
		this.s_address = s_address;
		this.x_code = x_code;
		this.y_code = y_code;
		this.s_content = s_content;
		this.s_tell = s_tell;
		this.s_time = s_time;
		this.s_menu_1 = s_menu_1;
		this.s_price_1 = s_price_1;
		this.s_menu_2 = s_menu_2;
		this.s_price_2 = s_price_2;
		this.s_menu_3 = s_menu_3;
		this.s_price_3 = s_price_3;
		this.s_menu_4 = s_menu_4;
		this.s_price_4 = s_price_4;
		this.s_menu_5 = s_menu_5;
		this.s_price_5 = s_price_5;
		this.s_attach_1 = s_attach_1;
		this.s_attach_2 = s_attach_2;
		this.s_attach_3 = s_attach_3;
		this.s_attach_4 = s_attach_4;
		this.s_attach_5 = s_attach_5;
	}

	public String getCity_name() {
		return city_name;
	}


	public String getLocal_name() {
		return local_name;
	}

	public String getMenu_name() {
		return menu_name;
	}

	public String getTheme_name_1() {
		return theme_name_1;
	}

	public String getTheme_name_2() {
		return theme_name_2;
	}

	public String getTheme_name_3() {
		return theme_name_3;
	}

	public String getS_no() {
		return s_no;
	}

	public String getS_name() {
		return s_name;
	}

	public String getCity_code() {
		return city_code;
	}

	public String getLocal_code() {
		return local_code;
	}

	public String getMenu_code() {
		return menu_code;
	}

	public String getTheme_code_1() {
		return theme_code_1;
	}

	public String getTheme_code_2() {
		return theme_code_2;
	}

	public String getTheme_code_3() {
		return theme_code_3;
	}

	public String getS_address() {
		return s_address;
	}

	public String getX_code() {
		return x_code;
	}

	public String getY_code() {
		return y_code;
	}

	public String getS_content() {
		return s_content;
	}

	public String getS_time() {
		return s_time;
	}

	public String getS_menu_1() {
		return s_menu_1;
	}

	public String getS_price_1() {
		return s_price_1;
	}

	public String getS_menu_2() {
		return s_menu_2;
	}

	public String getS_price_2() {
		return s_price_2;
	}

	public String getS_menu_3() {
		return s_menu_3;
	}

	public String getS_price_3() {
		return s_price_3;
	}

	public String getS_menu_4() {
		return s_menu_4;
	}

	public String getS_price_4() {
		return s_price_4;
	}

	public String getS_menu_5() {
		return s_menu_5;
	}

	public String getS_price_5() {
		return s_price_5;
	}

	public String getS_attach_1() {
		return s_attach_1;
	}

	public String getS_attach_2() {
		return s_attach_2;
	}

	public String getS_attach_3() {
		return s_attach_3;
	}

	public String getS_attach_4() {
		return s_attach_4;
	}

	public String getS_attach_5() {
		return s_attach_5;
	}

	public String getReg_date() {
		return reg_date;
	}

	public String getId() {
		return id;
	}

	public String getAdmin_check() {
		return admin_check;
	}
	public String getCommon_code() {
		return common_code;
	}

	public String getCommon_name() {
		return common_name;
	}

	public String getS_tell() {
		return s_tell;
	}

	public String getStar() {
		return star;
	}

	public int getStar_front() {
		return star_front;
	}


	public int getStar_end() {
		return star_end;
	}


	public int getStar_empty() {
		return star_empty;
	}


	public String getF_date() {
		return f_date;
	}

	public String getBs_no() {
		return bs_no;
	}

	public String getFavCount() {
		return favCount;
	}

	public String getClose_check() {
		return close_check;
	}


	public void setS_price_1(String s_price_1) {
		this.s_price_1 = s_price_1;
	}


	public void setS_price_2(String s_price_2) {
		this.s_price_2 = s_price_2;
	}


	public void setS_price_3(String s_price_3) {
		this.s_price_3 = s_price_3;
	}


	public void setS_price_4(String s_price_4) {
		this.s_price_4 = s_price_4;
	}


	public void setS_price_5(String s_price_5) {
		this.s_price_5 = s_price_5;
	}


	public void setF_date(String f_date) {
		this.f_date = f_date;
	}


	public void setS_no(String s_no) {
		this.s_no = s_no;
	}


	public void setS_name(String s_name) {
		this.s_name = s_name;
	}


	public void setCity_code(String city_code) {
		this.city_code = city_code;
	}


	public void setCity_name(String city_name) {
		this.city_name = city_name;
	}


	public void setLocal_code(String local_code) {
		this.local_code = local_code;
	}


	public void setLocal_name(String local_name) {
		this.local_name = local_name;
	}


	public void setMenu_code(String menu_code) {
		this.menu_code = menu_code;
	}


	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
	}


	public void setTheme_code_1(String theme_code_1) {
		this.theme_code_1 = theme_code_1;
	}


	public void setTheme_name_1(String theme_name_1) {
		this.theme_name_1 = theme_name_1;
	}


	public void setTheme_code_2(String theme_code_2) {
		this.theme_code_2 = theme_code_2;
	}


	public void setTheme_name_2(String theme_name_2) {
		this.theme_name_2 = theme_name_2;
	}


	public void setTheme_code_3(String theme_code_3) {
		this.theme_code_3 = theme_code_3;
	}


	public void setTheme_name_3(String theme_name_3) {
		this.theme_name_3 = theme_name_3;
	}


	public void setS_address(String s_address) {
		this.s_address = s_address;
	}


	public void setX_code(String x_code) {
		this.x_code = x_code;
	}


	public void setY_code(String y_code) {
		this.y_code = y_code;
	}


	public void setS_content(String s_content) {
		this.s_content = s_content;
	}


	public void setS_tell(String s_tell) {
		this.s_tell = s_tell;
	}


	public void setS_time(String s_time) {
		this.s_time = s_time;
	}


	public void setS_menu_1(String s_menu_1) {
		this.s_menu_1 = s_menu_1;
	}


	public void setS_menu_2(String s_menu_2) {
		this.s_menu_2 = s_menu_2;
	}


	public void setS_menu_3(String s_menu_3) {
		this.s_menu_3 = s_menu_3;
	}


	public void setS_menu_4(String s_menu_4) {
		this.s_menu_4 = s_menu_4;
	}


	public void setS_menu_5(String s_menu_5) {
		this.s_menu_5 = s_menu_5;
	}


	public void setS_attach_1(String s_attach_1) {
		this.s_attach_1 = s_attach_1;
	}


	public void setS_attach_2(String s_attach_2) {
		this.s_attach_2 = s_attach_2;
	}


	public void setS_attach_3(String s_attach_3) {
		this.s_attach_3 = s_attach_3;
	}


	public void setS_attach_4(String s_attach_4) {
		this.s_attach_4 = s_attach_4;
	}


	public void setS_attach_5(String s_attach_5) {
		this.s_attach_5 = s_attach_5;
	}


	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}


	public void setId(String id) {
		this.id = id;
	}


	public void setAdmin_check(String admin_check) {
		this.admin_check = admin_check;
	}


	public void setCommon_code(String common_code) {
		this.common_code = common_code;
	}


	public void setCommon_name(String common_name) {
		this.common_name = common_name;
	}


	public void setStar(String star) {
		this.star = star;
	}


	public void setBs_no(String bs_no) {
		this.bs_no = bs_no;
	}


	public void setFavCount(String favCount) {
		this.favCount = favCount;
	}


	public void setStar_front(int star_front) {
		this.star_front = star_front;
	}


	public void setStar_end(int star_end) {
		this.star_end = star_end;
	}


	public void setStar_empty(int star_empty) {
		this.star_empty = star_empty;
	}


	public void setClose_check(String close_check) {
		this.close_check = close_check;
	}


	public String getReview_count() {
		return review_count;
	}


	public void setReview_count(String review_count) {
		this.review_count = review_count;
	}

	public String getRep() {
		return rep;
	}

	public void setRep(String rep) {
		this.rep = rep;
	}

	public String getF_check() {
		return f_check;
	}

	public void setF_check(String f_check) {
		this.f_check = f_check;
	}

	
	
	
}