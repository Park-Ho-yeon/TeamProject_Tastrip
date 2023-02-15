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
	    function goMemberPage(gubun){
			member.t_gubun.value=gubun;
			member.method="post";
			member.action="/Member";
			member.submit();
		}
	    function goMemberPageGet(gubun){
	    	 if(member.t_name.value==''){
	             alert('이름을 입력해주세요.');
	             member.t_name.focus();
	             return;
	         }
	    	 if(member.t_city.value==''){
	             alert('지역을 체크해주세요.');
	             member.t_city.focus();
	             return;
	         }
	    	 if(member.t_email_1.value==''){
	             alert('이메일을 입력해주세요.');
	             member.t_email_1.focus();
	             return;
	         }
	    	
	    	 if(member.t_email_2.value==''){
	             alert('도메인을 체크해주세요.');
	             member.t_email_2.focus();
	             return;
	         }
	    	  if(member.t_tel1.value==''){
	             alert('첫번째 번호를 입력해주세요.');
	             member.t_tel1.focus();
	             return;
	         }
	    	 if(member.t_tel2.value==''){
	             alert('두번째 번호를 입력해주세요.');
	             member.t_tel2.focus();
	             return;
	         }
	    	 if(member.t_tel3.value==''){
	             alert('세번째 번호를 입력해주세요.');
	             member.t_tel3.focus();
	             return;
	         }
	    	 
	    	 if(member.t_nickname.value==''){
	             alert('닉네임을 입력해주세요.');
	             member.t_nickname.focus();
	             return;
	         }
	    	 
			 if(member.nicknameCheckValue.value!='ok'){
			    alert('사용하실 수 없는 닉네임입니다.');
			    member.t_nickname.focus();
			    return;
			 }
			 
			member.method="post";
			member.action="/Member?t_gubun="+gubun;
			member.submit();
	    }
	    
	    
	    function checkNickName(){
			$.ajax({
				type : "POST",
				url : "/MemberCheckNickname",
				data: "t_nickname="+ member.t_nickname.value,
				dataType : "text",
				error : function(){
					alert('통신실패!!');
				},
				success : function(data){
					
					var result = $.trim(data);
					if(member.t_nickname.value=="") result="";
					
					if($.trim(data) == "no"){
				 		$("#nicknameResult").text("중복된 닉네임입니다.");
						$("#nicknameResult").css("color","red");
						member.nicknameCheckValue.value ="no";
						member.t_nickname.focus();
					}else if($.trim(data) == "ok"){
				 		$("#nicknameResult").text("사용가능한 닉네임입니다.");
						$("#nicknameResult").css("color","blue");
						member.nicknameCheckValue.value = "ok";
					}else if($.trim(data) == "over"){
						$("#nicknameResult").text("닉네임 2~6자 사이");
						$("#nicknameResult").css("color","red");
						member.nicknameCheckValue.value ="over";
						member.t_nickname.focus();
					}else if($.trim(data) == "blank"){
						$("#nicknameResult").text("");
						member.nicknameCheckValue.value ="blank";
					}else if($.trim(data) == "ook"){
						$("#nicknameResult").text("");
						member.nicknameCheckValue.value ="ok";
					}
				 	 
				}
			});	
			
		}
		
		function fileChange(){
	        document.getElementById('fileName').value = document.getElementById('fileInput').files[0].name;
	     }
		
    </script>
</head>
<body>
    <%@ include file="/common_loginHeader.jsp" %>
    <div id="member_list">
        <div class="top_header">
            <h1><b>마이 페이지</b><br><span>[</span> 회원 정보 수정 <span>]</span></h1>
        </div>
        <div class="mypage_wrap">
            <div class="side_menu_box">
                <div class="left_box">
                    <p>마이 페이지</p>
                    <ul class="main_menu">
                        <li><a href="javascript:goMemberPage('mypage')">내 정보</a>
                            <ul class="sub_menu">
                                <li><a href="javascript:goMemberPage('mypage')" class="on"><i class="fa-solid fa-cookie-bite"></i>회원 정보</a></li>
                            </ul>
                        </li>
                        <li><a href="javascript:goMemberPage('favorite')">내 활동</a>
                            <ul class="sub_menu">
                                <li><a href="javascript:goMemberPage('favorite')">관심 등록한 가게</a></li>
                                <li><a href="javascript:goMemberPage('review')">작성한 리뷰</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="mypage_box">
            <form name="member" enctype="multipart/form-data">
            <input type="hidden" name="t_gubun">
                <div class="table_wrap">
                    <div class="profile_table">
                        <div>
                            <div class="pf_photo">
                                <img src="/attach/member/profile/${t_memberDto.getProfile_photo()}" alt="" id="prvImage">
                            </div>
                            <label for="fileInput">
                                <div class="btn-upload">사진 변경</div>
                            </label>
                            <input type="file" name="t_photo" id="fileInput" onchange="javascript:fileChange()" >
                            <input type="hidden" id="fileName" name="fileName" value="${t_memberDto.getProfile_photo()}">
                            <input type="hidden" name="t_ori_photo" value="${t_memberDto.getProfile_photo()}">
                        </div>
                        <span><i class="fa-solid fa-pen-to-square"></i>닉네임</span>
                        <input type="text" value="${t_memberDto.getNickname()}" name="t_nickname" onkeyup="checkNickName()">
                    	<span id="nicknameResult"></span>
	                    <input type="hidden" name="nicknameCheckValue" value="ok">
	                    <input type="hidden" name="t_ori_nickname" value="${t_memberDto.getNickname()}">
                    </div>
                    <div class="info_table disFlex">
                        <div>
                            <div>
                                <span>아이디</span>
                                <p class="nowrite_box">${t_memberDto.getId()}</p>
                                <input type="hidden" value="${t_memberDto.getId()}" name="t_id" >
                            </div>
                            <div>
                                <span><i class="fa-solid fa-pen-to-square"></i>이름</span>
                                <input type="text" value="${t_memberDto.getName()}" name="t_name" oninput="this.value = this.value.replace(/[^ㄱㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g, '').replace(/(\..*)\./g, '$1');" >
                            </div>
                            <div>
                                <span>생년월일</span>
                                <p class="nowrite_box">${t_memberDto.getBirth()}</p>
                            </div>
                            <div>
                                <span><i class="fa-solid fa-pen-to-square"></i>성별</span>
                                <div class="gender">
                                    <input type="radio" name="t_gender" id="genderM" value="m" <c:if test="${t_memberDto.getGender() eq '남자'}">checked</c:if>>
                                    <label for="genderM">남자</label>
                                    <input type="radio" name="t_gender" id="genderF" value="f" <c:if test="${t_memberDto.getGender() eq '여자'}">checked</c:if>>
                                    <label for="genderF">여자</label>
                                </div>
                            </div>
                        </div>
                        <div>
                            <div>
                                <span><i class="fa-solid fa-pen-to-square"></i>지역</span>
                                <select name="t_city" class="input120">
                                <option value="">=선택=</option>
                                <c:forEach items="${t_cityDto}" var="dto">
                                <option value="${dto.getCommon_name()}" <c:if test="${t_memberDto.getCity_code() eq dto.getCommon_name()}">selected</c:if>>${dto.getCommon_name()}</option>
                                </c:forEach>
                                </select>
                            </div>
                            <div>
                                <span><i class="fa-solid fa-pen-to-square"></i>이메일</span>
                                <input type="text" name="t_email_1" class="input160" value="${t_memberDto.getEmail_1()}"> @
                                <select name="t_email_2" class="input120">
                                    <option value="">메일주소</option>
                                    <option value="gmail.com" <c:if test="${t_memberDto.getEmail_2() eq 'gmail.com'}">selected</c:if>>gmail.com</option>
                                    <option value="naver.com" <c:if test="${t_memberDto.getEmail_2() eq 'naver.com'}">selected</c:if>>naver.com</option>
                                    <option value="daum.net" <c:if test="${t_memberDto.getEmail_2() eq 'daum.net'}">selected</c:if>>daum.net</option>
                                </select>
                            </div>
                            <div>
                                <span><i class="fa-solid fa-pen-to-square"></i>휴대전화</span>
                                <input type="text" name="t_tel1" class="input80" value="${t_memberDto.getTell_1()}" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"> -
                                <input type="text" name="t_tel2" class="input80" value="${t_memberDto.getTell_2()}" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"> -
                                <input type="text" name="t_tel3" class="input80" value="${t_memberDto.getTell_3()}" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
                            </div>
                        </div>
                    </div>
                </div>
                </form>
                <div class="btn_group disFlex align-center">
                    <input type="button" value="취소" class="cancelBtn" onclick="history.back(-1)">
                    <input type="button" value="수정 저장" onclick="goMemberPageGet('update')" class="updateBtn">
                </div>
            </div>
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
                        const previewImage = document.getElementById("prvImage")
                        previewImage.src = e.target.result;
                    };
                    // reader가 이미지 읽도록 하기
                    reader.readAsDataURL(input.files[0])
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
</body>
</html>