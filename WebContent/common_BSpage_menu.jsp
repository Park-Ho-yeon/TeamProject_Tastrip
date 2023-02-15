<%@ page  pageEncoding="UTF-8"%>
    
<script type="text/javascript">
	    function goMemberPage(gubun, no){
	    	member.t_gubun.value=gubun;
			member.t_s_no.value=no;
			
			member.method="post";
			member.action="/Member";
			member.submit();
		}
    </script>    
    
<form name="member">
		<input type="hidden" name="t_gubun">
		<input type="hidden" name="t_s_no">
</form>
    
  <div class="side_menu_box">
                <div class="left_box">
                    <p>마이 페이지</p>
                    <ul class="main_menu">
                        <li><a href="javascript:goMemberPage('b_mypage','')">내 정보</a>
                            <ul class="sub_menu">
                                <li><a href="javascript:goMemberPage('b_mypage','')" <c:if test="${t_gubun eq 'b_mypage' or t_gubun eq 'b_myupdate'}">class="on"</c:if>><c:if test="${t_gubun eq 'b_mypage' or t_gubun eq 'b_myupdate'}"><i class="fa-solid fa-cookie-bite"></i></c:if> 회원 정보</a></li>
                            </ul>
                        </li>
                        <li><a href="" onclick="return false;">내 가게 관리</a>
                            <ul class="sub_menu">
                                <c:forEach items="${t_myStore}" var="myStore">
                               		<li><a href="javascript:goMemberPage('b_mystore','${myStore.getCommon_code()}')" <c:if test="${myStore.getCommon_code() eq t_s_no}">class="on"</c:if>><c:if test="${myStore.getCommon_code() eq t_s_no}"><i class="fa-solid fa-cookie-bite"></i></c:if>${myStore.getCommon_name()}</a></li>
                               	</c:forEach>
                               	<c:forEach items="${t_waitStore}" var="waitStore">
                               		<li><a href="javascript:goMemberPage('b_mystore','${waitStore.getCommon_code()}')" <c:if test="${waitStore.getCommon_code() eq t_s_no}">class="on"</c:if>><c:if test="${waitStore.getCommon_code() eq t_s_no}"><i class="fa-solid fa-cookie-bite"></i></c:if>${waitStore.getCommon_name()}[검토중]</a></li>
                       			</c:forEach>
                               	<c:forEach items="${t_closeStore}" var="closeStore">
                               		<li><a href="javascript:goMemberPage('b_mystore','${closeStore.getCommon_code()}')" <c:if test="${closeStore.getCommon_code() eq t_s_no}">class="on"</c:if>><c:if test="${closeStore.getCommon_code() eq t_s_no}"><i class="fa-solid fa-cookie-bite"></i></c:if>${closeStore.getCommon_name()}[폐점]</a></li>
                       			</c:forEach>
                            </ul>
                        </li>
                        <li><a href="javascript:goMemberPage('b_storeWrite','')" <c:if test="${t_gubun eq 'b_storeWrite'}">class="on"</c:if>><c:if test="${t_gubun eq 'b_storeWrite'}"><i class="fa-solid fa-cookie-bite"></i></c:if>새로운 가게 등록</a></li>
                    </ul>
                </div>
            </div>