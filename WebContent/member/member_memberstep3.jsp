<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/common.css">
    <link rel="stylesheet" href="../css/font.css">
    <link rel="stylesheet" href="../css/member.css">
    <script src="../js/common.js"></script>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="https://kit.fontawesome.com/17da812ad5.js" crossorigin="anonymous"></script>
    <title>테이스트립 :: 회원가입</title>
    <script type="text/javascript">
    	
    	function goMemberSave(){
    		memberjoin.t_gubun.value="memberSave";
    		memberjoin.method="post";
    		memberjoin.action="/Member";
    		memberjoin.submit();
    	}
    	
    	function goReturn(){
    		memberjoin.t_gubun.value="step2";
    		memberjoin.method="post";
    		memberjoin.action="/Member";
    		memberjoin.submit();
    	}
    </script>
</head>
<body>
<form name="back">
	       	 <input type="hidden" name="t_gubun">
	         <input type="hidden"  value="2" name="t_step">
	         <input type="hidden" name="t_photo" value="${t_memberDto.getProfile_photo()}">
         </form>
    <%@ include file="/common_loginHeader.jsp" %>
    <div id="jform_wrap">
        <div class="top_title">
            <h1><b>회원 가입</b><br><span>[</span> 일반 회원 <span>]</span></h1>
            <div class="step_box disFlex align-center">
                <div id="step_top1" >
                    <img src="../images/join/f_i1.png" alt="">
                    <p>STEP 1</p>
                    <p>개인정보 동의</p>
                </div>
                <p><i class="fa-solid fa-chevron-right fa-2x"></i></p>
                <div id="step_top2">
                    <img src="../images/join/f_i4.png" alt="">
                    <p>STEP 2</p>
                    <p>회원정보 입력</p>
                </div>
                <p><i class="fa-solid fa-chevron-right fa-2x"></i></p>
                <div id="step_top3" class="step_on">
                    <img src="../images/join/f_i5.png" alt="">
                    <p>STEP 3</p>
                    <p>입력정보 확인</p>
                </div>
            </div>
        </div>
         <div id="stepChange_wrap">
         <!-- STEP_3 -->
         <form name="memberjoin" >
	         <input type="hidden" name="t_gubun">
	         <input type="hidden" name="t_password" value="${t_memberDto.getPassword()}">
	         <input type="hidden" name="t_password_confirm" value="${t_password_confirm}">
 				<div id="step_3" class="content_wrap_2">
                <h1>[ 입력 정보 확인 ]</h1>
                <table>
                    <tr>
                        <th colspan="2" style="text-align: center;" class="before_none">
                            <div class="pf_photo" style="margin: auto;">
                            <c:if test="${empty t_memberDto.getProfile_photo()}">
                                <img src="../attach/member/profile/default_profile.png" alt="" id="prvImage">
                            </c:if>
                            <c:if test="${not empty t_memberDto.getProfile_photo()}">
                                <img src="../attach/member/profile/${t_memberDto.getProfile_photo()}" alt="" id="prvImage">
                            </c:if>
                            </div>
                            <br>
                            <span  style="font-size: 20px;">${t_memberDto.getNickname()}</span>
                             <input type="hidden" name="t_nickname" value="${t_memberDto.getNickname()}">
                        </th>
                    </tr>
                </table>
                <br>
                <table>
                    <tr>
                        <th>아이디</th>
                        <td>
                            ${t_memberDto.getId()}
                            <input type="hidden" name="t_id" value="${t_memberDto.getId()}" > 
                            <input type="hidden" name="t_ori_photo" value="${t_memberDto.getProfile_photo()}">
                             <input type="hidden" name="t_fileName" value="${t_fileName}">
                             <!-- 
                              <input type="text" name="t_true_photo" value="${t_ori_photo}">
                              -->
                        </td>
                    </tr>
                    <tr class="ma-t">
                        <th>이름</th>
                        <td>
                           ${t_memberDto.getName()}
                            <input type="hidden" name="t_name" value="${t_memberDto.getName()}" >
                        </td>
                    </tr>
                    <tr>
                        <th>생년월일</th>
                        <td>
                        	${t_year}-${t_monSelect}-${t_dateSelect}
       						  <input type="hidden" value="${t_memberDto.getBirth()}" name="t_birth">
       						  <input type="hidden" value="${t_year}" name="t_year">
       						  <input type="hidden" value="${t_monSelect}" name="t_monSelect">
       						  <input type="hidden" value="${t_dateSelect}" name="t_dateSelect">
       						  
                        </td>
                    </tr>
                    <tr>
                        <th>성별</th>
                        <td class="gender">
                            <c:if test="${t_memberDto.getGender() eq 'm'}">남자</c:if>
                             <c:if test="${t_memberDto.getGender() eq 'f'}">여자</c:if>
                            
                             <input type="hidden" name="t_gender" value="${t_memberDto.getGender()}" >
                        </td>
                    </tr>
                    <tr>
                        <th>지역</th>
                        <td>
                        	${t_city_name}
	                         <input type="hidden" name="t_city_code" value="${t_memberDto.getCity_code()}" >
                        </td>
                    </tr>
                    <tr>
                        <th>이메일</th>
                        <td>
                           ${t_memberDto.getEmail_1()}@${t_memberDto.getEmail_2()}
                            <input type="hidden" name="t_email" value="${t_memberDto.getEmail_1()}" >
                             <input type="hidden" name="t_domain" value="${t_memberDto.getEmail_2()}" >
                        </td>
                    </tr>
                    <tr>
                        <th>휴대전화</th>
                        <td>
                            ${t_memberDto.getTell_1()}- ${t_memberDto.getTell_2()} - ${t_memberDto.getTell_3()}
                             <input type="hidden" name="t_tel1" value="${t_memberDto.getTell_1()}" >
                              <input type="hidden" name="t_tel2" value="${t_memberDto.getTell_2()}" >
                               <input type="hidden" name="t_tel3" value="${t_memberDto.getTell_3()}" >
                        </td>
                    </tr>
                </table>
            </div>
            </form>
        </div>
        <div class="btn_box disFlex align-center">
           <button class="back_btn_3" onclick="goReturn()">이전</button>
            <button class="next_btn" onclick="goMemberSave()">회원 가입</button>
           
        </div>
    </div>
    <!-- 프로필사진 바로 보여주기 -->
    <script type="text/javascript">
        $(function(){               
            function readImage(input) {
                // 인풋 태그에 파일이 있는 경우
                if(input.files && input.files[0]) {
                    // FileReader 인스턴스 생성
                    const reader = new FileReader()
                    // 이미지가 로드가 된 경우
                    reader.onload = e => {
                        const previewImage = document.getElementById("prvImage");
                        previewImage.src = e.target.result;
                    }
                    // reader가 이미지 읽도록 하기
                    reader.readAsDataURL(input.files[0]);
                }
                else {
                    // 이미지 안올렸으면
                    $("#prvImage").attr('src','../images/post/review/default_profile.png');
                }
            }
            // input file에 change 이벤트 부여
            const inputImage = document.getElementById("fileInput");
            inputImage.addEventListener("change", e => {
                $("#prvImage").css("display","block");
                readImage(e.target)
            })   
        });   
    </script>
   <!-- FOOTER -->
   <%@ include file="/common_footer.jsp" %>
	<!-- /FOOTER END -->
</body>
</html>