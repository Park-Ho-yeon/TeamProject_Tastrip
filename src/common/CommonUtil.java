package common;

import java.io.File;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

public class CommonUtil {
	
	// 첨부파일 경로 : 멤버
	public static String getFile_dir_profile(HttpServletRequest request) {
		String fileDir = request.getSession().getServletContext().getRealPath("/")+"attach/member/profile/";
		return fileDir;
	}
	
	// 첨부파일 경로 : 가게사진
	public static String getFile_dir_store(HttpServletRequest request) {
		String fileDir = request.getSession().getServletContext().getRealPath("/")+"attach/store/";
		return fileDir;
	}
	
	// 첨부파일 경로 : 리뷰사진
	public static String getFile_dir_review(HttpServletRequest request) {
		String fileDir = request.getSession().getServletContext().getRealPath("/")+"attach/review/";
		return fileDir;
	}
	
	// 가게이름폴더 만들기
	public static void createFolder(String path,String s_name) {
		String paths = path+s_name;
		File Folder = new File(paths);

		// 해당 디렉토리가 없을경우 디렉토리를 생성합니다.
		if (!Folder.exists()) {
			try{
			    Folder.mkdir(); //폴더 생성합니다.
			    System.out.println("폴더가 생성되었습니다.");
		        } 
		        catch(Exception e){
			    e.getStackTrace();
			}        
	         }else {
			System.out.println("이미 폴더가 생성되어 있습니다.");
		}
	}
	

	public static String getPageFront() {
		String frontQuery =	"select * \r\n" + 
			"from\r\n" + 
			"(select tbl.*, rownum as rnum\r\n" + 
			"    from\r\n" + 
			"        (";
		return frontQuery;
	}
	
	public static String getPageEnd(int start,
			                        int end) {
		String endQuery=" ) tbl) \r\n" + 
				"where rnum >="+start+" and rnum <="+end+"";
		
		return endQuery;
	}
	
	// 새로운 게시글 번호 생성                                              N000          N004   
	public static String getNewNo(String format,String num){
		DecimalFormat df = new DecimalFormat(format);
		num = num.substring(1);
		int i = Integer.parseInt(num);
		i++; 
		String numNum = df.format(i); // p0003
		
		return numNum;
	}
	
	
	// null 일때 ""으로
	public static String checkNull(String value) {
		String result =""; 
		if(value != null) result = value;
		return result; 
	}

	//오늘날짜
	public static String getToday(){
		Date time = new Date();
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
		String today = format1.format(time);
		return today;
	}
	
	// 오늘 날짜 시분초 
	public static String getTodayTime() {
		Date time = new Date();
		SimpleDateFormat format1 = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
		String today = format1.format(time);
		return today;
	}	
	
	// 페이지
	public static String pageListPost(int current_page,int total_page, int pageNum_count){
		int pagenumber;    //화면에 보여질 페이지 인덱스수
		int startpage;     //화면에 보여질 시작 페이지 번호
		int endpage;       //화면에 보여질 마지막 페이지 번호
		int curpage;       //이동하고자 하는 페이지 번호
		
		String strList=""; //리턴될 페이지 인덱스 리스트

		pagenumber = pageNum_count;   //한 화면의 페이지 인덱스수
		
		//시작 페이지 번호 구하기
		startpage = ((current_page - 1)/ pagenumber) * pagenumber + 1;
		//마지막 페이지 번호 구하기
		endpage = (((startpage -1) + pagenumber) / pagenumber)*pagenumber;
		//총페이지수가 계산된 마지막 페이지 번호보다 작을 경우
		//총페이지수가 마지막 페이지 번호가 됨
		
		if(total_page <= endpage)  endpage = total_page;
					
		//첫번째 페이지 인덱스 화면이 아닌경우
		if(current_page > pagenumber){
			curpage = startpage -1;  //시작페이지 번호보다 1적은 페이지로 이동
			strList = strList +"<a href=javascript:goPage('"+curpage+"') ><i class='fa fa-angle-double-left'></i></a>";
		}
						
		//시작페이지 번호부터 마지막 페이지 번호까지 화면에 표시
		curpage = startpage;
		while(curpage <= endpage){
			if(curpage == current_page){
				strList = strList +"<a class='choice'>"+current_page+"</a>";
			} else {
				strList = strList +"<a href=javascript:goPage('"+curpage+"')>"+curpage+"</a>";
			}
			curpage++;
		}
		//뒤에 페이지가 더 있는 경우
		if(total_page > endpage){
			curpage = endpage+1;
			strList = strList + "<a href=javascript:goPage('"+curpage+"') ><i class='fa fa-angle-double-right'></i></a>";
		}
		return strList;
	}				
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
