package common;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

// 1. 데이터베이스에 접속하는 기능
// 2. 접속 후 끊어내는 기능
public class DBConnection {
	

	//접속자를 미리 만들어놓는다. -> 과부하를 줄여줌 열었다닫았다안해서
	public static Connection getConnection(){
		Connection con = null;
		try {
			Context context = new InitialContext();
			DataSource dataSource = (DataSource)context.lookup("java:comp/env/jdbc/oracleJSL");
			try {
				con = dataSource.getConnection();
				if(con==null) System.out.println("접속실패!");
//				else System.out.println("DBCP 접속성공!");
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
		} catch (NamingException e) {
			
			e.printStackTrace();
		}
		return con;
		
	}
	
	
	public static void closeDB(Connection con, PreparedStatement ps, ResultSet rs) {
		if(con!=null) { 
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if(ps!=null) {
			try {
				ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if(rs!=null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	
//	public static Connection getConnection(){
//		Connection con = null;
//		boolean goIng = true;
//		try {
//			Class.forName("oracle.jdbc.driver.OracleDriver");
//		} catch (ClassNotFoundException e) {
//			goIng = false;
//			System.out.println("오라클 드라이버 없음");
//			e.printStackTrace();
//		}
//		
//		//if(goIng) => goIng가 true일때, 즉 드라이버가 작동했을때
//		if(goIng) {
//			String db_url="jdbc:oracle:thin:@182.217.138.73:1521:xe"; //어떤 컴퓨터에
////			String db_user="jsl54";  //유저이름
//			String db_user="jsl54_taste";  //유저이름
//			String db_password="1234"; //비번
//			
//			try {
//				con = DriverManager.getConnection(db_url, db_user, db_password);
//			} catch (SQLException e) {
//				System.out.println("DB 계정설정 오류!");
//				e.printStackTrace();
//			}
//		}
//		return con;
//	}
//	
//	
//	public static void closeDB(Connection con, PreparedStatement ps, ResultSet rs) {
//		if(con!=null) { 
//			try {
//				con.close();
//			} catch (SQLException e) {
//				e.printStackTrace();
//			}
//		}
//		if(ps!=null) {
//			try {
//				ps.close();
//			} catch (SQLException e) {
//				e.printStackTrace();
//			}
//		}
//		if(rs!=null) {
//			try {
//				rs.close();
//			} catch (SQLException e) {
//				e.printStackTrace();
//			}
//		}
//	}
//	
}
