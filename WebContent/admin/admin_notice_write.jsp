<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://kit.fontawesome.com/17da812ad5.js" crossorigin="anonymous"></script>
    <script type="text/javascript" src="../js/common.js"></script>
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

	function NoticeSave(gubun){
		if(checkValue(noti.t_title,"제목을 입력하세요"))return;
		if(checkValue(noti.t_content,"내용 입력하세요."))return;
		
		noti.t_gubun.value=gubun;
		noti.method="post";
		noti.action="/Admin";
		noti.submit();
	}
	function titleCheck(){
		if(noti.t_title.value.length>48){
			alert("제목은 50자 이하입니다.");
			return;	
		}
	}	
	function contentCheck(){
		if(noti.t_content.value.length>980){
			alert("내용은 1000자 이하입니다.");
			return;	
		}
	}
</script>    
</head>
<body>
   <%@ include file ="/common_loginHeader.jsp" %>
 <form name="admin">
 	<input type="hidden" name="t_gubun">
 </form>  
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
            <form name="noti">
            <input type="hidden" name="t_gubun">
            <div class="right_box">
                <h1><i class="fa-regular fa-pen-to-square"></i>공지사항 작성</h1>
                <table class="write_tbl">
                    <colgroup>
                        <col width="17%">
                        <col width="*%">
                        <col width="17%">
                        <col width="*">
                    </colgroup>
                    <tr>
                        <th>제목</th>
                        <td colspan="3">
                            <input type="text" name="t_title" onkeyup="titleCheck()" maxlength='50'>
                        </td>
                    </tr>
                    <tr>
                        <th>내용</th>
                        <td colspan="3">
                            <textarea name="t_content" onkeyup="contentCheck()" maxlength='1000'></textarea>
                        </td>
                    </tr>
                    <tr>
                        <th>작성자</th>
                        <td>
                         	 ${sessionName}
                        </td>
                        <th>작성날짜</th>
                        <td>
                            ${t_today}
                        </td>
                    </tr>
                </table>
                <div class="btn_group">
                    <input type="button" value="취소" class="c_btn" onclick="goAdminPage('noticeList')">
                    <input type="button" onclick="NoticeSave('noticeSave')" value="저장">
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