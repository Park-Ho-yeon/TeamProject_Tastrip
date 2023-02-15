package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.DecimalFormat;
import java.util.ArrayList;

import common.DBConnection;
import dto.Review_dto;
import dto.Store_dto;


public class Review_dao {

	Connection 			con = null;
	PreparedStatement 	ps = null;
	ResultSet 			rs = null;

	
	//홈화면에 리뷰 여섯개 랜덤노출
	public ArrayList<Review_dto> getIndexReviewList() {
		ArrayList<Review_dto> dtos = new ArrayList<>();
		String query ="select * from\r\n" + 
				" (select a.s_no, a.r_no, a.attach_1, b.s_name, b.s_address, c.profile_photo, c.nickname, a.star, to_char(a.reg_date,'yyyy-MM-dd') reg_date, a.content, c.api\r\n" + 
				" from review a, store b, member c\r\n" + 
				" where a.s_no = b.s_no\r\n" + 
				" and a.reg_id = c.id\r\n" + 
				" and attach_1 is not null\r\n" + 
				" order by DBMS_RANDOM.RANDOM\r\n" + 
				" ) where rownum<7";
		
		try {
			con 	= DBConnection.getConnection();
			ps 		= con.prepareStatement(query);
			rs  	= ps.executeQuery();
			while(rs.next()) {
				String s_no 			= rs.getString("s_no");
				String r_no 			= rs.getString("r_no");
				String attach_1			= rs.getString("attach_1");
				String s_name 			= rs.getString("s_name");
				String s_address 		= rs.getString("s_address");
				String profile_photo 	= rs.getString("profile_photo");
				String nickname 		= rs.getString("nickname");
				String star 			= rs.getString("star");
				String reg_date		 	= rs.getString("reg_date");
				String content			= rs.getString("content");
				String api = rs.getString("api");
				
				int star_front = Integer.parseInt(star.substring(0,1));
				int star_end = Integer.parseInt(star.substring(2));
				int star_empty = 5-star_front;
				
				Review_dto dto = new Review_dto(s_no, r_no, attach_1, s_name, s_address, profile_photo, nickname, star, reg_date, content, star_front, star_end, star_empty);
				dto.setApi(api);
				dtos.add(dto);
			}

		}catch(Exception e) {
			System.out.println("getIndexReviewList() 오류 :"+query);
			e.printStackTrace();
		}finally {
			DBConnection.closeDB(con, ps, rs);		
		}
		return dtos;
	}

	//가게 상세페이지 - 리뷰 목록
	public ArrayList<Review_dto> getStoreReviewList(String s_no, String about, String order, String pageNum) {
		ArrayList<Review_dto> dtos = new ArrayList<>();
		String query ="select * from\r\n" + 
				"(select b.nickname, b.profile_photo, a.r_no, to_char(a.reg_date,'yyyy-MM-dd') reg_date, a.star, a.content,\r\n" + 
				"        a.attach_1, a.attach_2, a.attach_3, a.attach_4, a.attach_5, b.api\r\n" + 
				" from review a, member b\r\n" + 
				" where a.reg_id = b.id\r\n" + 
				" and a.s_no = '"+s_no+"'\r\n" + 
				" order by "+about+" "+order+"" +
				" ) where rownum<="+pageNum;

		try {
			con 	= DBConnection.getConnection();
			ps 		= con.prepareStatement(query);
			rs  	= ps.executeQuery();
			while(rs.next()) {
				String nickname 		= rs.getString("nickname");
				String profile_photo	= rs.getString("profile_photo");
				String r_no				= rs.getString("r_no");
				String reg_date 		= rs.getString("reg_date");
				String star 			= rs.getString("star");
				String content 			= rs.getString("content");
				content = content.replace("\r\n","<br>");
				String attach_1 		= rs.getString("attach_1");
				String attach_2 		= rs.getString("attach_2");
				String attach_3			= rs.getString("attach_3");
				String attach_4			= rs.getString("attach_4");
				String attach_5			= rs.getString("attach_5");
				String api				= rs.getString("api");
				
				int star_front = Integer.parseInt(star.substring(0,1));
				int star_end = Integer.parseInt(star.substring(2));
				int star_empty = 5-star_front;
				
				Review_dto dto = new Review_dto(nickname, profile_photo, r_no, reg_date, star, content, attach_1, attach_2, attach_3, attach_4, attach_5, star_front, star_end, star_empty);
				dto.setApi(api);
				dtos.add(dto);
			}

		}catch(Exception e) {
			System.out.println("getStoreReviewList() 오류 :"+query);
			e.printStackTrace();
		}finally {
			DBConnection.closeDB(con, ps, rs);		
		}
		return dtos;
	}
	
	//리뷰 목록 AJAX 더보기
	public ArrayList<Review_dto> AjaxStoreReviewList(String s_no, String about, String order, String start, String end) {
		ArrayList<Review_dto> dtos = new ArrayList<>();
		String query = 	" select * from(\r\n" + 
				" select tbl.*,rownum as rnum from(\r\n"+
				"select * from\r\n" + 
				"(select b.nickname, b.profile_photo, a.r_no, to_char(a.reg_date,'yyyy-MM-dd') reg_date, a.star, a.content,\r\n" + 
				"        a.attach_1, a.attach_2, a.attach_3, a.attach_4, a.attach_5, b.api\r\n" + 
				" from review a, member b\r\n" + 
				" where a.reg_id = b.id\r\n" + 
				" and a.s_no = '"+s_no+"'\r\n" + 
				" order by "+about+" "+order+")" +
				"  )tbl)\r\n" + 
				" where rnum >"+start+" and rnum <="+end;
		
		try {
			con 	= DBConnection.getConnection();
			ps 		= con.prepareStatement(query);
			rs  	= ps.executeQuery();
			while(rs.next()) {
				String nickname 		= rs.getString("nickname");
				String profile_photo	= rs.getString("profile_photo");
				String r_no				= rs.getString("r_no");
				String reg_date 		= rs.getString("reg_date");
				String star 			= rs.getString("star");
				String content 			= rs.getString("content");
				content = content.replace("\r\n","<br>");
				String attach_1 		= rs.getString("attach_1");
				String attach_2 		= rs.getString("attach_2");
				String attach_3			= rs.getString("attach_3");
				String attach_4			= rs.getString("attach_4");
				String attach_5			= rs.getString("attach_5");
				String api				= rs.getString("api");
				
				int star_front = Integer.parseInt(star.substring(0,1));
				int star_end = Integer.parseInt(star.substring(2));
				int star_empty = 5-star_front;
				
				Review_dto dto = new Review_dto(nickname, profile_photo, r_no, reg_date, star, content, attach_1, attach_2, attach_3, attach_4, attach_5, star_front, star_end, star_empty);
				dto.setApi(api);
				dtos.add(dto);
			}
			
		}catch(Exception e) {
			System.out.println("getStoreReviewList() 오류 :"+query);
			e.printStackTrace();
		}finally {
			DBConnection.closeDB(con, ps, rs);		
		}
		return dtos;
	}

	//리뷰 목록 토탈카운트
	public int ReviewTotalCount(String s_no) {
		int count=0;
		String query="select count(*)as co from review where s_no = '"+s_no+"'";
		
		try {
			con =DBConnection.getConnection();
			ps = con.prepareStatement(query);
			rs =ps.executeQuery();
			if(rs.next()) {
				count = rs.getInt("co");
			}
			
		}catch(Exception e) {
			System.out.println("ReviewTotalCount 오류"+query);
			e.printStackTrace();
		}finally {
			DBConnection.closeDB(con, ps, rs);
		}
		return count;
	}
	
	//리뷰 상세보기
	public Review_dto getReviewView(String r_no, String g) {
		Review_dto dto = null;
		String query ="select a.s_no, to_char(a.reg_date, 'yyyy-MM-dd') reg_date, a.reg_id, a.star, a.content, a.attach_1, a.attach_2, a.attach_3, a.attach_4, a.attach_5,\r\n" + 
				"        b.s_name, c.city_name, l.local_name, d.profile_photo, d.nickname, d.api\r\n" + 
				" from review a, store b, city_tbl c, local_tbl l, member d\r\n" + 
				" where a.s_no = b.s_no\r\n" + 
				" and b.city_code = c.city_code\r\n" + 
				" and b.local_code = l.local_code\r\n" + 
				" and a.reg_id = d.id\r\n" + 
				" and a.r_no = '"+r_no+"'";
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			while(rs.next()) {
				String s_no 			= rs.getString("s_no");
				String reg_id			= rs.getString("reg_id");
				String reg_date			= rs.getString("reg_date");
				String star 			= rs.getString("star");
				String content 			= rs.getString("content");
				if(g.equals("view")) content = content.replace("\r\n","<br>");
				String attach_1 		= rs.getString("attach_1");
				String attach_2 		= rs.getString("attach_2");
				String attach_3 		= rs.getString("attach_3");
				String attach_4 		= rs.getString("attach_4");
				String attach_5 		= rs.getString("attach_5");
				String s_name 			= rs.getString("s_name");
				String city_name 		= rs.getString("city_name");
				String local_name 		= rs.getString("local_name");
				String profile_photo 	= rs.getString("profile_photo");
				String nickname 		= rs.getString("nickname");
				String api 				= rs.getString("api");

				int star_front = Integer.parseInt(star.substring(0,1));
				int star_end = Integer.parseInt(star.substring(2));
				int star_empty = 5-star_front;
				
				dto = new Review_dto(s_no, reg_id, reg_date, star, content, attach_1, attach_2, attach_3, attach_4, attach_5,
									s_name, city_name, local_name, profile_photo, nickname, star_front, star_end, star_empty);
				dto.setApi(api);
			}
		}catch(Exception e) {
			System.out.println("getReviewView() 오류: " +query);
			e.printStackTrace();
		}finally {
			DBConnection.closeDB(con, ps, rs);
		}
		return dto;
	}

	
	//리뷰 작성 페이지 - 가게정보
	public Store_dto getReviewWrite(String s_no) {
		Store_dto dto = null;
		String query="select s.s_no, s.s_name, c.city_name, l.local_name\r\n" + 
				" from store s, city_tbl c, local_tbl l\r\n" + 
				" where c.city_code=s.city_code and l.local_code=s.local_code\r\n" + 
				" and s.s_no='"+s_no+"'";
		
		try {
			con 	= DBConnection.getConnection();
			ps 		= con.prepareStatement(query);
			rs  	= ps.executeQuery();
			while(rs.next()) {
				String s_name = rs.getString("s_name");
				String city_name = rs.getString("city_name");
				String local_name = rs.getString("local_name");
				
				dto = new Store_dto(s_name, city_name, local_name);
			}

		}catch(Exception e) {
			System.out.println("getReviewWrite() 오류 :"+query);
			e.printStackTrace();
		}finally {
			DBConnection.closeDB(con, ps, rs);		
		}
		
		
		return dto;
	}
	
	
	//리뷰 저장
	public int ReviewSave(String id, String r_no, String s_no, String content, String star, String reg_date, String attach_1, String attach_2, String attach_3, String attach_4, String attach_5) {
		int result = 0;
		String query="insert into review\r\n" + 
				" (reg_id,r_no,s_no,content,star,reg_date,attach_1,attach_2,attach_3,attach_4,attach_5)\r\n" + 
				" values ('"+id+"','"+r_no+"','"+s_no+"','"+content+"','"+star+"','"+reg_date+"','"+attach_1+"','"+attach_2+"','"+attach_3+"','"+attach_4+"','"+attach_5+"')";
		
		try {
			con = DBConnection.getConnection();
			ps  = con.prepareStatement(query);
			result = ps.executeUpdate();
		}catch(Exception e) {
			System.out.println("ReviewSave 오류 :"+query);
			e.printStackTrace();
		}finally {
			DBConnection.closeDB(con, ps, rs);
		}
		
		return result;
	}

	
	//공지사항 번호 만들기
	public String getMaxNo() {
		String newNo ="";
		String query="select nvl(max(r_no),'R0000')\r\n" + 
				" from review";
		try {
			con = DBConnection.getConnection();
			ps  = con.prepareStatement(query);
			rs  = ps.executeQuery();
			if(rs.next()) {
				String no =rs.getString(1); //N001 -> N002
				no =no.substring(1); //001
				int num = Integer.parseInt(no); //num =1
				num +=1; //num =1+1 =>2
				
				DecimalFormat df =new DecimalFormat("R0000");
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

	
	//한 가게의 리뷰 갯수 구하기
	public int getReviewCount(String s_no) {
		int count = 0;
		String query = "select count(*) from(\r\n" + 
				" select star from review\r\n" + 
				" where s_no = '"+s_no+"')";
		
		try {
			con = DBConnection.getConnection();
			ps  = con.prepareStatement(query);
			rs  = ps.executeQuery();
			while(rs.next()) {
				count = rs.getInt(1);
			}
		}catch(Exception e) {
			System.out.println("getStarTotal 오류 :"+query);
			e.printStackTrace();
		}finally {
			DBConnection.closeDB(con, ps, rs);
		}
		
		return count;
	}
	
	
	//가게 평균 별점 구하기
	public String getStarTotal(String s_no) {
		String query="select star from review\r\n" + 
				" where s_no = '"+s_no+"'";
		double total = 0;
		int count = getReviewCount(s_no);
		
		try {
			con = DBConnection.getConnection();
			ps  = con.prepareStatement(query);
			rs  = ps.executeQuery();
			while(rs.next()) {
				total += rs.getDouble(1);
			}
		}catch(Exception e) {
			System.out.println("getStarTotal 오류 :"+query);
			e.printStackTrace();
		}finally {
			DBConnection.closeDB(con, ps, rs);
		}
		
		String real_result = "";
		if(count!=0) {
			double result = total/count;
			real_result = String.format("%.1f", result);
		}else {
			real_result = "0.0";
		}
		
		return real_result;
	}

	
	//리뷰 등록할때 가게 평균도 수정
	public int ReviewSave_store(String s_no, String ava) {
		int result = 0;
		int count = getReviewCount(s_no);
		String query="update store\r\n" + 
				" set star = '"+ava+"', review_count='"+count+"'\r\n" + 
				" where s_no='"+s_no+"'";
		
		try {
			con = DBConnection.getConnection();
			ps  = con.prepareStatement(query);
			result = ps.executeUpdate();
		}catch(Exception e) {
			System.out.println("ReviewSave_store 오류 :"+query);
			e.printStackTrace();
		}finally {
			DBConnection.closeDB(con, ps, rs);
		}
		
		return result;
	}

	
	//리뷰 사진만 배열로 가져오기
	public ArrayList<String> getReviewImages(String r_no) {
		ArrayList<String> dtos = new ArrayList<>();
		String query="select attach from(\r\n" + 
				" SELECT r_no, attach_1 AS attach FROM review\r\n" + 
				" WHERE (attach_1 is not null)\r\n" + 
				" UNION\r\n" + 
				" SELECT r_no, attach_2 AS attach FROM review\r\n" + 
				" WHERE (attach_2 is not null)\r\n" + 
				" UNION\r\n" + 
				" SELECT r_no, attach_3 AS attach FROM review\r\n" + 
				" WHERE (attach_3 is not null)\r\n" + 
				" UNION\r\n" + 
				" SELECT r_no, attach_4 AS attach FROM review\r\n" + 
				" WHERE (attach_4 is not null)\r\n" + 
				" UNION\r\n" + 
				" SELECT r_no, attach_5 AS attach FROM review\r\n" + 
				" WHERE (attach_5 is not null))\r\n" + 
				" where r_no = '"+r_no+"'";
		
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			while(rs.next()) {				
				dtos.add(rs.getString("attach"));
			}
		}catch(Exception e) {
			System.out.println("getReviewImages() 오류: " +query);
			e.printStackTrace();
		}finally {
			DBConnection.closeDB(con, ps, rs);
		}		
		
		return dtos;
	}

	
	//자신이 작성한 리뷰 조회
	public ArrayList<Review_dto> MemberReview(String reg_id,String select,String search,String sequence,int start,int end) {
		 ArrayList<Review_dto> dtos = new ArrayList<>();
		 String query ="select * from(\r\n" + 
		 		" select tbl.*,rownum as rnum from(\r\n" + 
		 		" select r.r_no,s.s_no,s.s_name,r.content,r.attach_1,r.attach_2,r.attach_3,r.attach_4,r.attach_5,\r\n" + 
		 		"        r.star,m.id,to_char(r.reg_date,'yyyy-MM-dd')as reg_date,s.s_address,m.nickname,m.profile_photo\r\n" + 
		 		" from review r ,member m ,store s\r\n" + 
		 		" where r.reg_id = m.id and r.s_no = s.s_no\r\n" + 
		 		" and reg_id like '"+reg_id+"'\r\n" + 
		 		" and "+select+" like '%"+search+"%'\r\n" + 
		 		" order by "+sequence+"\r\n" + 
		 		" )tbl)\r\n" + 
		 		" where rnum >="+start+" and rnum <="+end+"";
		
		 	try {
		 		con = DBConnection.getConnection();
				ps = con.prepareStatement(query);
				rs = ps.executeQuery();
				while(rs.next()) {
					String r_no 			= rs.getString("r_no");
					String s_no				= rs.getString("s_no");
					String content 			= rs.getString("content");
					String attach_1 		= rs.getString("attach_1");
					String attach_2 		= rs.getString("attach_2");
					String attach_3 		= rs.getString("attach_3");
					String attach_4 		= rs.getString("attach_4");
					String attach_5 		= rs.getString("attach_5");
					String star 			= rs.getString("star");
					String reg_date 		= rs.getString("reg_date");
					String s_name			= rs.getString("s_name");
					String s_address		= rs.getString("s_address");
					
					int star_front = Integer.parseInt(star.substring(0,1));
					int star_end = Integer.parseInt(star.substring(2));
					int star_empty = 5-star_front;
					
					Review_dto dto = new Review_dto(r_no, s_no, content, attach_1, attach_2, attach_3, attach_4,
											attach_5, star, reg_date, reg_id, s_name, s_address, star_front, star_end, star_empty);
					
					dtos.add(dto);
				}	
					
		 	}catch(Exception e) {
		 		System.out.println("자신이 작성한 리뷰 조회 : "+query);
		 		e.printStackTrace();
		 	}finally {
		 		DBConnection.closeDB(con, ps, rs);
		 	}
		 return dtos;
	}

	
	//로그인 후 인덱스 화면용 갯수조회
	public  int getTotalCount(String id) {
		int count =0;
		String query ="SELECT count(*) as co\r\n" + 
				" from review r, store s\r\n" + 
				" where reg_id = '"+id+"'"+
				" and r.s_no = s.s_no"; 
	
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
	
	
	
	//리뷰 삭제
	public int ReviewDelete(String r_no) {
		int result = 0;
		String query = "delete from review\r\n" + 
				" where r_no = '"+r_no+"'";
		
		try {
			con =DBConnection.getConnection();
			ps = con.prepareStatement(query);
			result=ps.executeUpdate();
			
		}catch(Exception e) {
			System.out.println("ReviewDelete 오류"+query);
			e.printStackTrace();
		}finally {
			DBConnection.closeDB(con, ps, rs);
		}
		
		return result;
	}

	
	//리뷰 수정
	public int ReviewUpdate(String r_no, String content, String attach_1, String attach_2, String attach_3, String attach_4, String attach_5, String star) {
		int result = 0;
		String query="update review\r\n" + 
				" set content = '"+content+"', attach_1='"+attach_1+"',attach_2='"+attach_2+"',attach_3='"+attach_3+"',attach_4='"+attach_4+"',attach_5='"+attach_5+"',star='"+star+"'\r\n" + 
				" where r_no='"+r_no+"'";
		
		System.out.println("ReviewUpdate 실행 "+query);
		
		try {
			con =DBConnection.getConnection();
			ps = con.prepareStatement(query);
			result=ps.executeUpdate();
			
		}catch(Exception e) {
			System.out.println("ReviewUpdate 오류"+query);
			e.printStackTrace();
		}finally {
			DBConnection.closeDB(con, ps, rs);
		}
		
		return result;
	}
	
	//마이페이지 - 갯수조회
	public  int getReviewTotalCount(String id, String select, String search) {
		int count =0;
		String query ="SELECT count(*) as co\r\n" + 
				" from review r, store s\r\n" + 
				" where reg_id = '"+id+"'"+
				" and r.s_no = s.s_no\r\n" + 
				" and "+select+" like '%"+search+"%'";
			try {
				con =DBConnection.getConnection();
				ps = con.prepareStatement(query);
				rs =ps.executeQuery();
				if(rs.next()) {
					count = rs.getInt("co");
				}
				
			}catch(Exception e) {
				System.out.println("getReviewTotalCount 오류"+query);
				e.printStackTrace();
			}finally {
				DBConnection.closeDB(con, ps, rs);
			}
		
		return count;
	}
			
	
}
