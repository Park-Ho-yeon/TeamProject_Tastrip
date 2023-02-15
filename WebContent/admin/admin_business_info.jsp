<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/common.css">
    <link rel="stylesheet" href="../css/font.css">
    <link rel="stylesheet" href="../css/admin.css">
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="https://kit.fontawesome.com/17da812ad5.js" crossorigin="anonymous"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=323ee6f187682a0545434981b559d7a2&libraries=services"></script>
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
    <title>테이스트립 :: 가게 정보 확인</title>
    <script>
	    function goAdminPage(gubun){
	    	admin.t_gubun.value=gubun;
	    	admin.method="post";
	    	admin.action="/Admin";
	    	admin.submit();
		}
	    
	    function goStoreView(s_no){
	    	admin.t_s_no.value=s_no;
	    	admin.t_gubun.value="storeView";
	    	admin.method="post";
	    	admin.action="/Store";
	    	admin.submit();
	    }
	    
	    function goStoreRequest(s_no){
	    	admin.t_s_no.value=s_no;
	    	admin.t_gubun.value="AdminStoreView";
	    	admin.method="post";
	    	admin.action="/Admin";
	    	admin.submit();
	    }
    </script>
</head>
<body>
<form name="admin">
	<input type="hidden" name="t_gubun">
	<input type="hidden" name="t_s_no">
</form>
   <%@ include file="/common_loginHeader.jsp" %>
    <div id="admin_list">
        <div class="top_header">
            <h1>
                <b>관리자 페이지</b><br>
                <span>[</span> 사업자 회원 <span>]</span>
            </h1>
        </div>
        <div class="manager_box">
            <div class="left_box">
                 <%@ include file="/common_admin_menu.jsp" %>
            </div>
            <div class="member_view_wrap">
	           	<h1 class="bs_view_title">${t_id} 회원 정보</h1>
	            <div class="disFlex">
	                <div class="content content_wrap_2 member_info">
	                    <table>
	                        <tr>
	                            <th>사업자등록번호</th>
	                            <td>${t_memberDto.getBs_no()}</td>
	                        </tr>
	                        <tr>
	                            <th>아이디</th>
	                            <td>${t_id}</td>
	                        </tr>
	                        <tr>
	                            <th>이름</th>
	                            <td>${t_memberDto.getName()}</td>
	                        </tr>
	                        <tr>
	                            <th>생년월일</th>
	                            <td>
	                                ${t_memberDto.getBirth()}
	                            </td>
	                        </tr>
	                        <tr>
	                            <th>성별</th>
	                            <td class="gender">
	                                ${t_memberDto.getGender()}
	                            </td>
	                        </tr>
	                        <tr>
	                            <th>지역</th>
	                            <td>${t_city_name}</td>
	                        </tr>
	                        <tr>
	                            <th>이메일</th>
	                            <td>
	                                ${t_memberDto.getEmail_1()}@${t_memberDto.getEmail_2()}
	                            </td>
	                        </tr>
	                        <tr>
	                            <th>휴대전화</th>
	                            <td>
	                                ${t_memberDto.getTell_1()}-${t_memberDto.getTell_2()}-${t_memberDto.getTell_3()}
	                            </td>
	                        </tr>
	                    </table>
	                </div>
	                <div class="bsm_store">
                        <h2>[ 소유한 가게 ]</h2>
                        <ul class="store_list">

                        <c:forEach items="${t_myStore}" var="s">
                        	<li class="cursorSet" onclick="goStoreView('${s.getCommon_code()}')">${s.getCommon_name()}<span class="st_1">현재 운영중</span></li>
                        </c:forEach>
                        <c:forEach items="${t_waitStore}" var="w">
                        	<li class="cursorSet" onclick="goStoreRequest('${w.getCommon_code()}')">${w.getCommon_name()}<span class="st_2">관리자 검토중</span></li>
                        </c:forEach>
                        <c:forEach items="${t_closeStore}" var="c">
                        	<li>${c.getCommon_name()}<span class="st_3">페점</span></li>
                        </c:forEach>
                        </ul>
	                </div>
	            </div>
	            <div class="bsm_btn">
	            	<input type="button" value="이전" onclick="history.back()">
	            </div>
            </div>
        </div>
    </div>
    <!-- FOOTER -->
    <%@ include file="/common_footer.jsp" %>
    <!-- /FOOTER END -->
</body>
</html>