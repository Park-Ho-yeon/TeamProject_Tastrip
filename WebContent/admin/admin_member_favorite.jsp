<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "dao.*,dto.*,java.util.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("t_id");
	
	Member_dao dao = new Member_dao();
	
	ArrayList<Store_dto> dtos = dao.StoreList(id, "f.f_date desc", "s.s_name", "", 0, 99);
 %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/common.css">
    <link rel="stylesheet" href="../css/font.css">
    <link rel="stylesheet" href="../css/admin.css">
    <title>테이스트립 :: 회원정보</title>
</head>
<body>
    <div class="member_review">
        <h1><%=id%> 회원의 관심 가게 목록</h1>
        <table>
            <colgroup>
                <col width="30%">
                <col width="*">
                <col width="15%">
            </colgroup>
            <thead>
                <tr>
                    <th>가게이름</th>
                    <th>주소</th>
                    <th>등록날짜</th>
                </tr>
            </thead>
            <tbody>
            <%for(Store_dto dto : dtos){ %>
                <tr>
                    <td><%=dto.getS_name()%></td>
                    <td><%=dto.getS_address()%></td>
                    <td><%=dto.getF_date()%></td>
                </tr>
            <%} %>
            </tbody>
        </table>
    </div>
    <div class="input_button">
        <input type="button" onclick="window.close()" value="닫기">
    </div>
    
</body>
</html>