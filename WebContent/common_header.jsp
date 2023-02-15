<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   

	<script type="text/javascript">
		function goMemberMyPage(gubun){
//			alert('마이페이지로 이동하겠습니다.');
			page.t_gubun.value=gubun;
			page.method="post";
			page.action="/Member";
			page.submit();
		}
		
		function goMemberLogin(gubun){
			if(confirm("로그인 하시겠습니까?")){
				page.t_gubun.value=gubun;
				page.method="post";
				page.action="/Member";
				page.submit();
			}
		}
	</script>

	<form name="page">
		<input type="hidden" name="t_gubun">
	</form>
	
	  <header>
        <div class="header_wrap disFlex align-center justify-space-between">
            <a href="/Index">
                <img src="../images/logo_design_4.png" alt="로고">
            </a>
            <ul class="search_bar disFlex">
                <li><input type="text" class="search_1" placeholder="지역"></li>
                <li><input type="text" class="search_2" placeholder="가게이름, 메뉴"></li>
                <li><input type="text" class="search_3" placeholder="키워드 (데이트, 회식, 카페)"></li>
                <li><input type="button" value="검색"></li>
            </ul>
            <!-- ==로그인상태일떄== -->
            <c:if test="${not empty sessionId}">
            <c:if test="${sessionLevel_code eq 'business'}">
                <a href="javascript:goMemberMyPage('b_mypage')">
                	<i class="fa-solid fa-user-tie fa-2x"></i>
                </a>
            </c:if>
            <c:if test="${sessionLevel_code eq 'member'}">
            <div class="member_profile">
                <a href="javascript:goMemberMyPage('mypage')">
                    <c:if test="${sessionApi ne 'N'}">
	                    <img src="../attach/member/profile/${sessionProfile}">
                	</c:if>
                	<c:if test="${sessionApi eq 'N'}">
	                    <img src="${sessionProfile}">
                	</c:if>
                </a>
            </div>
            </c:if>
            <c:if test="${sessionLevel_code eq 'admin'}">
                <a href="/Admin" class="user_icon">
                    <i class="fa-solid fa-user-gear fa-2x"></i>
                </a>
            </c:if>
            </c:if>
            <!-- ==로그인이 안되었을떄==  -->
              <c:if test="${empty sessionId}">
                <a href="javascript:goMemberLogin('login')">
              		<i class="fa-solid fa-circle-user fa-2x"></i>
             	</a>
            </c:if>
        </div>
    </header>
