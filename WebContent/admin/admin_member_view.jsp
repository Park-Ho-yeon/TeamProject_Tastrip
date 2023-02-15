<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "dao.*,dto.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("t_id");
	
	Member_dao dao = new Member_dao();
	
	Member_dto dto = dao.myInfo(id);
	if(dto.getApi()==null) dto.setApi("");
	
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
    <style type="text/css">
    	.n_id{
    		font-size:0.7rem;
    		color:gray;
    	}
    </style>
</head>

<body>
    
    <div class="content content_wrap_2">
        <h1>회원정보</h1>
        <table>
            <tr>
                <th colspan="2" style="text-align: center;" class="before_none">
                    <div class="pf_photo" style="margin: auto;">
                    <%if(dto.getApi().equals("")){%>
                        <img src="../attach/member/profile/<%=dto.getProfile_photo()%>" alt="" id="prvImage">
                    <%}else if(dto.getApi().equals("N")){%>
                    	<img src="<%=dto.getProfile_photo()%>" alt="" id="prvImage">
                    <%}%>
                    </div>
                    <br>
                    <span  style="font-size: 20px;"><%=dto.getNickname()%></span>
                </th>
            </tr>
        </table>
        <br>
        <table>
            <tr>
                <th>아이디</th>
                <td id="id3">
                <%if(dto.getApi().equals("N")){%>
                	<img style="height:20px; vertical-align: middle; margin-right: 5px;" src="../images/login/naver.png">네이버회원
	                 <br>
	               	<span class="n_id"><%=dto.getId()%></span>
                <%}else{%>
	               	<%=dto.getId()%>
                <%}%>
                </td>
            </tr>
            <tr class="ma-t">
                <th>이름</th>
                <td id="name3"><%=dto.getName()%></td>
            </tr>
            <tr>
                <th>생년월일</th>
                <td>
                    <%=dto.getBirth()%>
                </td>
            </tr>
            <tr>
                <th>성별</th>
                <td class="gender">
                   <%=dto.getGender()%>
                </td>
            </tr>
            <tr>
                <th>지역</th>
                <td><%=dto.getCity_code()%></td>
            </tr>
            <tr>
                <th>이메일</th>
                <td>
                    <%=dto.getEmail_1()%>@<%=dto.getEmail_2()%>
                </td>
            </tr>
            <tr>
                <th>휴대전화</th>
                <td>
                    <%=dto.getTell_1()%> - <%=dto.getTell_2()%> - <%=dto.getTell_3()%>
                </td>
            </tr>
        </table>
    </div>
    <div class="input_button">
        <input type="button" onclick="window.close()" value="닫기">
    </div>
    
</body>
</html>