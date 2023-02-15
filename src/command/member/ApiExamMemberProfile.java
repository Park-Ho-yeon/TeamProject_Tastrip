package command.member;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.Map;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import common.CommonExecute;
import common.CommonUtil;
import dao.Member_dao;
import dto.Member_dto;

public class ApiExamMemberProfile {
	
	 public static Member_dto main(String access_token) {
		Member_dao dao = new Member_dao();
        
		String token = access_token; // 네이버 로그인 접근 토큰;
        String header = "Bearer " + token; // Bearer 다음에 공백 추가

        String apiURL = "https://openapi.naver.com/v1/nid/me";

        Map<String, String> requestHeaders = new HashMap<>();
        requestHeaders.put("Authorization", header);
        
        String responseBody = get(apiURL, requestHeaders);
        JSONParser parsing = new JSONParser();
        Object obj = null;
        
		try {
			obj = parsing.parse(responseBody.toString());
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        JSONObject jsonObj = (JSONObject)obj;
        JSONObject resObj = (JSONObject)jsonObj.get("response");
        
        String naverId = (String)resObj.get("id");
       
        String pw = "111";
        try {
			pw = dao.encryptSHA256(pw);
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        String name = (String)resObj.get("name");
        String birthyear = (String)resObj.get("birthyear");
        String birthday = (String)resObj.get("birthday");
        String birth = birthyear+ "-" + birthday;
        String gender = (String)resObj.get("gender");
        if(gender.equals("F")) {
        	gender="f";
        }else {
        	gender = "m";
        }
        
        String email = (String)resObj.get("email");
        int idx = email.indexOf("@");
        String email_1 = email.substring(0, idx);
        String email_2 = email.substring(idx+1);
        String tell = (String)resObj.get("mobile");
        String tell_1 = tell.substring(0,3);
        String tell_2 = tell.substring(4,8);
        String tell_3 = tell.substring(9,13);
        
        String profile_image = (String)resObj.get("profile_image");
        String nickname = (String)resObj.get("nickname");
        String reg_date = CommonUtil.getToday();
        
        Member_dto dto = new Member_dto(naverId, pw, name, birth, gender, "NN", email_1, email_2, tell_1, tell_2, tell_3, profile_image, reg_date, nickname);

        dto.setLevel_code("member");
        dto.setApi("N");
        
        int count = dao.idCheck(naverId);
        
        if(count != 1) {
        	dao.memberSave(dto);
        }else {
        	dao.memberUpdate(dto);
        }
        
        return dto;
	 }


    private static String get(String apiUrl, Map<String, String> requestHeaders){
        HttpURLConnection con = connect(apiUrl);
        
        try {
            con.setRequestMethod("GET");
            
            for(Map.Entry<String, String> header :requestHeaders.entrySet()) {
                con.setRequestProperty(header.getKey(), header.getValue());
            }

            int responseCode = con.getResponseCode();
            
            if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
            	return readBody(con.getInputStream());
            } else { // 에러 발생
            	return readBody(con.getErrorStream());
            }
        } catch (IOException e) {
            throw new RuntimeException("API 요청과 응답 실패", e);
        } finally {
            con.disconnect();
        }
    }


    private static HttpURLConnection connect(String apiUrl){
        try {
            URL url = new URL(apiUrl);
            return (HttpURLConnection)url.openConnection();
            
        } catch (MalformedURLException e) {
        	
            throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
        } catch (IOException e) {
        	
            throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
        }
    }


    private static String readBody(InputStream body){
        InputStreamReader streamReader = new InputStreamReader(body);

        try (BufferedReader lineReader = new BufferedReader(streamReader)) {
            StringBuilder responseBody = new StringBuilder();

            String line;
            
            while ((line = lineReader.readLine()) != null) {
                responseBody.append(line);
            }
            
            return responseBody.toString();
        } catch (IOException e) {
            throw new RuntimeException("API 응답을 읽는데 실패했습니다.", e);
        }
    }
}
