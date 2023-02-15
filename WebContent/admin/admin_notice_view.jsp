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
	
	function goList(){
		admin.t_gubun.value="noticeList";
		admin.method="post";
		admin.action="Admin";
		admin.submit();
	}
	
	function goUpdateForm(no){	
		admin.t_gubun.value="noticeUpdateForm";
		admin.t_no.value=no;
		admin.method="post";
		admin.action="Admin";
		admin.submit();
	}
	
	function goDelete(no){
		admin.t_gubun.value="noticeDelete";
		admin.t_no.value=no;
		admin.method="post";
		admin.action="Admin";
		admin.submit();
	}
</script>    
</head>
<body>
   <%@ include file ="/common_loginHeader.jsp" %>
 <form name="admin">
 	<input type="hidden" name="t_gubun">
 	<input type="hidden" name="t_no">
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
            <input type="hidden" name="t_no">
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
                            ${t_dto.getTitle()}
                        </td>
                    </tr>
                    <tr>
                        <th>내용</th>
                        <td colspan="3" class="content">
                            ${t_dto.getContent()}
                        </td>
                    </tr>
                    <tr>
                        <th>작성자</th>
                        <td>
                         	${t_dto.getReg_id()}
                        </td>
                        <th>작성날짜</th>
                        <td>
                            ${t_dto.getReg_date()}
                        </td>
                    </tr>
                </table>
                <div class="btn_group">
                    <input type="button" value="목록" class="c_btn" onclick="goList()">
                    <input type="button" onclick="goUpdateForm('${t_no}')" value="수정">
                    <input type="button" onclick="goDelete('${t_no}')" value="삭제">
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