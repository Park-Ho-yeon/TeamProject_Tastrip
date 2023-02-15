<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "dao.*,dto.*,java.util.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("t_id");
	
	Member_dao dao = new Member_dao();
	Review_dao rdao = new Review_dao();
	
	ArrayList<Review_dto> dtos = rdao.MemberReview(id, "s.s_name", "", "r_no desc", 0, 99);
	
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
<script type="text/javascript">
	function goMemberReview(rno){
		mr.target="blank";
		mr.t_r_no.value=rno;
		mr.method="post";
		mr.action="/Review";
		mr.submit();
	}
</script>
<body>
<form name="mr">
	<input type="hidden" name="t_r_no">
	<input type="hidden" name="t_gubun" value="reviewView">
</form>
    <div class="member_review re">
        <h1><%=id%> 회원의 리뷰 목록</h1>
        <table>
            <colgroup>
                <col width="15%">
                <col width="*">
                <col width="15%">
                <col width="15%">
            </colgroup>
            <thead>
                <tr>
                    <th>가게이름</th>
                    <th>내용</th>
                    <th>별점</th>
                    <th>작성날짜</th>
                </tr>
            </thead>
            <tbody>
            <%for(Review_dto dto : dtos){ %>
                <tr onclick="goMemberReview('<%=dto.getR_no()%>')">
                    <td><%=dto.getS_name()%></td>
                    <td class="td_left"><%=dto.getContent()%></td>
                    <td><%=dto.getStar()%></td>
                    <td><%=dto.getReg_date()%></td>
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