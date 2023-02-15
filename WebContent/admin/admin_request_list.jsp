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
	    //목록 상세보기
	    function AdminStoreView(no){
	    	admin.t_s_no.value =no;
	    	admin.t_gubun.value="AdminStoreView";
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
			sel.t_gubun.value="requestList";
			sel.t_nowPage.value=pageNum;
			sel.method="post";
	    	sel.action="/Admin";
	    	sel.submit();
		
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
                <span>[</span> 맛집 등록 요청 <span>]</span>
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
                        <select name="t_list_count" onchange="gosearch('requestList')">
                            <option value="10" <c:if test="${list_count eq '10'}">selected</c:if>>10개씩 보기</option>
                            <option value="20" <c:if test="${list_count eq '20'}">selected</c:if>>20개씩 보기</option>
                             <option value="30" <c:if test="${list_count eq '30'}">selected</c:if>>30개씩 보기</option>
                        </select>
                        <select name="t_desc" onchange="gosearch('requestList')">
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
                            <option value="s.id" <c:if test="${select eq 's.id' }">selected</c:if>>등록아이디</option>
                            <option value="s.s_name" <c:if test="${select eq 's.s_name' }">selected</c:if>>가게이름</option>
                            <option value="s.s_address" <c:if test="${select eq 's.s_address' }">selected</c:if>>주소</option>
                        </select>
                        <input type="text" name="t_search" value="${search}">
                        <button onclick="gosearch('requestList')"><i class="fa-solid fa-magnifying-glass"></i></button>
                    </div> 
                </div>
                </form>
                
                <table>
                    <colgroup>
                        <col width="7%">
                        <col width="10%">
                        <col width="15%">
                        <col width="20%">
                        <col width="*">
                        <col width="12%">
                        <col width="8%">
                    </colgroup>
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>등록아이디</th>
                            <th>사업자번호</th>
                            <th>가게이름</th>
                            <th>주소</th>
                            <th>등록요청일</th>
                            <th>상세보기</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:if test="${empty adminListN}">
                		<tr class="no_result">
                			<td colspan="7" >검색 결과가 없습니다.</td>
                		</tr>
             		</c:if>
                    <c:set var="order" value="${order}"></c:set>
                    <c:forEach items="${adminListN}" var="dtos">
                        <tr onclick="AdminStoreView('${dtos.getS_no()}')">
                            <td>
                            	${order}
                            	<c:set var="order" value="${order -1}"></c:set>
                            </td>
                            <td>${dtos.getId()}</td>
                            <td>${dtos.getBs_no()}</td>
                            <td class="td_left">${dtos.getS_name()}</td>
                            <td class="td_left">${dtos.getS_address()}</td>
                            <td>${dtos.getReg_date()}</td>
                            <td><a href="javascript:AdminStoreView('${dtos.getS_no()}')"><i class="fa-solid fa-circle-info"></i></a></td>
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