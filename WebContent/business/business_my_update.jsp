<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/common.css">
    <link rel="stylesheet" href="../css/font.css">
    <link rel="stylesheet" href="../css/member.css">
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="https://kit.fontawesome.com/17da812ad5.js" crossorigin="anonymous"></script>
    <title>테이스트립 :: 마이페이지</title>
	<script type="text/javascript">
	    function goUpdate(gubun){
	    	form.t_gubun.value=gubun;
	    	form.method="post";
	    	form.action="/Member";
	    	form.submit();
		}
    </script>
</head>
<body>
    <%@ include file = "/common_loginHeader.jsp" %>
    <div id="member_list">
        <div class="top_header">
            <h1><b>마이 페이지</b><br><span>[</span> 회원 정보 <span>]</span></h1>
        </div>
        <div class="mypage_wrap">
            <%@ include file="/common_BSpage_menu.jsp" %>
        <form name="form">
		<input type="hidden" name="t_gubun">
            <div class="mypage_box">
                <div class="table_wrap">
                    <div class="info_table disFlex">
                        <div>
                            <div>
                                <span>아이디</span>
                                <p class="nowrite_box">${t_id}</p>
                            </div>
                            <div>
                                <span><i class="fa-solid fa-pen-to-square"></i>이름</span>
                                <input type="text" name="t_name" value="${t_memberDto.getName()}">
                            </div>
                            <div>
                                <span>생년월일</span>
                                <p class="nowrite_box">${t_memberDto.getBirth()}</p>
                            </div>
                            <div>
                                <span><i class="fa-solid fa-pen-to-square"></i>성별</span>
                                <div class="gender" name="t_gender">
                                   <input type="radio" name="t_gender" id="genderM" value="m" <c:if test="${t_memberDto.getGender() eq '남자'}">checked</c:if> >
                                    <label for="genderM">남자</label>
                                    <input type="radio" name="t_gender" id="genderF" value="f" <c:if test="${t_memberDto.getGender() eq '여자'}">checked</c:if> >
                                    <label for="genderF">여자</label>
                                </div>
                            </div>
                        </div>
                        <div>
                            <div>
                                <span><i class="fa-solid fa-pen-to-square"></i>지역</span>
                                <select name="t_selectCity" class="input120">
                                <option value="">=선택=</option>
                                <c:forEach items="${t_cityDto}" var="cityDto">
                                <option value="${cityDto.getCommon_code()}" <c:if test="${t_memberDto.getCity_code() eq cityDto.getCommon_code()}">selected</c:if> >${cityDto.getCommon_name()}</option>
                              	</c:forEach>
                                </select>
                            </div>
                            <div>
                                <span><i class="fa-solid fa-pen-to-square"></i>이메일</span>
                                <input type="text" name="t_email" class="input160" value="${t_memberDto.getEmail_1()}"> @
                                <select name="t_domain" class="input120">
                                    <option value="">메일주소</option>
                                    <option value="gmail.com" <c:if test="${t_memberDto.getEmail_2() eq 'gmail.com'}">selected</c:if> >gmail.com</option>
                                    <option value="naver.com" <c:if test="${t_memberDto.getEmail_2() eq 'naver.com'}">selected</c:if> >naver.com</option>
                                    <option value="daum.net" <c:if test="${t_memberDto.getEmail_2() eq 'daum.net'}">selected</c:if> >daum.net</option>
                                </select>
                            </div>
                            <div>
                                <span><i class="fa-solid fa-pen-to-square"></i>휴대전화</span>
                                <input type="text" name="t_tel1" class="input80" maxlength="3" value="${t_memberDto.getTell_1()}"> -
                                <input type="text" name="t_tel2" class="input80" maxlength="4" value="${t_memberDto.getTell_2()}"> -
                                <input type="text" name="t_tel3" class="input80" maxlength="4" value="${t_memberDto.getTell_3()}">
                            </div>
                            <div>
                                <span>사업자등록번호</span>
                                <p class="nowrite_box">
                                    ${t_memberDto.getBs_no()}
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="btn_group disFlex align-center">
					<input type="button" value="취소" class="cancelBtn" onclick="goMemberPage('b_mypage','')">
                    <input type="button" value="정보 수정" class="updateBtn" onclick="goUpdate('b_mypage_update')">
                </div>
            </div>
            </form>
        </div>
    </div>
    <!-- FOOTER -->
    <%@ include file="/common_footer.jsp" %>
</body>
</html>