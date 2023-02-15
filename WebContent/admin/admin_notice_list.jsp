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
	    function adminNotice(gubun){
	    	admin.t_gubun.value=gubun;
	    	admin.method="post";
	    	admin.action="/Admin";
	    	admin.submit();
	    }
	    function goPage(pageNum){
	    	admin.t_nowPage.value=pageNum;
			admin.t_gubun.value="noticeList";
	    	admin.method="post";
	    	admin.action="/Admin";
	    	admin.submit();
		}
	    function gosearch(gubun){
	    	sel.t_gubun.value=gubun;
	    	sel.method="post";
	    	sel.action="/Admin";
	    	sel.submit();
	    }
	    function goNoticeView(no){
	    	admin.t_gubun.value="noticeView";
	    	admin.t_no.value=no;
	    	admin.method="post";
	    	admin.action="/Admin";
	    	admin.submit();
	    }
</script>    
</head>
<body>
<form name="admin">
	<input type="hidden" name="t_no">
	<input type="hidden" name="t_gubun">
	<input type="hidden" name="t_nowPage"> 
</form>
   <%@ include file ="/common_loginHeader.jsp" %>
   
    <div id="admin_list">
        <div class="top_header">
            <h1>
                <b>관리자 페이지</b><br>
                <span>[</span> 공지 사항 <span>]</span>
            </h1>
        </div>
        <div class="manager_box">
            <div class="left_box">
                 <%@ include file="/common_admin_menu.jsp" %>
            </div>
            <div class="right_box only_writing">
                <form name="sel">
                <div class="justify-space-between disFlex">
                    <div class="sort_box">
                        <select name="t_list_count" onchange="gosearch('noticeList')">
                            <option value="5" <c:if test="${listCount eq '5'}">selected</c:if>>5개씩 보기</option>
                            <option value="10" <c:if test="${listCount eq '10'}">selected</c:if>>10개씩 보기</option>
                            <option value="15" <c:if test="${listCount eq '15'}">selected</c:if>>15개씩 보기</option>
                        </select>
                        <select name="t_list_order" onchange="gosearch('noticeList')">
                            <option value="reg_date desc,a.n_no desc" <c:if test="${listorder eq 'reg_date desc,a.n_no desc'}">selected</c:if>>등록일 오름차 순</option>
                            <option value="reg_date asc,a.n_no desc" <c:if test="${listorder eq 'reg_date asc,a.n_no desc'}">selected</c:if>>등록일 내림차 순</option>
                            <option value="title asc" <c:if test="${listorder eq 'title asc'}">selected</c:if>>제목 오름차 순</option>
                            <option value="title desc" <c:if test="${listorder eq 'title desc'}">selected</c:if>>제목 내림차 순</option>
                        </select>
                    </div>
                    <input type="hidden" name="t_gubun">
                    <div class="search_box">
                        <select name="t_select">
                            <option value="title" <c:if test="${select eq 'title'}">selected</c:if>>제목</option>
                            <option value="content" <c:if test="${select eq 'content'}">selected</c:if>>내용</option>
                        </select>
                        <input type="text" name="t_search" value="${search}">
                        <button onclick="gosearch('noticeList')"><i class="fa-solid fa-magnifying-glass"></i></button>
                    </div> 
                </div>
                </form>
                <table>
                	<colgroup>
                		<col width="10%">
                		<col width="*">
                		<col width="10%">
                		<col width="15%">
                		<col width="10%">
                	</colgroup>
                	
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>제목</th>
                            <th>등록자</th>
                            <th>등록일자</th>
                            <th>미리보기</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:if test="${empty t_notice}">
                		<tr class="no_result">
                			<td colspan="5" >검색 결과가 없습니다.</td>
                		</tr>
             		</c:if>
                    <c:set var="number" value="${order}"></c:set>
                    <c:forEach items="${t_notice}" var="noti">
						 <tr class="notice_tr">                        
                            <td>
                            ${number}
                           	   <c:set var="number" value="${number -1}"></c:set>
                            </td>
                            <td class="t_left"><a href="javascript:goNoticeView('${noti.getN_no()}')">${noti.getTitle()}</a></td>
                            <td>${noti.getReg_id()}</td>
                            <td>${noti.getReg_date()}</td>
                            <td><a href="/notice/notice_window.jsp?n_no=${noti.getN_no()}" onclick="window.open(this.href, '_blank', 'width=600,height=700,toolbars=no,scrollbars=no'); return false;"><i class="fa-regular fa-window-restore"></i></a></td>
                        </tr>
                     </c:forEach>
                    </tbody>
                </table>
                <div class="write">
                    <a href="javascript:adminNotice('noticeWrite')">글쓰기</a>
                </div>
                
                
               <div class="page"> 
                    	${pageDisplay}
                    <!-- 
                    <a href=""><i class="fa-solid fa-angle-left"></i></a>
                    <a href="" class="choice">1</a>
                    <a href="">2</a>
                    <a href="">3</a>
                    <a href="">4</a>
                    <a href="">5</a>
                     <a href=""><i class="fa-solid fa-angle-right"></i></a>
                    -->
                </div> 
              
            </div>
        </div>
    </div>
    <!-- FOOTER -->
  		<%@ include file="/common_footer.jsp" %>
    <!-- /FOOTER END -->
</body>
</html>