<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*, dto.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	Notice_dao dao = new Notice_dao();
	
	String n_no = request.getParameter("n_no");
	
	Notice_dto dto = dao.noticeView(n_no,"view");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/common.css">
    <link rel="stylesheet" href="../css/font.css">
    <link rel="stylesheet" href="../css/notice_windows.css">
    <script src="https://kit.fontawesome.com/17da812ad5.js" crossorigin="anonymous"></script>
    <title>테이스트립 : 공지사항</title>
</head>
<body>
    <header>
        <div>
            <div>
               <img class="logo" src="../images/logo_small.png">
                <p>당신의 입맛 가이드</p>
            </div>
            <p class="notice">공지사항</p>
        </div>
        <div>
            <p class="title"><%=dto.getTitle()%></p>
        </div>
    </header>
    <div id="content">
        <p><i class="fa-solid fa-pen-to-square"></i><%=dto.getReg_date()%></p>
        <div>
            <p>
              	<%=dto.getContent()%>
            </p>
        </div>
    </div>
    <div class="input_button">
        <input type="button" onclick="window.close()" value="닫기">
    </div>
    
    <!-- <footer>
        <div class="footer">
            <ul class="footer_ul">
                <li><img src="../images/logo_black.png"></li>
                <li>Copyright © Tastrip Corp. All Rights Reserved.</li>
            </ul>
        </div>
    </footer> -->
</body>
</html>