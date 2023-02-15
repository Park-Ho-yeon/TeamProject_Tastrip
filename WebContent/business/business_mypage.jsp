<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/css/common.css">
    <link rel="stylesheet" href="/css/font.css">
    <link rel="stylesheet" href="/css/member.css">
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="https://kit.fontawesome.com/17da812ad5.js" crossorigin="anonymous"></script>
    <title>테이스트립 :: 마이페이지</title>
	
</head>
<body>

    <%@ include file = "/common_loginHeader.jsp" %>
    	
    <div id="member_list">
        <div class="top_header">
            <h1><b>마이 페이지</b><br><span>[</span> 회원 정보 <span>]</span></h1>
        </div>
        <div class="mypage_wrap">
          <%@ include file="/common_BSpage_menu.jsp" %>
            <div class="mypage_box">
                <div class="table_wrap">
                    <div class="info_table disFlex">
                        <div>
                            <div>
                                <span>아이디</span>
                                <p>${sessionId}</p>
                            </div>
                            <div>
                                <span>이름</span>
                                <p>${t_memberDto.getName()}</p>
                            </div>
                            <div>
                                <span>생년월일</span>
                                <p>
                                    ${t_memberDto.getBirth()}
                                </p>
                            </div>
                            <div>
                                <span>성별</span>
                                <p>
                             	    ${t_memberDto.getGender()}
                                </p>
                            </div>
                        </div>
                        <div>
                            <div>
                                <span>지역</span>
                                <p>${t_city_code}</p>
                            </div>
                            <div>
                                <span>이메일</span>
                                <p>
                                    ${t_memberDto.getEmail_1()}@${t_memberDto.getEmail_2()}
                                </p>
                            </div>
                            <div>
                                <span>휴대전화</span>
                                <p>
                                    ${t_memberDto.getTell_1()}-${t_memberDto.getTell_2()}-${t_memberDto.getTell_3()}
                                </p>
                            </div>
                            <div>
                                <span>사업자등록번호</span>
                                <p>
                                    ${t_memberDto.getBs_no()}
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="btn_group disFlex align-center">
                    <input type="button" value="정보 수정" class="updateBtn" onclick="javascript:goMemberPage('b_myupdate', '')">
                </div>
            </div>
        </div>
    </div>
    <!-- FOOTER -->
    <%@ include file="/common_footer.jsp" %>
</body>
</html>