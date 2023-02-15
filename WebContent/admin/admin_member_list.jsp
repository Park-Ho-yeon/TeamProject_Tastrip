<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		function goAdmin(){
			admin.method="post";
			admin.action="/Admin";
			admin.submit();
		}
		
		function goAdminPage(gubun){
			form.t_gubun.value=gubun;
			form.method="post";
			form.action="/Admin";
			form.submit();
		}
		function goPage(pageNum){
			admin.t_gubun.value="memberList";
			admin.t_nowPage.value=pageNum;
			goAdmin();
		}
		function gosearch(){
			admin.t_gubun.value="memberList";
			goAdmin();
		}
		function goReview(id){
			admin.t_gubun.value="memberList";
			admin.t_no.value=id;
			goAdmin();
		}    
</script>
</head>
<body>
<form name="form">
	<input type="hidden" name="t_gubun">
</form>
    <%@ include file="/common_loginHeader.jsp" %>
    <div id="admin_list">
        <div class="top_header">
            <h1><b>관리자 페이지</b><br>
            <span>[</span> 일반 회원 <span>]</span></h1>
        </div>
        <div class="manager_box">
            <div class="left_box">
                <%@ include file="/common_admin_menu.jsp" %>
            </div>
            <form name="admin">
	            <input type="hidden" name="t_gubun">
				<input type="hidden" name="t_nowPage"> 
				 <input type="hidden" name="t_no">
            <div class="right_box">
                <div class="justify-space-between disFlex">
                    <div class="sort_box">
                          <select name="t_list_count" onchange="gosearch('memberList')">
                            <option value="10" <c:if test="${listCount eq '10'}">selected</c:if>>10개씩 보기</option>
                            <option value="20" <c:if test="${listCount eq '20'}">selected</c:if>>20개씩 보기</option>
                             <option value="30" <c:if test="${listCount eq '30'}">selected</c:if>>30개씩 보기</option>
                        </select>
                        <select name="t_orderby" onchange="gosearch('memberList')">
                            <option value="m.reg_date desc" <c:if test="${t_orderby eq 'm.reg_date desc'}">selected</c:if>>가입 날짜 순</option>
                            <option value="m.name asc" <c:if test="${t_orderby eq 'm.name asc'}">selected</c:if>>이름 순</option>
                            <option value="m.id asc" <c:if test="${t_orderby eq 'm.id asc'}">selected</c:if>>아이디 순</option>
                        </select>
                    </div>
                    <div class="search_box">
                        <select name="t_select">
                            <option value="m.id" <c:if test="${t_select eq 'm.id'}">selected</c:if>>아이디</option>
                            <option value="m.name" <c:if test="${t_select eq 'm.name'}">selected</c:if>>이름</option>
                            <option value="m.nickname" <c:if test="${t_select eq 'm.nickname'}">selected</c:if>>닉네임</option>
                        </select>
                        <input type="text" name="t_search" value="${t_search}">
                        <button onclick="gosearch('memberList')"><i class="fa-solid fa-magnifying-glass"></i></button>
                    </div> 
                </div>
                <table>
              		<colgroup>
                		<col width="7%">
                		<col width="15%">
                		<col width="*">
                		<col width="15%">
                		<col width="15%">
                		<col width="15%">
                		<col width="20%">
                	</colgroup>
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>프로필</th>
                            <th>닉네임</th>
                            <th>아이디</th>
                            <th>이름</th>
                            <th>가입날짜</th>
                            <th>활동내역</th>
                        </tr>
                    </thead>
                    <tbody>
                      <c:if test="${empty dtos}">
                		<tr class="no_result">
                			<td colspan="7" >검색 결과가 없습니다.</td>
                		</tr>
             		  </c:if>
                      <c:set var="number" value="${order}"></c:set>
						<c:forEach items="${dtos}" var="dtos">
                        <tr class="no_pointer">
                            <td>
                            	${number}
                            	<c:set var="number" value="${number -1}"/>
                            </td>
                            <td>
                                <div class="member_profile cursorSet" onclick="window.open('../admin/admin_member_view.jsp?t_id=${dtos.getId()}', '_blank', 'width=600,height=700,toolbars=no,scrollbars=no');">
                                    <c:if test="${dtos.getApi() ne 'N'}">
	                                    <img src="../attach/member/profile/${dtos.getProfile_photo()}">
                            		</c:if>
                            		<c:if test="${dtos.getApi() eq 'N'}">
	                                    <img src="${dtos.getProfile_photo()}">
                            		</c:if>
                                </div>
                            </td>
                            <td class="cursorSet" onclick="window.open('../admin/admin_member_view.jsp?t_id=${dtos.getId()}', '_blank', 'width=600,height=700,toolbars=no,scrollbars=no');">${dtos.getNickname()}</td>
                            <td class="cursorSet" onclick="window.open('../admin/admin_member_view.jsp?t_id=${dtos.getId()}', '_blank', 'width=600,height=700,toolbars=no,scrollbars=no');">
                            	<c:if test="${dtos.getApi() ne 'N'}">
	                                ${dtos.getId()}
                            	</c:if>
                            	<c:if test="${dtos.getApi() eq 'N'}">
	                                ${dtos.getId().substring(0, 8)}
                            	</c:if>
                            </td>
                            <td class="cursorSet" onclick="window.open('../admin/admin_member_view.jsp?t_id=${dtos.getId()}', '_blank', 'width=600,height=700,toolbars=no,scrollbars=no');">${dtos.getName()}</td>
                            <td>${dtos.getReg_date()}</td>
                            <td>
                            <c:if test="${dtos.getRcount() eq '0'}">
                           		<a href="#" onclick="return false;" class="mlbtn review_btn c0">
                            		<i class="fa-regular fa-comment-dots"></i><span>리뷰작성 -</span>
                            	</a>
                            </c:if>	
                            <c:if test="${dtos.getRcount() ne '0'}">
                            	<a href="../admin/admin_member_review.jsp?t_id=${dtos.getId()}" onclick="window.open(this.href, '_blank', 'width=1200,height=700,toolbars=no,scrollbars=no'); return false;" class="mlbtn review_btn">
                            		<i class="fa-regular fa-comment-dots"></i><span>리뷰작성  ${dtos.getRcount()}</span>
                            	</a>
                            </c:if>	
                           	<br>
                            <c:if test="${dtos.getFcount() eq '0'}">
                            	<a href="#" onclick="return false;" class="mlbtn favo_btn c0">
                            		<i class="fa-regular fa-heart"></i><span>관심등록  -</span>
                            	</a>
                            </c:if>	
                            <c:if test="${dtos.getFcount() ne '0'}">
                            	<a href="../admin/admin_member_favorite.jsp?t_id=${dtos.getId()}" onclick="window.open(this.href, '_blank', 'width=800,height=700,toolbars=no,scrollbars=no'); return false;" class="mlbtn favo_btn">
                            		<i class="fa-regular fa-heart"></i><span>관심등록  ${dtos.getFcount()}</span>
                            	</a>
                            </c:if>	
                            </td>
                        </tr>
                     </c:forEach> 
                    </tbody>
                </table>
                <div class="page"> 
                 ${pageDisplay}
                </div>
            </div>
            </form>
        </div>
    </div>
    <!-- FOOTER -->
    <%@ include file="/common_footer.jsp" %>
    <!-- /FOOTER END -->
</body>
</html>