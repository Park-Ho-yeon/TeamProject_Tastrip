<%@ page  pageEncoding="UTF-8"%>
    
	<script type="text/javascript">
	    function goMemberPage(gubun, no){
	    	common.t_gubun.value=gubun;
	    	common.t_no.value=no;
			
	    	common.method="post";
	    	common.action="/Member";
	    	common.submit();
		}
	    
	    function goExit(gubun,id){
	    	var yn = confirm('탈퇴하시겠습니까?');
	    	
	    	if(yn){
	    		common.t_gubun.value = gubun;
	    		common.t_id.value = id;
	    		
	    		common.method = "post";
	    		common.action = "/Member";
	    		common.submit();
	    	}
	    }
    </script> 

    
<form name="common">
		<input type="hidden" name="t_gubun">
		<input type="hidden" name="t_no">
		<input type="hidden" name="t_id">
</form>
    
 		<div class="side_menu_box">
                <div class="left_box">
                    <p>마이 페이지</p>
                    <ul class="main_menu">
                        <li><a href="javascript:goMemberPage('mypage','')">내 정보</a>
                            <ul class="sub_menu">
                                <li><a id="menu" href="javascript:goMemberPage('mypage','')" <c:if test="${t_gubun eq 'mypage' or t_gubun eq 'updateForm'}">class="on"</c:if>><c:if test="${t_gubun eq 'mypage' or t_gubun eq 'updateForm'}"><i class="fa-solid fa-cookie-bite"></i></c:if>회원 정보</a></li>
                            	<li><a id="menu" href="javascript:goExit('Exit','${sessionId}')">회원 탈퇴</a></li>
                            </ul>
                        </li>
                        <li><a href="javascript:goMemberPage('favorite','')">내 활동</a>
                            <ul class="sub_menu">
                                <li><a id="menu" href="javascript:goMemberPage('favorite','')" <c:if test="${t_gubun eq 'favorite'}">class="on"</c:if>><c:if test="${t_gubun eq 'favorite'}"><i class="fa-solid fa-cookie-bite"></i></c:if>관심 등록한 가게</a></li>
                                <li><a id="menu" href="javascript:goMemberPage('review','')" <c:if test="${t_gubun eq 'review'}">class="on"</c:if>><c:if test="${t_gubun eq 'review'}"><i class="fa-solid fa-cookie-bite"></i></c:if>작성한 리뷰</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>