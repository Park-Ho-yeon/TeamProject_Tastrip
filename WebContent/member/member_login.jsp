<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>     
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chorme=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/common.css">
    <link rel="stylesheet" href="../css/font.css">
    <link rel="stylesheet" href="../css/member.css">
    <title>로그인 화면</title>
    <script type="text/javascript">
    function goLogin(){
    	login.t_gubun.value="DBMemberLogin";
    	login.method="post";
    	login.action="/Member";
    	login.submit();
    }
    function goJoin(){
    	login.t_gubun.value="join";
    	login.method="post";
    	login.action="/Member";
    	login.submit();
    }
    </script>

</head>
<body>
	<c:if test="${not empty sessionId}">
		<script type="text/javascript">
			location.href="/Index";
		</script>
	</c:if>
    <%@ include file="/common_loginHeader.jsp" %>
    <div class="under_bg">
        <div class="white_box">
            <div class="left_box_join"></div>
            <div class="right_box">
                <h1>LOGIN</h1>
                <form name = "login">
                <input type="hidden" name="t_gubun">
                <div class="inner_box">
                    <div>
                        <div>
                            <span>아이디</span>
                            <input type="text" name="t_id">
                        </div>
                        <div>
                            <span>비밀번호</span>
                            <input type="password" name="t_password" onkeypress="if(event.keyCode==13){goLogin()}" s>
                        </div>
                        <input type="button"onclick="goLogin()" value="로그인" class="loginBtn">
                    </div>
                    <div class="join_link">
                        <p><a href="">아이디/비밀번호 찾기</a></p>
                        <p><a href="javascript:goJoin()">회원가입</a></p>
                    </div>
                </div>
                </form>
                <div class="sns_login">
                    <a href=""><img src="../images/login/kakao_login.png" alt=""></a>
                    <%
					    String clientId = "4ODZSQ4ZmSFd4nMbHZKS";//애플리케이션 클라이언트 아이디값";
					    String redirectURI = URLEncoder.encode("http://192.168.0.21:8090/Member?t_gubun=Naver", "UTF-8");
					    SecureRandom random = new SecureRandom();
					    String state = new BigInteger(130, random).toString();
					    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
					    apiURL += "&client_id=" + clientId;
					    apiURL += "&redirect_uri=" + redirectURI;
					    apiURL += "&state=" + state;
					    
					    session.setAttribute("state", state);
					 %>
                    <a href="<%=apiURL%>"><img src="../images/login/naver_login.png" alt=""></a>
                    <a href=""><img src="../images/login/google_login.png" alt=""></a>
                </div>
            </div>
        </div>
        <%@ include file="/common_loginFooter.jsp" %>
    </div>
</body>
</html>