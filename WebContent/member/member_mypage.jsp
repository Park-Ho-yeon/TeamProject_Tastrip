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
	    function goMemberUpdate(gubun){
	    	if(member.t_api.value == 'N'){
				alert("소설로그인 계정은 회원정보를 수정할 수 없습니다.");
			}else{
		    	member.t_gubun.value=gubun;
				
				member.method="post";
				member.action="/Member";
				member.submit();
			}
		}
	    
	   
    </script>
</head>

<body>
<form name="member">
	<input type="hidden" name="t_gubun">
	<input type="hidden" name="t_api" value="${t_memberDto.getApi()}">
</form>
    <%@ include file="/common_loginHeader.jsp" %>
	<c:if test="${empty sessionId}">
		<script>
			alert('로그인 정보가 만료되었습니다.');
			location.href="/Index";
		</script>
	</c:if>
    <div id="member_list">
        <div class="top_header">
            <h1><b>마이 페이지</b><br><span>[</span> 회원 정보 <span>]</span></h1>
        </div>
        <div class="mypage_wrap">
            <%@ include file = "/common_Memberpage_menu.jsp" %>
            <div class="mypage_box">
                <div class="table_wrap">
                    <div class="profile_table">
                        <c:if test="${t_memberDto.getApi() ne 'N'}">
	                        <div class="pf_photo">
	                            <img src="/attach/member/profile/${t_memberDto.getProfile_photo()}" alt="" id="prvImage">
	                        </div>
                    	</c:if>
                    	<c:if test="${t_memberDto.getApi() eq 'N'}">
                    		<div class="pf_photo">
		                        <img alt="" src="${t_memberDto.getProfile_photo()}" id="prvImage">
	                        </div>
                    	</c:if>
                        <p>
                            ${t_memberDto.getNickname()}
                        </p>
                    </div>
                    <div class="info_table disFlex">
                        <div>
                            <div>
                                <span>아이디</span>
                                <c:if test="${t_memberDto.getApi() ne 'N'}">
	                                <p>${t_memberDto.getId()}</p>
                                </c:if>
                                <c:if test="${t_memberDto.getApi() eq 'N'}">
                                	<p><img style="height:20px; vertical-align: middle; margin-right: 5px;" src="/images/login/naver.png">소셜로그인</p>
                                	
                                </c:if>
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
                                <p>
                                	${t_memberDto.getCity_code()}
                                </p>
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
                                    ${t_memberDto.getTell_1()} - ${t_memberDto.getTell_2()} - ${t_memberDto.getTell_3()}
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="btn_group disFlex align-center">
                    <input type="button" value="정보 수정" class="updateBtn" onclick="goMemberUpdate('updateForm')">
                </div>
            </div>
        </div>
    </div>
    <!-- FOOTER -->
    <%@ include file="/common_footer.jsp" %>
</body>
</html>