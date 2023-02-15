<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://kit.fontawesome.com/17da812ad5.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="../css/common.css">
    <link rel="stylesheet" href="../css/font.css">
    <link rel="stylesheet" href="../css/admin.css">
    <title>테이스트립 :: 관리자 페이지</title>
<script type="text/javascript">
	    function goAdminPage(gubun){
	    	admin.t_gubun.value=gubun;
	    	admin.method="post";
	    	admin.action="/Admin";
	    	admin.submit();
		}
	    //선택바
	    function gosearch(gubun){
	    	sel.t_gubun.value=gubun;
	    	sel.method="post";
	    	sel.action="/Admin";
	    	sel.submit();
	    }
	    //페이징
	    function goPage(pageNum){
			sel.t_gubun.value="storeList";
			sel.t_nowPage.value=pageNum;
			sel.method="post";
	    	sel.action="/Admin";
	    	sel.submit();
		}
	    //가게 상세보기
	    function goStoreView(s_no){
	    	admin.t_gubun.value="storeView";
	    	admin.t_s_no.value=s_no;
	    	admin.method="post";
	    	admin.action="/Store";
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
                <span>[</span> 맛집 목록 <span>]</span>
            </h1>
        </div>
        <div class="manager_box">
            <div class="left_box">
                 <%@ include file="/common_admin_menu.jsp" %>
            </div>
            <div class="right_box only_writing">
            
            <form name="sel">
            <input type="hidden" name="t_gubun">
             <input type="hidden" name="t_nowPage">
                <div class="justify-space-between disFlex">
                    <div class="sort_box">
                         <select name="t_list_count" onchange="gosearch('storeList')">
                            <option value="10" <c:if test="${list_count eq '10'}">selected</c:if>>10개씩 보기</option>
                            <option value="20" <c:if test="${list_count eq '20'}">selected</c:if>>20개씩 보기</option>
                             <option value="30" <c:if test="${list_count eq '30'}">selected</c:if>>30개씩 보기</option>
                        </select>
                        <select name="t_desc" onchange="gosearch('storeList')">
                            <option value="s.reg_date desc" <c:if test="${t_desc eq 's.reg_date desc' }">selected</c:if>>등록일 오름차 순</option>
                            <option value="s.reg_date asc" <c:if test="${t_desc eq 's.reg_date asc' }">selected</c:if>>등록일 내림차 순</option>
                            <option value="s.s_name desc" <c:if test="${t_desc eq 's.s_name desc' }">selected</c:if>>가게 오름차 순</option>
                            <option value="s.s_name asc" <c:if test="${t_desc eq 's.s_name asc' }">selected</c:if>>가게 내림차 순</option>
                            <option value="s.s_address desc" <c:if test="${t_desc eq 's.s_address desc' }">selected</c:if> >주소 오름차 순</option>
                            <option value="s.s_address asc" <c:if test="${t_desc eq 's.s_address asc' }">selected</c:if> >주소 내림차 순</option>
                        </select>
                    </div>
                    <div class="search_box">
                        <select name="t_select">
                            <option value="m.bs_no" <c:if test="${select eq 'm.bs_no' }">selected</c:if>>사업자번호</option>
                            <option value="s.s_name" <c:if test="${select eq 's.s_name' }">selected</c:if>>가게이름</option>
                            <option value="s.s_address" <c:if test="${select eq 's.s_address' }">selected</c:if>>주소</option>
                        </select>
                        <input type="text" name="t_search" value="${search}">
                        <button onclick="gosearch('storeList')"><i class="fa-solid fa-magnifying-glass"></i></button>
                    </div> 
                </div>
                </form>
                
                <table>
					<colgroup>
                		<col width="7%">
                		<col width="15%">
                		<col width="17%">
                		<col width="*">
                		<col width="15%">
                		<col width="13%">
                	</colgroup>
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>사업자번호</th>
                            <th>가게이름</th>
                            <th>주소</th>
                            <th>리뷰&관심</th>
                            <th>등록일</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:if test="${empty adminListY}">
                		<tr class="no_result">
                			<td colspan="6" >검색 결과가 없습니다.</td>
                		</tr>
             		</c:if>
                    <c:set var="order" value="${order}"></c:set>
                    <c:forEach items="${adminListY}" var="dtos">
                        <tr onclick="goStoreView('${dtos.getS_no()}')">
                            <td>
                            	${order}
                            	<c:set var="order" value="${order -1}"></c:set>
                            </td>
                            <td>${dtos.getBs_no()}</td>
                            <c:choose>
	                            <c:when test="${fn:length(dtos.getS_name())>10}">
									<td class="td_left">${fn:substring(dtos.getS_name(),0,10)}...</td>
								</c:when>
								<c:otherwise>
									<td class="td_left">${dtos.getS_name()}</td>
								</c:otherwise>
							</c:choose>
							 <c:choose>
	                            <c:when test="${fn:length(dtos.getS_address())>30}">
									<td class="td_left">${fn:substring(dtos.getS_address(),0,30)}...</td>
								</c:when>
								<c:otherwise>
									<td class="td_left">${dtos.getS_address()}</td>
								</c:otherwise>
							</c:choose>
                            <!-- <td><span class="no_list">미등록</span></td> -->
                            <td class="td_left moreLeftPad">
                            <c:if test="${dtos.getReview_count() eq '0'}">
                            	<i class="fa-regular fa-comment-dots"></i><span class="review_btn">리뷰 수 -</span><br>
                            </c:if>
                            <c:if test="${dtos.getReview_count() ne '0'}">
                            	<i class="fa-regular fa-comment-dots"></i><span class="review_btn">리뷰 수 ${dtos.getReview_count()}</span><br>
                            </c:if>
                            <c:if test="${empty dtos.getFavCount()}">
                            	<i class="fa-regular fa-heart"></i><span>관심 수 -</span>
                            </c:if>
                            <c:if test="${not empty dtos.getFavCount()}">
                            	<i class="fa-regular fa-heart"></i><span>관심 수 ${dtos.getFavCount()}</span>
                            </c:if>
                            </td>
                            <td>${dtos.getReg_date()}</td>
                        </tr>
                     </c:forEach>   
                    </tbody>
                </table>
                <div class="page"> 
                   ${pageDisplay}
                </div>
            </div>
        </div>
    </div>
    <!-- FOOTER -->
    <%@ include file="/common_footer.jsp" %>
    <!-- /FOOTER END -->
</body>
</html>