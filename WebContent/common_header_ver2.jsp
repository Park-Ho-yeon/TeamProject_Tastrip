<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   

	<script type="text/javascript">
		function goMemberMyPage(gubun){
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
		
		function goMemberLogout(gubun){
			if(confirm("로그아웃 하시겠습니까?")){
				page.t_gubun.value=gubun;
				page.method="post";
				page.action="/Member";
				page.submit();
			}
		}
		
		function goStoreList2(keyword){
			search.t_keyword.value=keyword;
			search.method="post";
			search.action="/Store";
			search.submit();
		}
	</script>

	<form name="page">
		<input type="hidden" name="t_gubun">
	</form>
	
    <header>
        <div class="header_wrap disFlex align-center">
            <a href="/Index">
                <img src="../images/logo_design_4.png" class="top_logo" alt="로고">
            </a>
            <ul class="search_bar disFlex">
                <li><input type="text" class="search_v2" placeholder="가게 이름, 메뉴 등" value="${keyword}"></li>
                <li><input type="button" value="검색" onclick="goStoreList2('${keyword}')"></li>
            </ul>
             <div class="disFlex align-center">
                   <!-- ==로그인상태일떄== -->
                   <c:if test="${not empty sessionId}">
		            <c:if test="${sessionLevel_code eq 'business'}">
	                	<i class="fa-solid fa-user-tie fa-lg" title="사업자 회원"></i>
	                	<a href="javascript:goMemberMyPage('b_mypage')" class="top_btn">마이페이지</a>
		            </c:if>
		            
		            <c:if test="${sessionLevel_code eq 'member'}">
		            <div class="member_profile">
		                <a href="javascript:goMemberMyPage('mypage')">
		                    <img src="../attach/member/profile/${sessionProfile}">
		                </a>
		            </div>
		            <a href="javascript:goMemberMyPage('mypage')" class="top_btn">마이페이지</a>
		            </c:if>
		            
		            <c:if test="${sessionLevel_code eq 'admin'}">
		                <a href="/Admin" class="user_icon">
		                    <i class="fa-solid fa-user-gear fa-2x"></i>
		                </a>
		                <a href="/Admin" class="top_btn">관리자페이지</a>
		            </c:if>
		            
	            </c:if>
	            <!-- ==로그인이 안되었을떄==  -->
	              <c:if test="${empty sessionId}">
	                <a href="javascript:goMemberLogin('login')">
	              		<i class="fa-solid fa-circle-user fa-2x"></i>
	             	</a>
	            </c:if>
                ·
                <a href="javascript:goMemberLogout('logout')" class="top_btn">로그아웃</a>
            </div>
           
        </div>
    </header>
