<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://kit.fontawesome.com/17da812ad5.js" crossorigin="anonymous"></script>
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
    <link rel="stylesheet" href="../css/common.css">
    <link rel="stylesheet" href="../css/font.css">
    <link rel="stylesheet" href="../css/admin.css">
    <title>테이스트립 :: 관리자 페이지</title>
<script type="text/javascript">
		function adminAll(){
	    	sel.method="post";
	    	sel.action="/Admin";
	    	sel.submit();
		}
		//메뉴 이동 버튼
	    function goAdminPage(gubun){
			
	    	admin.t_gubun.value=gubun;
	    	admin.method="post";
	    	admin.action="/Admin";
			admin.submit();
		}
	    //완전 삭제 박스
	    function Exit(id){
	    	if(confirm("해당 회원의 모든 데이터를 삭제하시겠습니까?")){
		    	admin.t_id.value=id;
		    	admin.t_gubun.value="MemberExit";
		    	admin.method="post";
		    	admin.action="/Admin";
				admin.submit();
	    	}
	    }
	    //페이지
	    function goPage(page){
	    	sel.t_gubun.value="memberOutList";
	    	sel.t_nowPage.value=page;
	    	adminAll();
	    }
	    //순서 선택박스 or 검색바
	    function gosearch(gubun){
	    	sel.t_gubun.value=gubun;
	    	adminAll();
	    	
	    }
    </script>
</head>
<body>
<form name="admin">
	<input type="hidden" name="t_gubun">
	<input type="hidden" name="t_id">
	
</form>
    <%@ include file="/common_loginHeader.jsp" %>
    <div id="admin_list">
        <div class="top_header">
            <h1>
                <b>관리자 페이지</b><br>
                <span>[</span> 탈퇴 회원 <span>]</span>
            </h1>
        </div>
        <div class="manager_box">
            <div class="left_box">
                 <%@ include file="/common_admin_menu.jsp" %>
            </div>
            <div class="right_box">
            <form name="sel">
            <input type="hidden" name="t_gubun">
            <input type="hidden" name="t_nowPage">
                <div class="justify-space-between disFlex">
                    <div class="sort_box">
                        <select name="t_list_count" onchange="gosearch('memberList')">
                            <option value="10" <c:if test="${listCount eq '10'}">selected</c:if>>10개씩 보기</option>
                            <option value="20" <c:if test="${listCount eq '20'}">selected</c:if>>20개씩 보기</option>
                             <option value="30" <c:if test="${listCount eq '30'}">selected</c:if>>30개씩 보기</option>
                        </select>
                        <select name="t_desc" onchange="gosearch('memberOutList')">
                            <option value="exit_date desc" <c:if test="${t_desc eq 'exit_date desc'}">selected</c:if> >탈퇴 날짜 순</option>
                            <option value="name asc" <c:if test="${t_desc eq 'name asc'}">selected</c:if> >이름 순</option>
                            <option value="id asc" <c:if test="${t_desc eq 'id asc'}">selected</c:if>>아이디 순</option>
                        </select>
                    </div>
                    <div class="search_box">
                        <select name="t_select">
                            <option value="id" <c:if test="${select eq 'id'}">selected</c:if>>아이디</option>
                            <option value="name" <c:if test="${select eq 'name'}">selected</c:if>>이름</option>
                            <option value="nickname" <c:if test="${select eq 'nickname'}">selected</c:if>>닉네임</option>
                        </select>
                        <input type="text" name="t_search" value="${search}">
                        <button onclick="gosearch('memberOutList')"><i class="fa-solid fa-magnifying-glass"></i></button>
                    </div> 
                </div>
                </form>
                
                <table>
              		<colgroup>
                		<col width="10%">
                		<col width="*">
                		<col width="15%">
                		<col width="15%">
                		<col width="15%">
                		<col width="15%">
                		<col width="15%">
                	</colgroup>
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>프로필</th>
                            <th>닉네임</th>
                            <th>아이디</th>
                            <th>이름</th>
                            <th>가입날짜</th>
                            <th>탈퇴날짜</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:if test="${empty dtos}">
                		<tr class="no_result">
                			<td colspan="7" >검색 결과가 없습니다.</td>
                		</tr>
             		</c:if>
                    <c:set var="order" value="${order}"></c:set>
                   	<c:forEach items="${dtos}" var="dtos">
                        <tr class="no_pointer">
                            <td>
                            	${order}
                            	<c:set var="order" value="${order -1}"></c:set>
                            </td>
                            <td>
                                <div class="member_profile">
                                    <c:if test="${dtos.getApi() ne 'N'}">
	                                    <img src="../attach/member/profile/${dtos.getProfile_photo()}">
                            		</c:if>
                            		<c:if test="${dtos.getApi() eq 'N'}">
	                                    <img src="${dtos.getProfile_photo()}">
                            		</c:if>
                                </div>
                            </td>
                            <td>${dtos.getNickname()}</td>
                            <td>
                            	<c:if test="${dtos.getApi() ne 'N'}">
	                                ${dtos.getId()}
                            	</c:if>
                            	<c:if test="${dtos.getApi() eq 'N'}">
	                                ${dtos.getId().substring(0, 8)}
                            	</c:if>
                            </td>
                            <td>${dtos.getName()}</td>
                            <td>${dtos.getReg_date()}</td>
                            <td style="color:red;">${dtos.getExit_date()}</td>                            
                            <!-- 
                            <td class="clean"><a class="aaa" href="javascript:Exit('${dtos.getId()}')"><i class="fa-solid fa-person-through-window"></i>
                            <span>완전삭제</span></a></td>
                             -->
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
<script>
    $(document).ready(function(){
        $('.clean').mouseover(function(){
            $(this).find('span').css('display', 'inline-block');
            $(this).find('i').css('display', 'none');
        });

        $('.clean').mouseout(function(){
            $(this).find('span').css('display', 'none');
            $(this).find('i').css('display', 'block');
        })
        
    });
</script>