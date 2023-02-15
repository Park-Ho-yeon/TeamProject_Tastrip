package dto;

public class Review_dto {
	private String r_no, s_no, content, attach_1, attach_2, attach_3, attach_4, attach_5, star, reg_date, reg_id,
					s_name, s_address, nickname, profile_photo, city_name, local_name, api;
	
	int star_front, star_end, star_empty;

	public String getLocal_name() {
		return local_name;
	}
	
	public String getCity_name() {
		return city_name;
	}

	public String getR_no() {
		return r_no;
	}

	public String getS_no() {
		return s_no;
	}

	public String getS_name() {
		return s_name;
	}

	public String getS_address() {
		return s_address;
	}

	public String getProfile_photo() {
		return profile_photo;
	}

	public String getContent() {
		return content;
	}

	public String getAttach_1() {
		return attach_1;
	}

	public String getAttach_2() {
		return attach_2;
	}

	public String getAttach_3() {
		return attach_3;
	}

	public String getAttach_4() {
		return attach_4;
	}

	public String getAttach_5() {
		return attach_5;
	}

	public String getStar() {
		return star;
	}

	public String getReg_date() {
		return reg_date;
	}

	public String getReg_id() {
		return reg_id;
	}

	public String getNickname() {
		return nickname;
	}
	

	public int getStar_empty() {
		return star_empty;
	}

	public int getStar_front() {
		return star_front;
	}

	public int getStar_end() {
		return star_end;
	}	
	
	public String getApi() {
		return api;
	}

	public void setApi(String api) {
		this.api = api;
	}
	//인덱스리뷰리스트
	public Review_dto(String s_no, String r_no, String attach_1, String s_name, String s_address,
			String profile_photo, String nickname, String star, String reg_date, String content, int star_front, int star_end, int star_empty)  {
		this.s_no = s_no;
		this.r_no = r_no;
		this.content = content;
		this.attach_1 = attach_1;
		this.star = star;
		this.reg_date = reg_date;
		this.s_name = s_name;
		this.s_address = s_address;
		this.nickname = nickname;
		this.profile_photo = profile_photo;
		this.star_front = star_front;
		this.star_end = star_end;
		this.star_empty = star_empty;
	}
	
//	//인덱스리뷰리스트
//	public Review_dto(String s_no, String r_no, String attach_1, String s_name, String s_address,
//			String profile_photo, String nickname, String star, String reg_date, String content, int star_empty)  {
//		super();
//		this.s_no = s_no;
//		this.r_no = r_no;
//		this.content = content;
//		this.attach_1 = attach_1;
//		this.star = star;
//		this.reg_date = reg_date;
//		this.s_name = s_name;
//		this.s_address = s_address;
//		this.nickname = nickname;
//		this.profile_photo = profile_photo;
//		this.star_empty = star_empty;
//	}
	
	//가게상세보기리뷰리스트
	public Review_dto(String nickname, String profile_photo, String r_no, String reg_date, String star, String content, 
			String attach_1, String attach_2, String attach_3, String attach_4, String attach_5, int star_front, int star_end, int star_empty) {
		this.content = content;
		this.r_no = r_no;
		this.attach_1 = attach_1;
		this.attach_2 = attach_2;
		this.attach_3 = attach_3;
		this.attach_4 = attach_4;
		this.attach_5 = attach_5;
		this.star = star;
		this.reg_date = reg_date;
		this.nickname = nickname;
		this.profile_photo = profile_photo;
		this.star_front = star_front;
		this.star_end = star_end;
		this.star_empty = star_empty;
	}
	
	//리뷰상세보기
	public Review_dto(String s_no, String reg_id, String reg_date, String star, String content, String attach_1, String attach_2, String attach_3, String attach_4,
			String attach_5, String s_name, String city_name, String local_name, String profile_photo, String nickname, int star_front, int star_end, int star_empty) {
		this.s_no = s_no;
		this.content = content;
		this.attach_1 = attach_1;
		this.attach_2 = attach_2;
		this.attach_3 = attach_3;
		this.attach_4 = attach_4;
		this.attach_5 = attach_5;
		this.star = star;
		this.reg_id = reg_id;
		this.reg_date = reg_date;
		this.s_name = s_name;
		this.nickname = nickname;
		this.profile_photo = profile_photo;
		this.city_name = city_name;
		this.local_name = local_name;
		this.star_front = star_front;
		this.star_end = star_end;
		this.star_empty = star_empty;
	}
	
	//자신이 쓴 리뷰 조회
	public Review_dto(String r_no, String s_no, String content, String attach_1, String attach_2, String attach_3,
			String attach_4, String attach_5, String star, String reg_date, String reg_id, String s_name,
			String s_address, int star_front, int star_end, int star_empty) {
		this.r_no = r_no;
		this.s_no = s_no;
		this.content = content;
		this.attach_1 = attach_1;
		this.attach_2 = attach_2;
		this.attach_3 = attach_3;
		this.attach_4 = attach_4;
		this.attach_5 = attach_5;
		this.star = star;
		this.reg_date = reg_date;
		this.reg_id = reg_id;
		this.s_name = s_name;
		this.s_address = s_address;
		this.star_front = star_front;
		this.star_end = star_end;
		this.star_empty = star_empty;
	}	
	
	
}
