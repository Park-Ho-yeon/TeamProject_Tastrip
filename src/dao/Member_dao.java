package dao;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import common.DBConnection;
import dto.Member_dto;
import dto.Store_dto;

public class Member_dao {
	Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	//로그인
	public Member_dto memberLogin(String id, String password) {
		Member_dto dto = null;
		String query = "select name, level_code, nickname, profile_photo, api \r\n" + 
				"from member \r\n" + 
				"where id='"+id+"' and password='"+password+"' and exit_gubun='N'";
		
		try {
			con = DBConnection.getConnection();
			ps	= con.prepareStatement(query);
			rs	= ps.executeQuery();
			if(rs.next()) {
				String name = rs.getString("name");
				String level_code = rs.getString("level_code");
				String nickname = rs.getString("nickname");
				String profile_photo = rs.getString("profile_photo");
				String api = rs.getString("api");
				dto = new Member_dto(name,level_code,nickname,profile_photo);
				dto.setApi(api);
			}
			
		} catch (Exception e) {
			System.out.println("memberLogin()오류"+query);
			e.printStackTrace();
		} finally {
			DBConnection.closeDB(con, ps, rs);
		}
		return dto;
	}
	
	//일반회원 회원가입
	public int memberSave(Member_dto dto) {
		int result = 0;
		String query = "insert into member\r\n" + 
				"(id, password, name, birth, tell_1, tell_2, tell_3, city_code, email_1, email_2, gender, nickname, profile_photo, reg_date, api)\r\n" + 
				"values\r\n" + 
				"('"+dto.getId()+"','"+dto.getPassword()+"','"+dto.getName()+"','"+dto.getBirth()+"','"+dto.getTell_1()+"','"+dto.getTell_2()+"','"+dto.getTell_3()+"','"+dto.getCity_code()+"','"+dto.getEmail_1()+"','"+dto.getEmail_2()+"','"+dto.getGender()+"','"+dto.getNickname()+"','"+dto.getProfile_photo()+"','"+dto.getReg_date()+"','" + dto.getApi() + "')";
		
		try {
			con = DBConnection.getConnection();
			ps	= con.prepareStatement(query);
			result = ps.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("memberSave()오류"+query);
			e.printStackTrace();
		} finally {
			DBConnection.closeDB(con, ps, rs);
		}
		return result;
	}
	
	//idCheck
	public int idCheck(String id) {
		int result = 0;
		String query ="select id from member where id='"+id+"'";
		
		try {
			con = DBConnection.getConnection();
			ps	= con.prepareStatement(query);
			rs	= ps.executeQuery();
			if(rs.next()) {
				result = 1;
			}
		} catch (Exception e) {
			System.out.println("idCheck()오류"+query);
			e.printStackTrace();
		} finally {
			DBConnection.closeDB(con, ps, rs);
		}
		return result;
	}
	
	//nicknameCheck
	public int nicknameCheck(String nickname) {
		int count = 0;
		String query ="select nickname from member where nickname='"+nickname+"'";
		
		try {
			con = DBConnection.getConnection();
			ps	= con.prepareStatement(query);
			rs	= ps.executeQuery();
			if(rs.next()) {
				count = 1;
			}
		} catch (Exception e) {
			System.out.println("nicknameCheck()오류"+query);
			e.printStackTrace();
		} finally {
			DBConnection.closeDB(con, ps, rs);
		}
		return count;
	}


	// 암호화
    public String encryptSHA256(String value) throws NoSuchAlgorithmException{
        String encryptData ="";
         
        MessageDigest sha = MessageDigest.getInstance("SHA-256");
        sha.update(value.getBytes());
 
        byte[] digest = sha.digest();
        for (int i=0; i<digest.length; i++) {
            encryptData += Integer.toHexString(digest[i] &0xFF).toUpperCase();
        }
         
        return encryptData;
    }
    
	// 마이페이지
 	public Member_dto myInfo(String id) {
 		Member_dto dto = null;
 		String query = "select member.id, member.profile_photo, member.nickname, member.name, decode(member.gender,'m','남자','f','여자') as gender,"
 						+ " to_char(member.birth,'yyyy-MM-dd') as birth, city.city_name, member.email_1, member.email_2, "
 						+ "member.tell_1, member.tell_2, member.tell_3, member.api"
 						+ " from member member, city_tbl city"
 						+ " where id = '"+id+"' and member.city_code=city.city_code";
 		try {
 			con = DBConnection.getConnection();
 			ps	= con.prepareStatement(query);
 			rs	= ps.executeQuery();
 			if(rs.next()) {
 				String photo = rs.getString("profile_photo");
 				String nickname = rs.getString("nickname");
 				String name = rs.getString("name");
 				String gender = rs.getString("gender");
 				String birth = rs.getString("birth");
 				String city = rs.getString("city_name");
 				String email = rs.getString("email_1");
 				String domain = rs.getString("email_2");
 				String mobile1 = rs.getString("tell_1");
 				String mobile2 = rs.getString("tell_2");
 				String mobile3 = rs.getString("tell_3");
 				String api = rs.getString("api");
 				dto = new Member_dto(id, photo, nickname, name, gender, birth, city, email, domain, mobile1, mobile2, mobile3);
 				dto.setApi(api);
 			}
 		} catch (Exception e) {
 			System.out.println("myInfo()오류"+query);
 			e.printStackTrace();
 		} finally {
 			DBConnection.closeDB(con, ps, rs);
 		}
 		return dto;
 	}

 	//내정보 수정 저장
 	public int memberUpdate(Member_dto dto) {
 		int result = 0;
 		String query = "update member \r\n" + 
 				"set profile_photo='"+dto.getProfile_photo()+"', nickname='"+dto.getNickname()+"', name='"+dto.getName()+"', gender='"+dto.getGender()+"', city_code='"+dto.getCity_code()+"', email_1='"+dto.getEmail_1()+"', email_2='"+dto.getEmail_2()+"', tell_1='"+dto.getTell_1()+"', tell_2='"+dto.getTell_2()+"', tell_3='"+dto.getTell_3()+"' \r\n" + 
 				"where id='"+dto.getId()+"'";

 		try {
 			con = DBConnection.getConnection();
 			ps	= con.prepareStatement(query);
 			result = ps.executeUpdate();
 			
 		} catch (Exception e) {
 			System.out.println("memberUpdate()오류"+query);
 			e.printStackTrace();
 		} finally {
 			DBConnection.closeDB(con, ps, rs);
 		}
 		return result;
 	}
 	
 	//내가 등록한 관심가게 가져오기
 	public ArrayList<Store_dto> StoreList(String reg_id,String sequence,String select,String search, int start,int end) {
		ArrayList<Store_dto> dtos = new ArrayList<>();
		String query ="select * from(\r\n" + 
				" select tbl.*,rownum as rnum from(\r\n" + 
				" select f.id, to_char(f.f_date,'yyyy-MM-dd')as f_date, s.star, s.s_no, s.s_name, s.s_address ,s.s_content, t1.theme_name, t2.theme_name as t2, t3.theme_name as t3 ,s.s_attach_1  from\r\n" + 
				" (\r\n" + 
				"    select s_no, s_name,(theme_code_1||theme_code_2||theme_code_3) as themes , city_code, local_code, menu_code from store\r\n" + 
				" )a, store s, theme_tbl t1, theme_tbl t2, theme_tbl t3, favorite_tbl f\r\n" + 
				" where f.id = '"+reg_id+"'\r\n" + 
				" and "+select+" like '%"+search+"%' \r\n" + 
				" and s.theme_code_1 = t1.theme_code and s.theme_code_2=t2.theme_code and s.theme_code_3=t3.theme_code\r\n" + 
				" and f.s_no = s.s_no\r\n" + 
				" and a.s_no = s.s_no\r\n" + 
				" order by "+sequence+"\r\n" + 
				" )tbl)\r\n" + 
				" where rnum >="+start+" and rnum <="+end;
		try {
			con = DBConnection.getConnection();
			ps  = con.prepareStatement(query);
			rs 	= ps.executeQuery();
			while(rs.next()) {
				String star		= rs.getString("star");
				String s_no 	= rs.getString("s_no");
				String s_name	= rs.getString("s_name");
				String s_address = rs.getString("s_address");
				String s_content = rs.getString("s_content");
				String theme_name_1 = rs.getString("theme_name");
				String theme_name_2 = rs.getString("t2");
				String theme_name_3 = rs.getString("t3");
				String s_attach_1 = rs.getString("s_attach_1");
				String f_date = rs.getString("f_date");
				
				int star_front = Integer.parseInt(star.substring(0,1));
				int star_end = Integer.parseInt(star.substring(2));
				int star_empty = 5-star_front;
				
				Store_dto dto = new Store_dto(star, s_no, s_name, s_address, s_content, 
										theme_name_1, theme_name_2, theme_name_3, s_attach_1, star_front, star_end, star_empty);
				dto.setF_date(f_date);
				dtos.add(dto);
			}
		}catch(Exception e) {
			System.out.println("StoreList 시스템 오류"+query);
			e.printStackTrace();
		}finally {
			DBConnection.closeDB(con, ps, rs);
		}
		
		return dtos;
	}

	//로그인 후 인덱스 화면용 갯수조회
	public int getTotalCount(String id) {
		int count =0;
		String query ="select count(*) as co\r\n" + 
				" from favorite_tbl\r\n" + 
				" where id = '"+id+"'";
			try {
				con =DBConnection.getConnection();
				ps = con.prepareStatement(query);
				rs =ps.executeQuery();
				if(rs.next()) {
					count = rs.getInt("co");
				}
				
			}catch(Exception e) {
				System.out.println("getTotalCount 오류"+query);
				e.printStackTrace();
			}finally {
				DBConnection.closeDB(con, ps, rs);
			}
		
		return count;
	}
	
	/*관심가게 체크 등록 해제 삼형제*/
	public int checkFav(String s_no, String id) {
		int result =0;
		String query ="select s_no, id\r\n" + 
				" from favorite_tbl\r\n" + 
				" where s_no = '"+s_no+"'\r\n" + 
				" and id = '"+id+"'";
		try {
 			con = DBConnection.getConnection();
 			ps	= con.prepareStatement(query);
 			result = ps.executeUpdate();
 			
 		} catch (Exception e) {
 			System.out.println("checkFav()오류"+query);
 			e.printStackTrace();
 		} finally {
 			DBConnection.closeDB(con, ps, rs);
 		}		
		return result;
	}
	public int saveFav(String s_no, String id, String f_date) {
		int result =0;
		String query ="insert into favorite_tbl\r\n" + 
				" (s_no, id, f_date)\r\n" + 
				" values\r\n" + 
				" ('"+s_no+"', '"+id+"', '"+f_date+"')";
		try {
 			con = DBConnection.getConnection();
 			ps	= con.prepareStatement(query);
 			result = ps.executeUpdate();
 			
 		} catch (Exception e) {
 			System.out.println("saveFav()오류"+query);
 			e.printStackTrace();
 		} finally {
 			DBConnection.closeDB(con, ps, rs);
 		}		
		return result;
	}
	public int delFav(String s_no, String id) {
		int result =0;
		String query ="delete from favorite_tbl\r\n" + 
				"where s_no = '"+s_no+"'\r\n" + 
				"and id = '"+id+"'";
		try {
 			con = DBConnection.getConnection();
 			ps	= con.prepareStatement(query);
 			result = ps.executeUpdate();
 			
 		} catch (Exception e) {
 			System.out.println("delFav()오류"+query);
 			e.printStackTrace();
 		} finally {
 			DBConnection.closeDB(con, ps, rs);
 		}		
		return result;
	}

	//사업자 회원 등록
	public int businessSave(Member_dto dto) {
		int result = 0;
		String query = "insert into member\r\n" + 
				"(id, password, name, birth, tell_1, tell_2, tell_3, city_code, email_1, email_2, gender, bs_no, reg_date, level_code)\r\n" + 
				"values\r\n" + 
				"('"+dto.getId()+"','"+dto.getPassword()+"','"+dto.getName()+"','"+dto.getBirth()+"','"+dto.getTell_1()+"','"+dto.getTell_2()+"',"
				+ "'"+dto.getTell_3()+"','"+dto.getCity_code()+"','"+dto.getEmail_1()+"','"+dto.getEmail_2()+"','"+dto.getGender()+"',"
				+ "'"+dto.getBs_no()+"','"+dto.getReg_date()+"','business')";
		
		try {
			con = DBConnection.getConnection();
			ps	= con.prepareStatement(query);
			result = ps.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("businessSave()오류"+query);
			e.printStackTrace();
		} finally {
			DBConnection.closeDB(con, ps, rs);
		}
		return result;
	}
	
	//일반 멤버 탈퇴
	public int MemberExit(String id, String exit_date) {
		int result = 0;
		String query = "UPDATE member \r\n"
					+ "SET exit_gubun = 'Y',\r\n"
					+ "    exit_date = '" + exit_date + "'\r\n"
					+ "WHERE id = '" + id + "'";
		
		try {
			con = DBConnection.getConnection();
			ps	= con.prepareStatement(query);
			result = ps.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("MemberExit() 오류 : " + query );
			e.printStackTrace();
		}finally {
			DBConnection.closeDB(con, ps, rs);
		}
		
		return result;
	}
	
	//마이페이지 갯수조회
	public int getFavTotalCount(String id,String select, String search) {
		int count =0;
		String query ="select count(*) as co\r\n" + 
				" from favorite_tbl f ,store s\r\n" + 
				" where f.id = '"+id+"'\r\n" + 
				" and f.s_no = s.s_no\r\n" + 
				" and "+select+" like '%"+search+"%'";
		
			try {
				con =DBConnection.getConnection();
				ps = con.prepareStatement(query);
				rs =ps.executeQuery();
				if(rs.next()) {
					count = rs.getInt("co");
				}
				
			}catch(Exception e) {
				System.out.println("getFavTotalCount 오류"+query);
				e.printStackTrace();
			}finally {
				DBConnection.closeDB(con, ps, rs);
			}
		
		return count;
	}
	
	
	/*--------------Admin---------------*/
	
	//사업자 목록 조회
	public ArrayList<Member_dto> businessList(String select, String search,int start,int end,String t_desc) {
		ArrayList<Member_dto>dtos = new ArrayList<>();
		String query =" select * from(\r\n" + 
				" select tbl.*,rownum as rnum  from(\r\n" + 
				" select  level_code,bs_no,id,m.name,to_char(reg_date,'yyyy-MM-dd')as reg_date\r\n" + 
				" from member m \r\n" + 
				" where m.level_code = 'business'\r\n" + 
				" and "+select+" like '%"+search+"%'\r\n" + 
				" order by "+t_desc+"\r\n" + 
				"  )tbl)\r\n" + 
				" where rnum >="+start+" and rnum <="+end;
		try {
			con =DBConnection.getConnection();
			ps = con.prepareStatement(query);
			rs =ps.executeQuery();
			while(rs.next()) {
				String bs_no = rs.getString("bs_no");
				String id = rs.getString("id");
				String name = rs.getString("name");
				String reg_date = rs.getString("reg_date");
				
				Member_dto dto = new Member_dto(bs_no,id,name,reg_date,"");
				dtos.add(dto);
			}
			
		}catch(Exception e) {
			System.out.println("businessList 조회 오류"+query);
			e.printStackTrace();
		}finally {
			DBConnection.closeDB(con, ps, rs);
		}
		
		return dtos;
	}
	
	//일반회원 조회
	public ArrayList<Member_dto> memberList(int start,int end,String select,String search,String orderby) {
		ArrayList<Member_dto> dtos = new ArrayList<>();
		String query =" select * from(\r\n" + 
				" select tbl.*,rownum as rnum from(\r\n" + 
				" select m.level_code,m.profile_photo,m.nickname,m.id,m.name,to_char(m.reg_date,'yyyy-MM-dd')as reg_date,"+
				" nvl(r.rcount,'0')as rcount, nvl(f.fcount,'0')as fcount, m.api \r\n" + 
				" from member m,\r\n" + 
				"    (select reg_id, count(*) as rcount from review group by reg_id) r,\r\n" + 
				"    (select id, count(*) as fcount from favorite_tbl group by id) f\r\n" + 
				" where level_code = 'member' and m.id = r.reg_id(+) and m.id = f.id(+)\r\n" + 
				"    and m.exit_gubun = 'N'\r\n" + 
				"    and "+select+" like '%"+search+"%'\r\n" + 
				" order by "+orderby+"\r\n" + 
				"  )tbl)where rnum >="+start+" and rnum <="+end;
		
			try {
				con =DBConnection.getConnection();
				ps = con.prepareStatement(query);
				rs =ps.executeQuery();
				while(rs.next()) {
					String profile_photo = rs.getString("profile_photo");
					String nickname = rs.getString("nickname");
					String id = rs.getString("id");
					String name = rs.getString("name");
					String reg_date = rs.getString("reg_date");
					String rcount = rs.getString("rcount");
					String fcount = rs.getString("fcount");
					String api = rs.getString("api");
					
					Member_dto dto = new Member_dto(profile_photo, nickname,id, name,reg_date,rcount,fcount);
					dto.setApi(api);
					dtos.add(dto);
				}
				
			}catch(Exception e) {
				System.out.println("memberList 조회 오류"+query);
				e.printStackTrace();
			}finally {
				DBConnection.closeDB(con, ps, rs);
			}
		return dtos;
	}

	//탈퇴한 일반회원 조회
	public ArrayList<Member_dto> memberOutList(String select,String search,int start,int end,String t_desc) {
		ArrayList<Member_dto> dtos =new ArrayList<>();
		String query="select * from(\r\n" + 
				" select tbl.*,rownum as rnum from(\r\n" + 
				" select api,level_code,profile_photo,nickname,id,name,to_char(reg_date,'yyyy-MM-dd')as reg_date,to_char(exit_date,'yyyy-MM-dd')as exit_date\r\n" + 
				" from member\r\n" + 
				" where level_code = 'member'\r\n" + 
				" and exit_gubun ='Y'\r\n" + 
				" and "+select+" like '%"+search+"%'\r\n" + 
				" order by "+t_desc+"\r\n" + 
				" )tbl)\r\n" + 
				" where rnum >="+start+" and rnum <="+end;
			try {
				con =DBConnection.getConnection();
				ps = con.prepareStatement(query);
				rs =ps.executeQuery();
				while(rs.next()) {
					String profile_photo = rs.getString("profile_photo");
					String nickname = rs.getString("nickname");
					String id = rs.getString("id");
					String name = rs.getString("name");
					String reg_date = rs.getString("reg_date");
					String exit_date = rs.getString("exit_date");
					String api = rs.getString("api");
					
					Member_dto dto = new Member_dto(profile_photo, nickname,id, name,reg_date,"","");
					dto.setExit_date(exit_date);
					dto.setApi(api);
					dtos.add(dto);
				}
				
			}catch(Exception e) {
				System.out.println("memberOutList 조회 오류"+query);
				e.printStackTrace();
			}finally {
				DBConnection.closeDB(con, ps, rs);
			}
			
		return dtos;
	}

	//회원 or 사업자 목록 조회 갯수 조회
	public int getMemberTotalCount(String code,String select,String search) {
		int count =0;
		String query ="select count(*) as co\r\n" + 
				" from member m\r\n" + 
				" where m.level_code like '%"+code+"%'\r\n" +
				" and "+select+" like '%"+search+"%'";
			try {
				con =DBConnection.getConnection();
				ps = con.prepareStatement(query);
				rs =ps.executeQuery();
				if(rs.next()) {
					count = rs.getInt("co");
				}
				
			}catch(Exception e) {
				System.out.println("getMemberTotalCount 오류"+query);
				e.printStackTrace();
			}finally {
				DBConnection.closeDB(con, ps, rs);
			}
		return count;
	}
	
	//탈퇴한 회원 목록조회	
	public int getOutMemberCount(String select, String search) {
		int count =0;
		String query =" select count(*) as co\r\n" + 
				" from member\r\n" + 
				" where level_code = 'member'\r\n" + 
				" and "+select+" like '%"+search+"%'\r\n" +
				" and exit_gubun = 'Y'";
			try {
				con =DBConnection.getConnection();
				ps = con.prepareStatement(query);
				rs =ps.executeQuery();
				if(rs.next()) {
					count = rs.getInt("co");
				}
				
			}catch(Exception e) {
				System.out.println("탈퇴한 회원 목록조회 오류"+query);
				e.printStackTrace();
			}finally {
				DBConnection.closeDB(con, ps, rs);
			}
		return count;
	}
	
	//일반회원 DB에서 삭제
	public int MemberDelect(String id) {
		int result =0;
		String query ="delete member\r\n" + 
				"where id = '"+id+"'";
			try {
				con =DBConnection.getConnection();
				ps = con.prepareStatement(query);
				result =ps.executeUpdate();
			}catch(Exception e) {
				System.out.println("일반회원 DB에 삭제 오류"+query);
				e.printStackTrace();
			}finally {
				DBConnection.closeDB(con, ps, rs);
			}
		return result;
	}
	
	
	/*------------BUSINESS------------*/
	//사업자 마이페이지
	public Member_dto BsmyInfo(String id) {
		Member_dto dto = null;
		String query ="select id, name, to_char(birth,'yyyy-MM-dd') as birth, decode(gender,'f','여자','m','남자') as gender, city_code,"
						+ " email_1, email_2, tell_1, tell_2, tell_3, bs_no "
						+ "from member "
						+ "where id='"+id+"'";
		try {
			con = DBConnection.getConnection();
			ps	= con.prepareStatement(query);
			rs	= ps.executeQuery();
			if(rs.next()) {
				String name = rs.getString("name");
				String birth = rs.getString("birth");
				String gender = rs.getString("gender");
				String city_code = rs.getString("city_code");
				String email_1 = rs.getString("email_1");
				String email_2 = rs.getString("email_2");
				String tell_1 = rs.getString("tell_1");
				String tell_2 = rs.getString("tell_2");
				String tell_3 = rs.getString("tell_3");
				String bs_no = rs.getString("bs_no");
				dto = new Member_dto(name, birth,tell_1, tell_2, tell_3, city_code, email_1, email_2, gender, bs_no);
			}
		} catch (Exception e) {
			System.out.println("BsmyInfo()오류"+query);
				e.printStackTrace();
				} finally {
				DBConnection.closeDB(con, ps, rs);
			}
			
			return dto;
	}
	
	//사업자 정보 업데이트
	public int BsmyInfoUpdate(String id, Member_dto dto) {
		int result = 0;
		String query = "update member set name='"+dto.getName()+"', gender='"+dto.getGender()+"', city_code='"+dto.getCity_code()+"', email_1='"+dto.getEmail_1()+"', email_2='"+dto.getEmail_2()+"', tell_1='"+dto.getTell_1()+"', tell_2='"+dto.getTell_2()+"', tell_3='"+dto.getTell_3()+"' where id='"+id+"'";
		try {
			con = DBConnection.getConnection();
			ps	= con.prepareStatement(query);
			result = ps.executeUpdate();
		} catch (Exception e) {
			System.out.println("BsmyInfoUpdate()오류"+query);
			e.printStackTrace();
		} finally {
			DBConnection.closeDB(con, ps, rs);
		}
		
		return result;
	}

	//네이버 로그인 회원 탈퇴
	public String NaverExit(String id) {
		String gubun = "";
		String query = "SELECT exit_gubun \r\n"
					+ "FROM member\r\n"
					+ "where id = '" + id + "'";
		
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				gubun = rs.getString("exit_gubun");
			}
			
		} catch (Exception e) {
			System.out.println("NaverExit()오류"+query);
			e.printStackTrace();
		}finally {
			DBConnection.closeDB(con, ps, rs);
		}
		
		return gubun;
	}
	
	//지역 셀렉트박스 불러오기
   @SuppressWarnings("unchecked")
   public JSONArray getLocPlz(String plz) {
         String query ="select * from local_tbl\r\n" + 
               " where local_code like '"+plz+"'";
         
         JSONArray array = new JSONArray();

         try {
            con =DBConnection.getConnection();
            ps = con.prepareStatement(query);
            rs =ps.executeQuery();
            
            while(rs.next()) {
              JSONObject obj = new JSONObject();
               obj.put("code", rs.getString("local_code"));
               obj.put("name", rs.getString("local_name"));
               
               array.add(obj);
            }
            
         }catch(Exception e) {
            System.out.println("getLocPlz() 오류"+query);
            e.printStackTrace();
         }finally {
            DBConnection.closeDB(con, ps, rs);
         }
         
         return array;
      }

   	public ArrayList<Store_dto> getLocalList(String k){
   		ArrayList<Store_dto> dtos = new ArrayList<Store_dto>();
   		String query ="select * from local_tbl\r\n" + 
                " where local_code like '"+k+"'";
   		
	   	 try {
	         con =DBConnection.getConnection();
	         ps = con.prepareStatement(query);
	         rs =ps.executeQuery();
	         
	         while(rs.next()) {
	        	String common_code = rs.getString("local_code");
				String common_name = rs.getString("local_name");
				Store_dto dto = new Store_dto(common_code, common_name);
				dtos.add(dto);
	         }
	         
	      }catch(Exception e) {
	         System.out.println("getLocalList() 오류"+query);
	         e.printStackTrace();
	      }finally {
	         DBConnection.closeDB(con, ps, rs);
	      }
   	 
   	 	return dtos;
   	}
}

