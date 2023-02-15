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
	    function goAdminPage(gubun){
	    	admin.t_gubun.value=gubun;
	    	admin.method="post";
	    	admin.action="/Admin";
	    	admin.submit();
		}
	   
	    function goPage(pageNum){
	    	sel.t_gubun.value="businessList";
	    	sel.t_nowPage.value=pageNum;
	    	sel.method="post";
	    	sel.action="/Admin";
	    	sel.submit();
		}
	    
	    function gosearch(gubun){
	    	sel.t_gubun.value=gubun;
	    	sel.method="post";
	    	sel.action="/Admin";
	    	sel.submit();
	    }
	    
	    function goBusinessView(id){
	    	admin.t_id.value=id;
	    	admin.t_gubun.value="AdminBsInfo";
	    	admin.method="post";
	    	admin.action="/Admin";
	    	admin.submit();
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
                <span>[</span> 사업자 회원 <span>]</span>
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
                <div class="disFlex justify-space-between">
                    <div class="sort_box">
                        <select name="t_list_count" onchange="gosearch('memberList')">
                            <option value="10" <c:if test="${listCount eq '10'}">selected</c:if>>10개씩 보기</option>
                            <option value="20" <c:if test="${listCount eq '20'}">selected</c:if>>20개씩 보기</option>
                             <option value="30" <c:if test="${listCount eq '30'}">selected</c:if>>30개씩 보기</option>
                        </select>
                        <select name="t_desc" onchange="gosearch('businessList')">
                            <option value="reg_date desc" <c:if test="${t_desc eq 'reg_date desc'}">selected</c:if> >가입 날짜 순</option>
                            <option value="name asc" <c:if test="${t_desc eq 'name asc'}">selected</c:if> >이름 순</option>
                            <option value="id asc" <c:if test="${t_desc eq 'id asc'}">selected</c:if>>아이디 순</option>
                        </select>
                    </div>
                     <div class="search_box">
                        <select name="t_select">
                            <option value="id" <c:if test="${select eq 'id'}">selected</c:if> >아이디</option>
                            <option value="name" <c:if test="${select eq 'name'}">selected</c:if> >이름</option>
                            <option value="bs_no" <c:if test="${select eq 'bs_no'}">selected</c:if> >사업자번호</option>
                        </select>
                        <input type="text" name="t_search" value ="${search}">
                        <button onclick="gosearch('businessList')"><i class="fa-solid fa-magnifying-glass"></i></button>
                    </div> 
                </div>
                 </form>
                <table>
                
             	   <colgroup>
                		<col width="10%">
                		<col width="*">
                		<col width="20%">
                		<col width="20%">
                		<col width="15%">
                		<col width="13%">
                	</colgroup>
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>사업자번호</th>
                            <th>이름</th>
                            <th>아이디</th>
                            <th>가입날짜</th>
                            <th>상세보기</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:if test="${empty dtos}">
                		<tr class="no_result">
                			<td colspan="6" >검색 결과가 없습니다.</td>
                		</tr>
             		</c:if>
                    <c:set var="order" value="${order}"></c:set>
                   	<c:forEach items="${dtos}" var="dtos">
                        <tr onclick="goBusinessView('${dtos.getId()}')">
                            <td>
                            	${order}
                            	<c:set var="order" value="${order-1}"></c:set>
                            </td>
                            <td>${dtos.getBs_no()}</td>
                            <td>${dtos.getName()}</td>
                            <td>${dtos.getId()}</td>
                            <td>${dtos.getReg_date()}</td>
                            <td><i class="fa-solid fa-circle-info"></i></td>
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