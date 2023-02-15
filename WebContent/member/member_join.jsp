<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/common.css">
    <link rel="stylesheet" href="../css/font.css">
    <link rel="stylesheet" href="../css/member.css">
    <title>회원가입</title>
</head>
<body>
<script type="text/javascript">

	function goSubMemberPage(gubun){
		join.t_gubun.value=gubun;
		join.method="post";
		join.action="/Member";
		join.submit();
	}
	
	function goAdminPage(gubun){
		join.t_gubun.value=gubun;
		join.method="post";
		join.action="/Admin";
		join.submit();
	}
</script>
<form name="join">
	<input type="hidden" name="t_gubun">
</form>
    <%@ include file="/common_loginHeader.jsp" %>
    <div class="under_bg2">
        <div class="join_box">
            <h1>
                <span>회원가입</span>
            </h1>
            <div>
                <a href="javascript:goSubMemberPage('step1')" class="member">
                    <h4>일반 회원</h4>
                    <div class="icon_box">
                        <div>
                            <img src="../images/join/m_c3.png" alt="">
                            <span>맛집 검색</span>
                        </div>
                        <div>
                            <img src="../images/join/m_c1.png" alt="">
                            <span>리뷰 등록</span>
                        </div>
                        <div>
                            <img src="../images/join/m_c2.png" alt="">
                            <span>관심가게 등록</span>
                        </div>
                    </div>
                </a>
                <a href="javascript:goSubMemberPage('bussinessStep1')" class="busi">
                    <h4>사업자 회원</h4>
                    <div class="icon_box">
                        <div>
                            <img src="../images/join/b_c1.png" alt="">
                            <span>내 가게 등록</span>
                        </div>
                        <div>
                            <img src="../images/join/b_c2.png" alt="">
                            <span>가게 관리</span>
                        </div>
                        <div>
                            <img src="../images/join/b_c3.png" alt="">
                            <span>가게 홍보</span>
                        </div>
                    </div>
                </a>
            </div>
            <span>이미 회원이신가요?</span>
            <a href="/Member">로그인</a>
            <!-- <div class="join_box_line"></div> -->
        </div>
        <%@ include file="/common_loginFooter.jsp" %>
    </div>
</body>
</html>