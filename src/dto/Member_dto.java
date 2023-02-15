package dto;

public class Member_dto {
		String id, password, password_confirm, name, birth, tell_1, tell_2, tell_3, city_code, email_1, email_2,
			   gender, nickname, profile_photo, reg_date, exit_date, level_code, bs_no, s_no, f_date, rcount,fcount,api;

		
		//로그인
		public Member_dto(String name, String level_code, String nickname, String profile_photo) {
			this.name = name;
			this.level_code = level_code;
			this.nickname = nickname;
			this.profile_photo = profile_photo;
		}

		//일반회원 조회
		public Member_dto(String profile_photo,String nickname,String id, String name,String reg_date,String rcount,String fcount) {
			this.profile_photo = profile_photo;
			this.nickname = nickname;
			this.id = id;
			this.name = name;
			this.reg_date = reg_date;
			this.rcount = rcount;
			this.fcount = fcount;
		}
		
		//사업자 목록조회
		public Member_dto(String bs_no,String id, String name, String reg_date, String level_code) {
			this.bs_no = bs_no;
			this.id = id;
			this.name = name;
			this.reg_date = reg_date;
			this.level_code = level_code;
		}
		
		//멤버 회원가입
		public Member_dto(String id, String password, String name, String birth, String gender, 
				String city_code, String email_1, String email_2, String tell_1,
				String tell_2, String tell_3, String profile_photo, String reg_date, String nickname) {
			this.id = id;
			this.password = password;
			this.name = name;
			this.birth = birth;
			this.tell_1 = tell_1;
			this.tell_2 = tell_2;
			this.tell_3 = tell_3;
			this.city_code = city_code;
			this.email_1 = email_1;
			this.email_2 = email_2;
			this.gender = gender;
			this.nickname = nickname;
			this.profile_photo = profile_photo;
			this.reg_date = reg_date;
		}
		
		//멤버 정보 뷰
		public Member_dto(String id, String profile_photo, String nickname, String name,
				String gender, String birth, String city_code, String email_1, String email_2, String tell_1, String tell_2, String tell_3) {
			this.id = id;
			this.profile_photo = profile_photo;
			this.nickname = nickname;
			this.name = name;
			this.gender = gender;
			this.birth = birth;
			this.city_code = city_code;
			this.email_1 = email_1;
			this.email_2 = email_2;
			this.tell_1 = tell_1;
			this.tell_2 = tell_2;
			this.tell_3 = tell_3;
		}
		
		//멤버 정보 수정
		public Member_dto(String id, String profile_photo, String nickname, String name, String gender, String city_code, String email_1, 
				String email_2,String tell_1, String tell_2, String tell_3
				) {
			this.id = id;
			this.profile_photo = profile_photo;
			this.nickname = nickname;
			this.name = name;
			this.gender = gender;
			this.city_code = city_code;
			this.email_1 = email_1;
			this.email_2 = email_2;
			this.tell_1 = tell_1;
			this.tell_2 = tell_2;
			this.tell_3 = tell_3;
		}

		
		//관심가게 체크용
		public Member_dto(String id, String s_no, String f_date) {
			this.id = id;
			this.s_no = s_no;
			this.f_date = f_date;
		}
		
		//사업자 회원가입
		public Member_dto(String id, String password, String name, String birth, String gender, String city_code, String email_1,
				String email_2,String tell_1, String tell_2, String tell_3, String reg_date, String bs_no) {
			this.id = id;
			this.password = password;
			this.name = name;
			this.birth = birth;
			this.gender = gender;
			this.city_code = city_code;
			this.email_1 = email_1;
			this.email_2 = email_2;
			this.tell_1 = tell_1;
			this.tell_2 = tell_2;
			this.tell_3 = tell_3;
			this.reg_date = reg_date;
			this.bs_no = bs_no;
		}
		
		//사업자 마이페이지
		public Member_dto(String name, String birth, String tell_1, String tell_2, String tell_3,
				String city_code, String email_1, String email_2, String gender, String bs_no) {
			super();
			this.name = name;
			this.birth = birth;
			this.tell_1 = tell_1;
			this.tell_2 = tell_2;
			this.tell_3 = tell_3;
			this.city_code = city_code;
			this.email_1 = email_1;
			this.email_2 = email_2;
			this.gender = gender;
			this.bs_no = bs_no;
		}

		//사업자 수정	
		public Member_dto(String name, String gender, String city_code, String email_1, String email_2,
					 String tell_1, String tell_2, String tell_3) {
			this.name = name;
			this.tell_1 = tell_1;
			this.tell_2 = tell_2;
			this.tell_3 = tell_3;
			this.city_code = city_code;
			this.email_1 = email_1;
			this.email_2 = email_2;
			this.gender = gender;
		}

		public String getId() {
			return id;
		}

		public String getPassword() {
			return password;
		}

		public String getName() {
			return name;
		}

		public String getBirth() {
			return birth;
		}

		public String getTell_1() {
			return tell_1;
		}

		public String getTell_2() {
			return tell_2;
		}

		public String getTell_3() {
			return tell_3;
		}

		public String getCity_code() {
			return city_code;
		}

		public String getEmail_1() {
			return email_1;
		}

		public String getEmail_2() {
			return email_2;
		}

		public String getGender() {
			return gender;
		}

		public String getNickname() {
			return nickname;
		}

		public String getProfile_photo() {
			return profile_photo;
		}

		public String getReg_date() {
			return reg_date;
		}

		public String getExit_date() {
			return exit_date;
		}

		public String getLevel_code() {
			return level_code;
		}
		
		public String getBs_no() {
			return bs_no;
		}

		public String getPassword_confirm() {
			return password_confirm;
		}

		public String getS_no() {
			return s_no;
		}

		public String getF_date() {
			return f_date;
		}

		public String getRcount() {
			return rcount;
		}

		public String getFcount() {
			return fcount;
		}

		public void setExit_date(String exit_date) {
			this.exit_date = exit_date;
		}
		
		public String getApi() {
			return api;
		}

		public void setApi(String api) {
			this.api = api;
		}
		
		public void setLevel_code(String level_code) {
			this.level_code = level_code;
		}
		
		
}
