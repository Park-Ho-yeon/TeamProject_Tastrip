package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.DecimalFormat;
import java.util.ArrayList;

import common.DBConnection;
import dto.Notice_dto;

public class Notice_dao {
	Connection  		con=null;
	PreparedStatement   ps=null;
	ResultSet 			rs =null;
	
	
	
	//인덱스 공지사항 불러오기
	public ArrayList<Notice_dto> getNotice() {
			ArrayList<Notice_dto> dtos = new ArrayList<Notice_dto>();
			String query = "select * from(\r\n" + 
					" select tbl.*, rownum as rnum from(\r\n" + 
					" select n_no, title, content, to_char(reg_date,'yyyy-MM-dd')as reg_date, reg_id\r\n" + 
					" from notice)tbl)\r\n" + 
					" where rnum >=0 and rnum<=3\r\n" + 
					" order by reg_date desc";
			
			try {
				
				con = DBConnection.getConnection();
				ps	= con.prepareStatement(query);
				rs	= ps.executeQuery();
				
				while(rs.next()) {
					String n_no = rs.getString("n_no");
					String title = rs.getString("title");
					String content = rs.getString("content");
					String reg_date = rs.getString("reg_date");
					String reg_id = rs.getString("reg_id");
					
					Notice_dto dto = new Notice_dto(n_no, title, content, reg_date, reg_id);
					dtos.add(dto);
				}
			} catch (Exception e) {
				System.out.println("getNotice()오류:" + query);
				e.printStackTrace();
			} finally {
				DBConnection.closeDB(con, ps, rs);
			} 
		return dtos;
	}
	
	
	// 공지사항 상세 보기
	public Notice_dto noticeView(String n_no, String g) {
		Notice_dto dto = null;
		String query ="select a.title, a.content, to_char(a.reg_date, 'yyyy-MM-dd') as reg_date, b.nickname\r\n" + 
				" from notice a, member b\r\n" + 
				" where a.reg_id = b.id\r\n" + 
				" and a.n_no = '"+n_no+"'";
		try {
			con = DBConnection.getConnection();
			ps	= con.prepareStatement(query);
			rs	= ps.executeQuery();
			while(rs.next()) {
				String title = rs.getString("title");
				String content = rs.getString("content");
				if(g.equals("view")) content = content.replace("\r\n","<br>"); 
				String reg_date = rs.getString("reg_date");
				String reg_id = rs.getString("nickname");
				dto = new Notice_dto(n_no, title, content, reg_date, reg_id);
			}
		} catch (Exception e) {
			System.out.println("noticeView()오류:" + query);
			e.printStackTrace();
		} finally {
			DBConnection.closeDB(con, ps, rs);
		}
		
		return dto;
	}
	
	//관리자페이지 - 공지사항 목록 조회
	public ArrayList<Notice_dto> adminNotice(String select,String search,int start,int end,String listorder) {
			ArrayList<Notice_dto> dtos = new ArrayList<Notice_dto>();
			String query = "select * from(\r\n" + 
					" select tbl.*,rownum as rnum from(\r\n" + 
					" select a.n_no,a.title,a.content,to_char(a.reg_date,'yyyy-mm-dd') as reg_date,b.name\r\n" + 
					" from notice a, member b\r\n" + 
					" where a.reg_id = b.id and "+select+" like '%"+search+"%'" + 
					" order by "+listorder+")tbl)\r\n" + 
					" where rnum >="+start+" and rnum <="+end;
			
			System.out.println(query);
			
			try {
				
				con = DBConnection.getConnection();
				ps	= con.prepareStatement(query);
				rs	= ps.executeQuery();
				
				while(rs.next()) {
					String n_no = rs.getString("n_no");
					String title = rs.getString("title");
					String content = rs.getString("content");
					String reg_date = rs.getString("reg_date");
					String reg_id = rs.getString("name");
					
					Notice_dto dto = new Notice_dto(n_no, title, content, reg_date, reg_id);
					dtos.add(dto);
				}
			} catch (Exception e) {
				System.out.println("getNotice()오류:" + query);
				e.printStackTrace();
			} finally {
				DBConnection.closeDB(con, ps, rs);
			} 
		return dtos;
	}
	
	//공지사항 번호 만들기
	public String getMaxNo() {
		String newNo ="";
		String query="select nvl(max(n_no),'N000')\r\n" + 
				" from notice";
		try {
			con = DBConnection.getConnection();
			ps  = con.prepareStatement(query);
			rs  = ps.executeQuery();
			if(rs.next()) {
				String no =rs.getString(1); //N001 -> N002
				no =no.substring(1); //001
				int num = Integer.parseInt(no); //num =1
				num +=1; //num =1+1 =>2
				
				DecimalFormat df =new DecimalFormat("N000");
				newNo = df.format(num);
			}
		}catch(Exception e) {
			System.out.println("공지사항번호 시스템 오류!"+query);
			e.printStackTrace();
		}finally {
			DBConnection.closeDB(con, ps, rs);
		}
		return newNo;
	}
	
	//공지사항 저장
	public int writeSave(Notice_dto dto) {
		int save =0;
		String query="insert into notice\r\n" + 
				" (n_no,title,content,reg_date,reg_id)\r\n" + 
				" values\r\n" + 
				" ('"+dto.getN_no()+"','"+dto.getTitle()+"','"+dto.getContent()+"','"+dto.getReg_date()+"','"+dto.getReg_id()+"')";
			try {
				con = DBConnection.getConnection();
				ps  = con.prepareStatement(query);
				save = ps.executeUpdate();
			}catch(Exception e) {
				System.out.println("writeSave 오류!"+query);
				e.printStackTrace();
			}finally {
				DBConnection.closeDB(con, ps, rs);
			}
		return save;
	}

	//갯수조회
	public  int getTotalCount(String select, String search) {
		int count =0;
		String query =" SELECT count(*) as co\r\n" + 
				" from notice\r\n" +
				" where "+select+" like '%"+search+"%'";
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
	
	//공지사항 업데이트
	public int noticeUpdate(Notice_dto dto) {
		int result =0;
		String query ="update notice\r\n" + 
				" set title = '"+dto.getTitle()+"',\r\n" + 
				"    content = '"+dto.getContent()+"',\r\n" + 
				"    reg_id = '"+dto.getReg_id()+"',\r\n" + 
				"    reg_date = '"+dto.getReg_date()+"'\r\n" + 
				" where n_no = '"+dto.getN_no()+"'";
		try {
			 con=DBConnection.getConnection();
			 ps=con.prepareStatement(query);
			 result=ps.executeUpdate();
		}catch(Exception e) {
			System.out.println("noticeUpdate 오류"+query);
	        e.printStackTrace();
		}finally {
			DBConnection.closeDB(con, ps, rs);
		}		
		return result;
	}

	//공지사항 삭제
	public int noticeDelete(String no) {
		int result =0;
		String query ="delete from notice\r\n" + 
				" where n_no = '"+no+"'";
		try {
			 con=DBConnection.getConnection();
			 ps=con.prepareStatement(query);
			 result=ps.executeUpdate();
		}catch(Exception e) {
			System.out.println("noticeDelete 오류"+query);
	        e.printStackTrace();
		}finally {
			DBConnection.closeDB(con, ps, rs);
		}		
		return result;
	}
			
}
