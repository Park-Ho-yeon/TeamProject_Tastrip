<%@ page pageEncoding="UTF-8"%>

	<p>관리 사항</p>
    <ul class="main_menu">
        <li><a href="javascript:goAdminPage('memberList')">회원 관리</a>
            <ul class="sub_menu">
                <li><a href="javascript:goAdminPage('memberList')" 
                <c:if test="${t_gubun eq 'memberList'}">class="on"</c:if>>
                <c:if test="${t_gubun eq 'memberList'}"><i class="fa-solid fa-cookie-bite"></i></c:if>일반 회원</a></li>
                <li><a href="javascript:goAdminPage('businessList')" 
                <c:if test="${t_gubun eq 'businessList' or t_gubun eq 'AdminBsInfo'}">class="on"</c:if>>
                <c:if test="${t_gubun eq 'businessList' or t_gubun eq 'AdminBsInfo'}"><i class="fa-solid fa-cookie-bite"></i></c:if>사업자 회원</a></li>
                <li><a href="javascript:goAdminPage('memberOutList')" 
                <c:if test="${t_gubun eq 'memberOutList'}">class="on"</c:if>>
                <c:if test="${t_gubun eq 'memberOutList'}"><i class="fa-solid fa-cookie-bite"></i></c:if>탈퇴 회원</a></li>
            </ul>
        </li>
        <li><a href="javascript:goAdminPage('storeList')">맛집 관리</a>
            <ul class="sub_menu">
                <li><a href="javascript:goAdminPage('storeList')" 
                <c:if test="${t_gubun eq 'storeList'}">class="on"</c:if>>
                <c:if test="${t_gubun eq 'storeList'}"><i class="fa-solid fa-cookie-bite"></i></c:if>맛집 목록</a></li>
                <li><a href="javascript:goAdminPage('requestList')" 
                <c:if test="${t_gubun eq 'requestList' or t_gubun eq 'AdminStoreView'}">class="on"</c:if>>
                <c:if test="${t_gubun eq 'requestList' or t_gubun eq 'AdminStoreView'}"><i class="fa-solid fa-cookie-bite"></i></c:if>새 가게 등록 요청</a></li>
            </ul>
        </li>
        <li><a href="javascript:goAdminPage('noticeList')">공지사항</a>
            <ul class="sub_menu">
                <li><a href="javascript:goAdminPage('noticeList')"
                <c:if test="${t_gubun eq 'noticeList' or t_gubun eq 'noticeWrite' or t_gubun eq 'noticeUpdateForm'}">class="on"</c:if>>
                <c:if test="${t_gubun eq 'noticeList' or t_gubun eq 'noticeWrite' or t_gubun eq 'noticeUpdateForm'}"><i class="fa-solid fa-cookie-bite"></i></c:if>공지사항</a></li>
            </ul>
        </li>
    </ul>
