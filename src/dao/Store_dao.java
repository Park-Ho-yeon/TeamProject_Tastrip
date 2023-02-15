package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.DecimalFormat;
import java.util.ArrayList;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import common.DBConnection;
import dto.Store_dto;

public class Store_dao {
	Connection  		con=null;
	PreparedStatement   ps=null;
	ResultSet 			rs =null;
	
	/*테마 목록 가져오기*/
	public ArrayList<Store_dto> getThemeList() {
		ArrayList<Store_dto> dtos = new ArrayList<>();
		String query ="select theme_code,theme_name \r\n" + 
				"from jsl54_taste.theme_tbl";
			try {
				con = DBConnection.getConnection();
				ps  = con.prepareStatement(query);
				rs 	= ps.executeQuery();
				while(rs.next()) {
					String common_theme = rs.getString("theme_code");
					String common_name = rs.getString("theme_name");
					
					Store_dto dto =new Store_dto(common_theme, common_name);
					
					dtos.add(dto);
				}
			}catch(Exception e) {
				System.out.println("getThemeList() 오류 : "+query);
				e.printStackTrace();
			}finally {
				DBConnection.closeDB(con, ps, rs);
			}
		return dtos;
	}
	
	/*도시 목록 가져오기*/
	public ArrayList<Store_dto> getCityList() {
		ArrayList<Store_dto> dtos = new ArrayList<Store_dto>();
		String query ="select city_code, city_name from city_tbl ";
		
		try {
			con = DBConnection.getConnection();
			ps	= con.prepareStatement(query);
			rs	= ps.executeQuery();
			while(rs.next()) {
				String common_code = rs.getString("city_code");
				String common_name = rs.getString("city_name");
				Store_dto dto = new Store_dto("","city",common_code, common_name);
				dtos.add(dto);
			}
		} catch (Exception e) {
			System.out.println("getCityList()오류:" + query);
			e.printStackTrace();
		} finally {
			DBConnection.closeDB(con, ps, rs);
		}
		return dtos;
	}
		
	/*도시 목록 가져오기*/
	public ArrayList<Store_dto> getAllTblList() {
		ArrayList<Store_dto> dtos = new ArrayList<Store_dto>();
		String query ="select city_code, city_name from city_tbl ";
		
		try {
System.out.println("11111111111111111111");
			con = DBConnection.getConnection();
			ps	= con.prepareStatement(query);
			rs	= ps.executeQuery();
			while(rs.next()) {
				String common_code = rs.getString("city_code");
				String common_name = rs.getString("city_name");
				Store_dto dto = new Store_dto("","city",common_code, common_name);
				dtos.add(dto);
			}
System.out.println("222222222222222222222");
			query ="select theme_code,theme_name \r\n" + 
					"from jsl54_taste.theme_tbl";
			ps	= con.prepareStatement(query);
			rs	= ps.executeQuery();
			while(rs.next()) {
				String common_code = rs.getString("theme_code");
				String common_name = rs.getString("theme_name");
				Store_dto dto = new Store_dto("","theme",common_code, common_name);
				dtos.add(dto);	
			
			}
System.out.println("333333333333333333333333");
			query ="select menu_code,menu_name\r\n" + 
					" from menu_tbl";
			ps	= con.prepareStatement(query);
			rs	= ps.executeQuery();
			while(rs.next()) {
				String common_code = rs.getString("menu_code");
				String common_name = rs.getString("menu_name");
				Store_dto dto = new Store_dto("","menu",common_code, common_name);
				dtos.add(dto);	
			
			}
		} catch (Exception e) {
			System.out.println("getCityList()오류:" + query);
			e.printStackTrace();
		} finally {
			DBConnection.closeDB(con, ps, rs);
		}
		
		return dtos;
	}
	
	/*구 목록 가져오기*/
	public  ArrayList<Store_dto> getLocalList() {
		ArrayList<Store_dto> dtos = new ArrayList<Store_dto>();
		String query ="select local_code, local_name from local_tbl ";
		
		try {
			con = DBConnection.getConnection();
			ps	= con.prepareStatement(query);
			rs	= ps.executeQuery();
			while(rs.next()) {
				String common_code = rs.getString("local_code");
				String common_name = rs.getString("local_name");
				Store_dto dto = new Store_dto(common_code, common_name);
				dtos.add(dto);
			}
		} catch (Exception e) {
			System.out.println("getLocalList()오류:" + query);
			e.printStackTrace();
		} finally {
			DBConnection.closeDB(con, ps, rs);
		}
		
		return dtos;
	}
	
	/*메뉴 목록 가져오기*/
	public ArrayList<Store_dto> getMenuList() {
		ArrayList<Store_dto> dtos = new ArrayList<>();
		String query ="select menu_code,menu_name\r\n" + 
						" from menu_tbl";
		try {
			con = DBConnection.getConnection();
			ps  = con.prepareStatement(query);
			rs 	= ps.executeQuery();
			while(rs.next()) {
				String common_code = rs.getString("menu_code");
				String common_name = rs.getString("menu_name");
				
				Store_dto dto =new Store_dto(common_code, common_name);
				
				dtos.add(dto);
			}
		}catch(Exception e) {
			System.out.println("getMenuList 오류"+query);
			e.printStackTrace();
		}finally {
			DBConnection.closeDB(con, ps, rs);
		}
		
		return dtos;
	}
	
	/*가게 리스트 - 검색결과*/
	public ArrayList<Store_dto> StoreList(String city_code, String local_code, String menu_code, String keyword, String theme_1,  String theme_2, String theme_3, String pageNum, String order) {
		ArrayList<Store_dto>dtos = new ArrayList<>();
		String query = "select * from(\r\n" + 
				" select tbl.*,rownum as rnum from(" +
				" select * from(" +
				"select s.review_count, s.star, s.s_no, s.s_name, s.s_address ,s.s_content, c.city_name, l.local_name, t1.theme_name, t2.theme_name as t2, t3.theme_name as t3 ,s.s_attach_1  from\r\n" + 
				" (\r\n" + 
				"    select s_no, s_name, (s_menu_1||s_menu_2||s_menu_3||s_menu_4||s_menu_5) as menus,\r\n" + 
				"    (theme_code_1||theme_code_2||theme_code_3) as themes , city_code, local_code, menu_code from store\r\n" + 
				" )a, store s, theme_tbl t1, theme_tbl t2, theme_tbl t3, city_tbl c, local_tbl l, menu_tbl m\r\n" + 
				" where c.city_code like '%"+city_code+"%' and l.local_code like '%"+local_code+"%' and m.menu_code like '%"+menu_code+"%'\r\n" + 
				" and (a.s_name like '%"+keyword+"%' or a.menus like '%"+keyword+"%' or m.menu_name like '%"+keyword+"%')\r\n" + 
				" and (a.themes like '%"+theme_1+"%' and a.themes like '%"+theme_2+"%' and a.themes like '%"+theme_3+"%')\r\n" + 
				" and s.city_code=c.city_code and s.local_code=l.local_code\r\n" + 
				" and s.theme_code_1 = t1.theme_code and s.theme_code_2=t2.theme_code and s.theme_code_3=t3.theme_code\r\n" + 
				" and a.s_no=s.s_no and a.menu_code=m.menu_code\r\n" + 
				" and s.admin_check='Y'\r\n" + 
				" and s.close_check='N'\r\n" + 
				" order by "+order+")\r\n" +
				"  )tbl)\r\n" +
				"where rownum<="+pageNum;
			try {
				con = DBConnection.getConnection();
				ps  = con.prepareStatement(query);
				rs 	= ps.executeQuery();
				while(rs.next()) {
					String star		= rs.getString("star");
					String s_no 	= rs.getString("s_no");
					String s_name	 = rs.getString("s_name");
					String s_address = rs.getString("s_address");
					String s_content = rs.getString("s_content");
					String theme_name_1 = rs.getString("theme_name");
					String theme_name_2 = rs.getString("t2");
					String theme_name_3 = rs.getString("t3");
					String s_attach_1 = rs.getString("s_attach_1");
					String review_count = rs.getString("review_count");
					
					int star_front = Integer.parseInt(star.substring(0,1));
					int star_end = Integer.parseInt(star.substring(2));
					int star_empty = 5-star_front;
					
					Store_dto dto = new Store_dto(star, s_no, s_name, s_address, s_content, 
											theme_name_1, theme_name_2, theme_name_3, s_attach_1, star_front, star_end, star_empty);
					dtos.add(dto);
					dto.setReview_count(review_count);
					
				}
			}catch(Exception e) {
				System.out.println("Store Theme List 시스템 오류"+query);
				e.printStackTrace();
			}finally {
				DBConnection.closeDB(con, ps, rs);
			}
		
		return dtos;
	}
	
	//ajax용 더보기 가게조회
	public ArrayList<Store_dto> AjaxStoreList(String id, String city_code, String local_code, String menu_code, String keyword, String theme_1,  String theme_2, String theme_3, String start, String end, String order) {
		ArrayList<Store_dto> dtos = new ArrayList<Store_dto>();
		String query = 
				" select * from(\r\n" + 
				" select tbl.*,rownum as rnum from(\r\n"+
				" select * from(" +
				" select case when exists( select * from favorite_tbl where s_no = s.s_no and id like '"+id+"') then 'Y' end f_check, s.review_count, s.star, s.s_no, s.s_name, s.s_address ,s.s_content, c.city_name, l.local_name, t1.theme_name, t2.theme_name as t2, t3.theme_name as t3 ,s.s_attach_1  from\r\n" + 
				" (\r\n" + 
				"    select s_no, s_name, (s_menu_1||s_menu_2||s_menu_3||s_menu_4||s_menu_5) as menus,\r\n" + 
				"    (theme_code_1||theme_code_2||theme_code_3) as themes , city_code, local_code, menu_code from store\r\n" + 
				" )a, store s, theme_tbl t1, theme_tbl t2, theme_tbl t3, city_tbl c, local_tbl l, menu_tbl m\r\n" + 
				" where c.city_code like '%"+city_code+"%' and l.local_code like '%"+local_code+"%' and m.menu_code like '%"+menu_code+"%'\r\n" + 
				" and (a.s_name like '%"+keyword+"%' or a.menus like '%"+keyword+"%' or m.menu_name like '%"+keyword+"%')\r\n" + 
				" and (a.themes like '%"+theme_1+"%' and a.themes like '%"+theme_2+"%' and a.themes like '%"+theme_3+"%')\r\n" + 
				" and s.city_code=c.city_code and s.local_code=l.local_code\r\n" + 
				" and s.theme_code_1 = t1.theme_code and s.theme_code_2=t2.theme_code and s.theme_code_3=t3.theme_code\r\n" + 
				" and a.s_no=s.s_no and a.menu_code=m.menu_code\r\n" + 
				" and s.admin_check='Y'\r\n" + 
				" and s.close_check='N'\r\n" + 
				" order by "+order+")\r\n" +
				"  )tbl)\r\n" + 
				" where rnum >"+start+" and rnum <="+end;
		
		try {
			con = DBConnection.getConnection();
			ps  = con.prepareStatement(query);
			rs 	= ps.executeQuery();
			while(rs.next()) {
				String star		= rs.getString("star");
				String s_no 	= rs.getString("s_no");
				String s_name	 = rs.getString("s_name");
				String s_address = rs.getString("s_address");
				String s_content = rs.getString("s_content");
				String theme_name_1 = rs.getString("theme_name");
				String theme_name_2 = rs.getString("t2");
				String theme_name_3 = rs.getString("t3");
				String s_attach_1 = rs.getString("s_attach_1");
				String review_count = rs.getString("review_count");
				String f_check = rs.getString("f_check");
				
				int star_front = Integer.parseInt(star.substring(0,1));
				int star_end = Integer.parseInt(star.substring(2));
				int star_empty = 5-star_front;
				
				Store_dto dto = new Store_dto(star, s_no, s_name, s_address, s_content, 
						theme_name_1, theme_name_2, theme_name_3, s_attach_1, star_front, star_end, star_empty);
				dtos.add(dto);
				dto.setReview_count(review_count);
				dto.setF_check(f_check);
			}
		}catch(Exception e) {
			System.out.println("AjaxStoreList 시스템 오류"+query);
			e.printStackTrace();
		}finally {
			DBConnection.closeDB(con, ps, rs);
		}
		
		return dtos;
	}
	
	
	// 가게 리스트 토탈카운트
	public int getListCount(String city_code, String local_code, String menu_code, String keyword, String theme_1,
			String theme_2, String theme_3, String pageNum, String order) {
		int count = 0;
		String query = "select count(*) as co from(" +
				"select s.review_count, s.star, s.s_no, s.s_name, s.s_address ,s.s_content, c.city_name, l.local_name, t1.theme_name, t2.theme_name as t2, t3.theme_name as t3 ,s.s_attach_1  from\r\n" + 
				" (\r\n" + 
				"    select s_no, s_name, (s_menu_1||s_menu_2||s_menu_3||s_menu_4||s_menu_5) as menus,\r\n" + 
				"    (theme_code_1||theme_code_2||theme_code_3) as themes , city_code, local_code, menu_code from store\r\n" + 
				" )a, store s, theme_tbl t1, theme_tbl t2, theme_tbl t3, city_tbl c, local_tbl l, menu_tbl m\r\n" + 
				" where c.city_code like '%"+city_code+"%' and l.local_code like '%"+local_code+"%' and m.menu_code like '%"+menu_code+"%'\r\n" + 
				" and (a.s_name like '%"+keyword+"%' or a.menus like '%"+keyword+"%' or m.menu_name like '%"+keyword+"%')\r\n" + 
				" and (a.themes like '%"+theme_1+"%' and a.themes like '%"+theme_2+"%' and a.themes like '%"+theme_3+"%')\r\n" + 
				" and s.city_code=c.city_code and s.local_code=l.local_code\r\n" + 
				" and s.theme_code_1 = t1.theme_code and s.theme_code_2=t2.theme_code and s.theme_code_3=t3.theme_code\r\n" + 
				" and a.s_no=s.s_no and a.menu_code=m.menu_code\r\n" + 
				" and s.admin_check='Y'\r\n" + 
				" and s.close_check='N'\r\n" + 
				" order by "+order+")";
		try {
			con =DBConnection.getConnection();
			ps = con.prepareStatement(query);
			rs =ps.executeQuery();
			if(rs.next()) {
				count = rs.getInt("co");
			}
			
		}catch(Exception e) {
			System.out.println("getListCount 오류"+query);
			e.printStackTrace();
		}finally {
			DBConnection.closeDB(con, ps, rs);
		}
			
		return count;
	}
	
	//관심 등록 순 가게리스트
	public ArrayList<Store_dto> getStoreFavList() {
		ArrayList<Store_dto> dtos = new ArrayList<Store_dto>();
		String query ="select a.s_no, a.s_attach_1, a.s_name,  a.star, a.s_content,\r\n" + 
				"        a.s_address, b.theme_name as theme_name_1 , c.theme_name as theme_name_2 , d.theme_name as theme_name_3, e.count          \r\n" + 
				" from store a, theme_tbl b, theme_tbl c, theme_tbl d, (select s_no, count(*) as count from favorite_tbl group by s_no) e\r\n" + 
				" where a.theme_code_1 = b.theme_code\r\n" + 
				" and a.theme_code_2 = c.theme_code\r\n" + 
				" and a.theme_code_3 = d.theme_code\r\n" + 
				" and a.s_no = e.s_no\r\n" + 
				" order by e.count desc";
		
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			while(rs.next()) {	
				String s_no 		= rs.getString("s_no");
				String s_attach 	= rs.getString("s_attach_1");
				String s_name 		= rs.getString("s_name");
				String star 		= rs.getString("star");
				String s_content	= rs.getString("s_content");
				String s_address 	= rs.getString("s_address");
				String theme_name_1 = rs.getString("theme_name_1");
				String theme_name_2 = rs.getString("theme_name_2");
				String theme_name_3 = rs.getString("theme_name_3");
				String favCount		= rs.getString("count");
				
				int star_front = Integer.parseInt(star.substring(0,1));
				int star_end = Integer.parseInt(star.substring(2));
				int star_empty = 5-star_front;
				
				Store_dto dto = new Store_dto(s_no, s_attach, s_name, star, s_content, s_address, theme_name_1,
											theme_name_2, theme_name_3, favCount, star_front, star_end, star_empty);
				dtos.add(dto);
			}
		}catch(Exception e) {
			System.out.println("getFavCheck() 오류: " +query);
			e.printStackTrace();
		}finally {
			DBConnection.closeDB(con, ps, rs);
		}
		
		return dtos;
	}
	
	/*코드 - 네임 변환*/
	public String CodeNameChange(String tableName, String MolaColumn, String AraColumn, String AraValue) {
		// MolaColumn : 알아내고싶은 코드or네임 컬럼이름
		// AraColumn : 값을 알고있는 코드or네임 컬럼이름
		// AraValue : 검색조건에 넣을 값
		
		String result="";
		String query="select "+MolaColumn+", "+AraColumn+"\r\n" + 
				" from "+tableName+"\r\n" + 
				" where "+AraColumn+" = '"+AraValue+"'";
		
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				result = rs.getString(MolaColumn);
			}
			
		} catch (Exception e) {
			System.out.println("CodeNameChange 오류 : "+query);
			e.printStackTrace();
		}finally {
			DBConnection.closeDB(con, ps, rs);
		}
		
		return result;
	}

	/*가게 상세정보*/
	public Store_dto getStoreView(String s_no, String g) {
		Store_dto dto = null;
		String query = "select a.city_code, a.rep, a.close_check, a.admin_check, a.star, a.s_attach_1, a.s_attach_2, a.s_attach_3, a.s_attach_4, a.s_attach_5, a.s_name, a.s_content, a.x_code, a.y_code,\r\n" + 
				"        a.s_address, a.s_tell, b.menu_name, a.s_time, a.s_menu_1, to_char(a.s_price_1,'999,999')as s_price_1, a.s_menu_2, to_char(a.s_price_2,'999,999')as s_price_2,\r\n" + 
				"		 a.s_menu_3, to_char(a.s_price_3,'999,999')as s_price_3,\r\n" + 
				"		 a.s_menu_4, to_char(a.s_price_4,'999,999')as s_price_4, a.s_menu_5,to_char(a.s_price_5,'999,999')as s_price_5, c.theme_name as theme_name_1 , d.theme_name as theme_name_2 , e.theme_name as theme_name_3, f.count          \r\n" + 
				" from store a, menu_tbl b, theme_tbl c, theme_tbl d, theme_tbl e, (select s_no, count(*) as count from favorite_tbl group by s_no) f\r\n" + 
				" where a.menu_code = b.menu_code\r\n" + 
				" and a.theme_code_1 = c.theme_code\r\n" + 
				" and a.theme_code_2 = d.theme_code(+)\r\n" + 
				" and a.theme_code_3 = e.theme_code(+)\r\n" + 
				" and a.s_no = f.s_no(+)\r\n" + 
				" and a.s_no like '"+s_no+"'";
		
		if(!g.equals("view")) {
			query= "select a.city_code, a.rep, a.close_check, a.admin_check, a.star, a.s_attach_1, a.s_attach_2, a.s_attach_3, a.s_attach_4, a.s_attach_5, a.s_name, a.s_content, a.x_code, a.y_code,\r\n" + 
					"        a.s_address, a.s_tell, b.menu_name, a.s_time, a.s_menu_1, a.s_price_1, a.s_menu_2, a.s_price_2, a.s_menu_3, a.s_price_3,\r\n" + 
					"        a.s_menu_4, a.s_price_4, a.s_menu_5, a.s_price_5, c.theme_name as theme_name_1 , d.theme_name as theme_name_2 , e.theme_name as theme_name_3, f.count          \r\n" + 
					" from store a, menu_tbl b, theme_tbl c, theme_tbl d, theme_tbl e, (select s_no, count(*) as count from favorite_tbl group by s_no) f\r\n" + 
					" where a.menu_code = b.menu_code\r\n" + 
					" and a.theme_code_1 = c.theme_code\r\n" + 
					" and a.theme_code_2 = d.theme_code(+)\r\n" + 
					" and a.theme_code_3 = e.theme_code(+)\r\n" + 
					" and a.s_no = f.s_no(+)\r\n" + 
					" and a.s_no like '"+s_no+"'";
		}
		
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			while(rs.next()) {				
				String s_attach_1 		= rs.getString("s_attach_1");
				String s_attach_2 		= rs.getString("s_attach_2");
				String s_attach_3 		= rs.getString("s_attach_3");
				String s_attach_4 		= rs.getString("s_attach_4");
				String s_attach_5 		= rs.getString("s_attach_5");
				String s_name			= rs.getString("s_name");
				String s_content 		= rs.getString("s_content");
				if(g.equals("view")) s_content = s_content.replace("\r\n", "<br>");
				String x_code			= rs.getString("x_code");
				String y_code			= rs.getString("y_code");
				String city_code		= rs.getString("city_code");
				String s_address		= rs.getString("s_address");
				String s_tell			= rs.getString("s_tell");
				String menu_name		= rs.getString("menu_name");
				String time				= rs.getString("s_time");
				String s_menu_1			= rs.getString("s_menu_1");
				String s_price_1		= rs.getString("s_price_1");
				String s_menu_2			= rs.getString("s_menu_2");
				String s_price_2		= rs.getString("s_price_2");
				String s_menu_3			= rs.getString("s_menu_3");
				String s_price_3		= rs.getString("s_price_3");
				String s_menu_4			= rs.getString("s_menu_4");
				String s_price_4		= rs.getString("s_price_4");
				String s_menu_5			= rs.getString("s_menu_5");
				String s_price_5		= rs.getString("s_price_5");
				String theme_name_1		= rs.getString("theme_name_1");
				String theme_name_2		= rs.getString("theme_name_2");
				String theme_name_3		= rs.getString("theme_name_3");
				String star				= rs.getString("star");
				String favCount			= rs.getString("count");
				String admin_check		= rs.getString("admin_check");
				String close_check		= rs.getString("close_check");
				String rep		= rs.getString("rep");
				
				if(favCount==null) favCount="0";
				
				dto = new Store_dto(s_attach_1, s_attach_2, s_attach_3, s_attach_4, s_attach_5, s_name, s_content,
									x_code, y_code, s_address, s_tell, menu_name, time, s_menu_1, s_price_1,
									s_menu_2, s_price_2, s_menu_3, s_price_3, s_menu_4, s_price_4, s_menu_5,
									s_price_5, theme_name_1, theme_name_2, theme_name_3,star, favCount);
				dto.setAdmin_check(admin_check);
				dto.setClose_check(close_check);
				dto.setRep(rep);
				dto.setCity_code(city_code);
			}
			
		}catch(Exception e) {
			System.out.println("getStoreView() 오류: " +query);
			e.printStackTrace();
		}finally {
			DBConnection.closeDB(con, ps, rs);
		}		
		return dto;
	}

	//이미지만 담는 배열생성
	public ArrayList<String> getImageList(String s_no) {
		ArrayList<String> dtos = new ArrayList<>();
		String query="select attach from(\r\n" + 
				" SELECT s_no, s_attach_1 AS attach FROM store\r\n" + 
				" WHERE (s_attach_1 is not null)\r\n" + 
				" UNION\r\n" + 
				" SELECT s_no, s_attach_2 AS attach FROM store\r\n" + 
				" WHERE (s_attach_2 is not null)\r\n" + 
				" UNION\r\n" + 
				" SELECT s_no, s_attach_3 AS attach FROM store\r\n" + 
				" WHERE (s_attach_3 is not null)\r\n" + 
				" UNION\r\n" + 
				" SELECT s_no, s_attach_4 AS attach FROM store\r\n" + 
				" WHERE (s_attach_4 is not null)\r\n" + 
				" UNION\r\n" + 
				" SELECT s_no, s_attach_5 AS attach FROM store\r\n" + 
				" WHERE (s_attach_5 is not null))\r\n" + 
				" where s_no = '"+s_no+"'";
		
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			while(rs.next()) {				
				dtos.add(rs.getString("attach"));
			}
		}catch(Exception e) {
			System.out.println("getImageList() 오류: " +query);
			e.printStackTrace();
		}finally {
			DBConnection.closeDB(con, ps, rs);
		}		
		
		return dtos;
	}
	
	//관심가게 리스트
	public ArrayList<Store_dto> getFavCheck() {
		ArrayList<Store_dto> dtos = new ArrayList<Store_dto>();
		String query = "select f.s_no, f.id, f.f_date from favorite_tbl f, store s\r\n" + 
				" where f.s_no=s.s_no"; 
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			while(rs.next()) {	
				String s_no = rs.getString("s_no");
				String id = rs.getString("id");
				String f_date = rs.getString("f_date");
				
				Store_dto dto = new Store_dto(s_no,id,f_date,0);
				dtos.add(dto);
			}
		}catch(Exception e) {
			System.out.println("getFavCheck() 오류: " +query);
			e.printStackTrace();
		}finally {
			DBConnection.closeDB(con, ps, rs);
		}
		return dtos;
	}
	
	//공지사항 번호 만들기
	public String getMaxNo() {
		String newNo ="";
		String query="select nvl(max(s_no),'S0000')\r\n" + 
				" from store";
		try {
			con = DBConnection.getConnection();
			ps  = con.prepareStatement(query);
			rs  = ps.executeQuery();
			if(rs.next()) {
				String no =rs.getString(1); //N001 -> N002
				no =no.substring(1); //001
				int num = Integer.parseInt(no); //num =1
				num +=1; //num =1+1 =>2
				
				DecimalFormat df =new DecimalFormat("S0000");
				newNo = df.format(num);
			}
		}catch(Exception e) {
			System.out.println("getMaxNo 오류 :"+query);
			e.printStackTrace();
		}finally {
			DBConnection.closeDB(con, ps, rs);
		}
		return newNo;
	}
	
	//가게 정보 등록
	public int storeSave(Store_dto d) {
		int result=0;
		String query="insert into store\r\n" + 
				" (s_no,s_name,city_code,local_code,menu_code,theme_code_1,theme_code_2,theme_code_3,\r\n" + 
				" s_tell,s_address,x_code,y_code,s_content,s_time,s_menu_1,s_price_1,s_menu_2,s_price_2,\r\n" + 
				" s_menu_3,s_price_3,s_menu_4,s_price_4,s_menu_5,s_price_5,s_attach_1,s_attach_2,\r\n" + 
				" s_attach_3,s_attach_4,s_attach_5,reg_date,id)\r\n" + 
				" values ('"+d.getS_no()+"','"+d.getS_name()+"','"+d.getCity_code()+"','"+d.getLocal_code()+"',\r\n" + 
				" '"+d.getMenu_code()+"','"+d.getTheme_code_1()+"','"+d.getTheme_code_2()+"','"+d.getTheme_code_3()+"',"+
				" '"+d.getS_tell()+"',\r\n" + 
				" '"+d.getS_address()+"','"+d.getY_code()+"','"+d.getX_code()+"','"+d.getS_content()+"',\r\n" + 
				" '"+d.getS_time()+"','"+d.getS_menu_1()+"','"+d.getS_price_1()+"','"+d.getS_menu_2()+"','"+d.getS_price_2()+"',"+
				" '"+d.getS_menu_3()+"','"+d.getS_price_3()+"','"+d.getS_menu_4()+"','"+d.getS_price_4()+"','"+d.getS_menu_5()+"','"+d.getS_price_5()+"',\r\n" + 
				" '"+d.getS_attach_1()+"','"+d.getS_attach_2()+"','"+d.getS_attach_3()+"','"+d.getS_attach_4()+"','"+d.getS_attach_5()+""
				+ "','"+d.getReg_date()+"','"+d.getId()+"')";
		
		try {
			con = DBConnection.getConnection();
			ps	= con.prepareStatement(query);
			result = ps.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("storeSave()오류"+query);
			e.printStackTrace();
		} finally {
			DBConnection.closeDB(con, ps, rs);
		}
		
		return result;
	}
	
	//대표 가게 번호 알아내기
	public String repNumber(String id) {
		String repNumber = "";
		String query = "select s_no from store where id='"+id+"' and rep='Y'";
		try {
			con = DBConnection.getConnection();
			ps	= con.prepareStatement(query);
			rs	= ps.executeQuery();
			if(rs.next()) {
				repNumber = rs.getString("s_no");
			}
		} catch (Exception e) {
			System.out.println("lowNumber()오류"+query);
			e.printStackTrace();
		} finally {
			DBConnection.closeDB(con, ps, rs);
		}
		
		return repNumber;
	}
	
	//최소번호 알아내기 (대표 가게 없을때)
	public String lowNumber(String id) {
		String lowNumber = "";
		String query = "select min(s_no) as s_no from (select s_no from store where id='"+id+"')";
		
		try {
			con = DBConnection.getConnection();
			ps	= con.prepareStatement(query);
			rs	= ps.executeQuery();
			if(rs.next()) {
				lowNumber = rs.getString("s_no");
			}
		} catch (Exception e) {
			System.out.println("lowNumber()오류"+query);
			e.printStackTrace();
		} finally {
			DBConnection.closeDB(con, ps, rs);
		}
		
		return lowNumber;
	}
	
	//가게 최근 일주일 리뷰갯수
	public String getRepresentReviewCount(String s_no) {
		String count = "0";
		String query= "select count(*) as count from review where s_no='"+s_no+"' and REG_DATE >= TO_CHAR(SYSDATE-7,'YYYYMMDD')";
		try {
			con = DBConnection.getConnection();
			ps	= con.prepareStatement(query);
			rs	= ps.executeQuery();
			if(rs.next()) {
				count = rs.getString("count");
			}
		} catch (Exception e) {
			System.out.println("getRepresentReviewCount()오류"+query);
			e.printStackTrace();
		} finally {
			DBConnection.closeDB(con, ps, rs);
		}
		
		return count;
	}

	// 내가게 리스트 승인 o
	public ArrayList<Store_dto> myStoreList(String id) {
		ArrayList<Store_dto> storeDto = new ArrayList<Store_dto>();
		String query = "select s_no, s_name, rep from store where id='"+id+"' and admin_check='Y' and close_check='N'"
				+ "order by rep desc, s_no asc";
			
		try {
			con = DBConnection.getConnection();
			ps	= con.prepareStatement(query);
			rs	= ps.executeQuery();
			while(rs.next()) {
				String s_no = rs.getString("s_no");
				String s_name = rs.getString("s_name");
				String rep = rs.getString("rep");
				
				Store_dto dto = new Store_dto(s_no, s_name);
				dto.setRep(rep);
				storeDto.add(dto);
			}
		} catch (Exception e) {
			System.out.println("myStoreList()오류"+query);
			e.printStackTrace();
		} finally {
			DBConnection.closeDB(con, ps, rs);
		}
		return storeDto;
	}
	
	// 내가게 리스트 승인 x
	public ArrayList<Store_dto> waitStoreList(String id) {
		ArrayList<Store_dto> storeDto = new ArrayList<Store_dto>();
		String query = " select s_no, s_name from store where id='"+id+"' and admin_check='N'and close_check='N' ";
			
		try {
			con = DBConnection.getConnection();
			ps	= con.prepareStatement(query);
			rs	= ps.executeQuery();
			while(rs.next()) {
				String s_no = rs.getString("s_no");
				String s_name = rs.getString("s_name");
				
				Store_dto dto = new Store_dto(s_no, s_name);
				storeDto.add(dto);
			}
		} catch (Exception e) {
			System.out.println("waitStoreList()오류"+query);
			e.printStackTrace();
		} finally {
			DBConnection.closeDB(con, ps, rs);
		}
		return storeDto;
	}

	//가게 폐점신청
	public int storeClose(String s_no) {
		int result = 0;
		String query = "update store set close_check = 'Y' where s_no='"+s_no+"'";
		
		try {
			con =DBConnection.getConnection();
			ps = con.prepareStatement(query);
			result = ps.executeUpdate();
		}catch(Exception e) {
			System.out.println("storeClose 오류"+query);
			e.printStackTrace();
		}finally {
			DBConnection.closeDB(con, ps, rs);
		}
		
		return result;
	}
	
	//폐점한 내 가게
	public ArrayList<Store_dto> closeStoreList(String id) {
		ArrayList<Store_dto> storeDto = new ArrayList<Store_dto>();
		String query = " select s_no, s_name from store where id='"+id+"' and close_check='Y'";
			
		try {
			con = DBConnection.getConnection();
			ps	= con.prepareStatement(query);
			rs	= ps.executeQuery();
			while(rs.next()) {
				String s_no = rs.getString("s_no");
				String s_name = rs.getString("s_name");
				
				Store_dto dto = new Store_dto(s_no, s_name);
				storeDto.add(dto);
			}
		} catch (Exception e) {
			System.out.println("closeStoreList()오류"+query);
			e.printStackTrace();
		} finally {
			DBConnection.closeDB(con, ps, rs);
		}
		return storeDto;
	}

	//가게 수정 
	public int StoreUpdate(String s_no, String s_name, String s_menu, String theme_1, String theme_2, String theme_3, String city_code, String local_code, String s_address, String x_code, String y_code, String s_content, String tell, String s_time,
							String menu_name_1, String menu_price_1, String menu_name_2, String menu_price_2, String menu_name_3, String menu_price_3, String menu_name_4, String menu_price_4, String menu_name_5, String menu_price_5, String attach_1, String attach_2,
							String attach_3, String attach_4, String attach_5) {
		int result = 0;
		String query = "update store set s_name='"+s_name+"',city_code='"+city_code+"',local_code='"+local_code+"',s_address='"+s_address+"',menu_code='"+s_menu+"',theme_code_1='"+theme_1+"',"
					+ " theme_code_2='"+theme_2+"',theme_code_3='"+theme_3+"',s_tell='"+tell+"',x_code='"+x_code+"',y_code='"+y_code+"',"
					+ " s_content='"+s_content+"'," + " s_time='"+s_time+"',s_menu_1='"+menu_name_1+"',s_price_1='"+menu_price_1+"',s_menu_2='"+menu_name_2+"',"
					+ "s_price_2='"+menu_price_2+"',s_menu_3='"+menu_name_3+"',s_price_3='"+menu_price_3+"',s_menu_4='"+menu_name_4+"',s_price_4='"+menu_price_4+"',"
					+ "s_menu_5='"+menu_name_5+"',s_price_5='"+menu_price_5+"'," + "s_attach_1='"+attach_1+"',s_attach_2='"+attach_2+"',s_attach_3='"+attach_3+"',"
					+ "s_attach_4='"+attach_4+"',s_attach_5='"+attach_5+"'\r\n" + 
					  " where s_no='"+s_no+"'";
		try {
			con =DBConnection.getConnection();
			ps = con.prepareStatement(query);
			result=ps.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("StoreUpdate 오류"+query);
			e.printStackTrace();
		} finally {
			DBConnection.closeDB(con, ps, rs);
		}
		return result;
	}

	
	
	/*-----------Admin------------*/
	// 관리자가 허락한 가게목록
	public ArrayList<Store_dto> AdminStoreListY(String select, String search,int start,int end,String t_desc) {
		ArrayList<Store_dto> dtos = new ArrayList<>();
		String query = "select * from(\r\n" + 
				" select tbl.*,rownum as rnum from(\r\n" + 
				" select f.count, s.review_count,m.bs_no,s.s_no,s.s_name,s.s_address,to_char(s.reg_date,'yyyy/MM/dd')as reg_date,s.id\r\n" + 
				" from member m , store s, (select s_no, count(*) as count from favorite_tbl group by s_no) f \r\n" + 
				" where m.id = s.id and f.s_no(+) = s.s_no\r\n" + 
				" and s.admin_check = 'Y'\r\n" + 
				" and "+select+" like '%"+search+"%'\r\n" + 
				" order by "+t_desc+" \r\n"+
				" )tbl)\r\n" + 
				" where rnum >="+start+" and rnum <="+end;
			try {
				con = DBConnection.getConnection();
				ps	= con.prepareStatement(query);
				rs  = ps.executeQuery();
				while(rs.next()) {
					String bs_no 	 = rs.getString("bs_no");
					String s_no  	 = rs.getString("s_no");
					String s_name 	 = rs.getString("s_name");
					String s_address = rs.getString("s_address");
					String reg_date  = rs.getString("reg_date");
					String id  		 = rs.getString("id");
					String review_count  = rs.getString("review_count");
					String favCount  = rs.getString("count");
					
					Store_dto dto =new Store_dto(bs_no,s_no,s_name,s_address,reg_date,id);
					
					dtos.add(dto);
					dto.setFavCount(favCount);
					dto.setReview_count(review_count);
				}
			
			}catch(Exception e) {
				System.out.println(" 관리자가 허락한 가게목록 오류"+query);
				e.printStackTrace();
			}finally {
				DBConnection.closeDB(con, ps, rs);
			}
		return dtos;
	}
		
	//관리자가 아직 허락하진 않은 가게목록
	public ArrayList<Store_dto> AdminStoreListN(String select, String search,int start,int end,String t_desc) {
		ArrayList<Store_dto> dtos = new ArrayList<>();
		String query ="select * from(\r\n" + 
				" select tbl.*,rownum as rnum from(\r\n" + 
				" select m.bs_no,s.s_no,s.s_name,s.s_address,to_char(s.reg_date,'yyyy/MM/dd')as reg_date,s.id\r\n" + 
				" from member m , store s \r\n" + 
				" where m.id = s.id \r\n" + 
				" and s.admin_check = 'N'\r\n" + 
				" and "+select+" like '%"+search+"%'\r\n" + 
				" order by "+t_desc+" \r\n"+
				" )tbl)\r\n" + 
				" where rnum >="+start+" and rnum <="+end;
			try {
				con = DBConnection.getConnection();
				ps	= con.prepareStatement(query);
				rs  = ps.executeQuery();
				while(rs.next()) {
					String bs_no 	 = rs.getString("bs_no");
					String s_no  	 = rs.getString("s_no");
					String s_name 	 = rs.getString("s_name");
					String s_address = rs.getString("s_address");
					String reg_date  = rs.getString("reg_date");
					String id  		 = rs.getString("id");
					
					Store_dto dto =new Store_dto(bs_no,s_no,s_name,s_address,reg_date,id);
					dtos.add(dto);
				}
			
			}catch(Exception e) {
				System.out.println(" 관리자가 허락한 가게목록 오류"+query);
				e.printStackTrace();
			}finally {
				DBConnection.closeDB(con, ps, rs);
			}
		return dtos;
	}
	
	//getStoreTotalCount( Y 또는 N )
	public int getStoreTotalCount(String admin_check ,String select,String search) {
		int count =0;
		String query =" select count(*) as co\r\n" + 
				" from store s ,member m\r\n" + 
				" where s.admin_check = '"+admin_check+"'\r\n" + 
				" and m.id = s.id \r\n" + 
				" and "+select+" like '%"+search+"%'";
			try {
				con =DBConnection.getConnection();
				ps = con.prepareStatement(query);
				rs =ps.executeQuery();
				if(rs.next()) {
					count = rs.getInt("co");
				}
				
			}catch(Exception e) {
				System.out.println("getStoreTotalCount 오류"+query);
				e.printStackTrace();
			}finally {
				DBConnection.closeDB(con, ps, rs);
			}
		return count;
	}

	//관리자-가게 등록 허가
	public int AdminStoreOpen(String s_no) {
		int result = 0;
		String query="update store set admin_check='Y' where s_no='"+s_no+"'";
		
		try {
			con =DBConnection.getConnection();
			ps = con.prepareStatement(query);
			result = ps.executeUpdate();
		}catch(Exception e) {
			System.out.println("AdminStoreOpen 오류"+query);
			e.printStackTrace();
		}finally {
			DBConnection.closeDB(con, ps, rs);
		}
		
		return result;
	}

	//대표가게설정
	public int setStoreRep(String s_no, String id) {
		int result1 = 0;
		int result2 = 0;
		String query = "update store set rep = 'N' where id = '"+id+"'";
		
		try {
			con =DBConnection.getConnection();
			ps = con.prepareStatement(query);
			result1 = ps.executeUpdate();
			
			if(result1!=0) {
				query = "update store set rep = 'Y' where s_no = '"+s_no+"'";
				ps = con.prepareStatement(query);
				result2 = ps.executeUpdate();				
			}
			
		}catch(Exception e) {
			System.out.println("setStoreRep 오류"+query);
			e.printStackTrace();
		}finally {
			DBConnection.closeDB(con, ps, rs);
		}
		
		return result2;
	}




}
