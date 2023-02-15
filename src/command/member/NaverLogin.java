package command.member;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import dao.Member_dao;
import dto.Member_dto;

public class NaverLogin{

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
		Member_dao dao = new Member_dao();
		
		String clientId = "4ODZSQ4ZmSFd4nMbHZKS";//애플리케이션 클라이언트 아이디값";
	    String clientSecret = "ldGKD6a145";//애플리케이션 클라이언트 시크릿값";
	    String code = request.getParameter("code");
	    String state = request.getParameter("state");
	    String redirectURI = null;
		try {
			redirectURI = URLEncoder.encode("http://192.168.0.21:8090/Index", "UTF-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	    String apiURL;
	    apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
	    apiURL += "client_id=" + clientId;
	    apiURL += "&client_secret=" + clientSecret;
	    apiURL += "&redirect_uri=" + redirectURI;
	    apiURL += "&code=" + code;
	    apiURL += "&state=" + state;
	    
	    String access_token = "";
	    
//	    System.out.println("apiURL="+apiURL);
	   
	    try {
	      URL url = new URL(apiURL);
	      HttpURLConnection con = (HttpURLConnection)url.openConnection();
	      con.setRequestMethod("GET");
	      int responseCode = con.getResponseCode();
	      
	      BufferedReader br;
//	      System.out.print("responseCode="+responseCode);
	      
	      if(responseCode==200) { // 정상 호출
	        br = new BufferedReader(new InputStreamReader(con.getInputStream()));
	      } else {  // 에러 발생
	        br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
	      }
	      String inputLine;
	      StringBuffer res = new StringBuffer();
	      while ((inputLine = br.readLine()) != null) {
	        res.append(inputLine);
	      }
	      br.close();
	      
	      if(responseCode==200) {
	    	  
	    	  System.out.println(res.toString());
	    	  JSONParser parsing = new JSONParser();
	    	  Object obj = parsing.parse(res.toString());
	    	  JSONObject jsonObj = (JSONObject)obj;
	    	  access_token = (String)jsonObj.get("access_token");
	    	  
	    	  String msg = "";
	    	  Member_dto dto = ApiExamMemberProfile.main(access_token);
	          
	    	  String exit = dao.NaverExit(dto.getId());
	    	  
	    	  if(exit.equals("Y")) {
	    		  dto = null;
	    	  }
	    	  
	    	  if(dto != null) {
	    		msg = dto.getName() + "님 환영합니다.";
	  			HttpSession session = request.getSession();
	  			
	  			session.setAttribute("sessionId", dto.getId());
	  			session.setAttribute("sessionName", dto.getName());
	  			session.setAttribute("sessionLevel_code", dto.getLevel_code());
	  			session.setAttribute("sessionNickname", dto.getNickname());
	  			session.setAttribute("sessionProfile", dto.getProfile_photo());
	  			session.setAttribute("sessionApi", dto.getApi());
	  			session.setMaxInactiveInterval(60*30);
	    	  }else {
	    		  msg = "탈퇴한 회원입니다.";
	    	  }
	    	  
	    	  request.setAttribute("t_msg", msg);
	    	  request.setAttribute("t_url", "/Index");
	      }
	    } catch (Exception e) {
	    	e.printStackTrace();
	    }
	}
}
