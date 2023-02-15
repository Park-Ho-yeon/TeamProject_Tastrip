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
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="https://kit.fontawesome.com/17da812ad5.js" crossorigin="anonymous"></script>
    <title>테이스트립 :: 회원가입</title>
    <script>
    
	    function checkId(){
			$.ajax({
				type : "POST",
				url : "/MemberCheckId",
				data: "t_id="+ memberjoin.t_id.value,
				dataType : "text",
				error : function(){
					alert('통신실패!!');
				},
				success : function(data){
					 // alert(data);
					/* if($.trim(data)=="사용 가능"){
						alert("ok");
					}  */
					var result = $.trim(data);
					if(memberjoin.t_id.value=="") result="";
					
				 	 if($.trim(data) == "no"){
				 		$("#idResult").text("중복된 아이디입니다.");
						$("#idResult").css("color","red");
						memberjoin.idCheckValue.value ="no";
						memberjoin.t_id.focus();
					}else if($.trim(data) == "ok"){
				 		$("#idResult").text("사용가능한 아이디입니다.");
						$("#idResult").css("color","blue");
						memberjoin.idCheckValue.value = "ok";
					}else if($.trim(data) == "over"){
						$("#idResult").text("아이디 3~10자 사이");
						$("#idResult").css("color","red");
						memberjoin.idCheckValue.value ="no";
						memberjoin.t_id.focus();
					}else if($.trim(data) == "blank"){
						$("#idResult").text("");
					}
				}
			});	
		 }
	    
		 function checkNickName(){
			$.ajax({
				type : "POST",
				url : "/MemberCheckNickname",
				data: "t_nickname="+ memberjoin.t_nickname.value,
				dataType : "text",
				error : function(){
					alert('통신실패!!');
				},
				success : function(data){
					 // alert(data);
					/* if($.trim(data)=="사용 가능"){
						alert("ok");
					}  */
					
					var result = $.trim(data);
					if(memberjoin.t_nickname.value=="") result="";
					
				 	 if($.trim(data) == "no"){
				 		$("#nicknameResult").text("중복된 닉네임입니다.");
						$("#nicknameResult").css("color","red");
						memberjoin.nicknameCheckValue.value ="no";
						memberjoin.t_nickname.focus();
					}else if($.trim(data) == "ok"){
				 		$("#nicknameResult").text("사용가능한 닉네임입니다.");
						$("#nicknameResult").css("color","blue");
						memberjoin.nicknameCheckValue.value = "ok";
					}else if($.trim(data) == "over"){
						$("#nicknameResult").text("아이디 2~6자 사이");
						$("#nicknameResult").css("color","red");
						memberjoin.nicknameCheckValue.value ="no";
						memberjoin.t_nickname.focus();
					}else if($.trim(data) == "blank"){
						$("#nicknameResult").text("");
					}
				 	 
				 	 /*
					if(memberjoin.t_nickname.value=="") result="";
					$("#nicknameResult").text(result) ;
				 	 if($.trim(data) == "사용불가능합니다."){
						$("#nicknameResult").css("color","red");
						memberjoin.nicknameCheckValue.value ="no";
						memberjoin.t_nickname.focus();
					} else {
						$("#nicknameResult").css("color","blue");
						memberjoin.nicknameCheckValue.value = "ok";
					}  
				 	 */
				}
			});	
		}
	    
	    function goStep3(){
	    	
	    	// 첨부파일 검사
			// 확장자 검사
			
			var fileName = memberjoin.t_photo.value;
			if(fileName !=""){
				var pathFileName = fileName.lastIndexOf(".")+1;    //확장자 제외한 경로+파일명
				var extension = (fileName.substr(pathFileName)).toLowerCase();	//확장자명
				//파일명.확장자
				if(extension != "jpg" && extension != "gif" && extension != "png" && extension != "jpeg"){
	//			if(extension != "pdf" && extension != "hwp" && extension != "jpg"){
					alert(extension +" 형식 파일은 업로드 안됩니다. 한글, PDF 파일만 가능!");
					return;
				}		
			}
		
			// 첨부 용량 체크	
			var file = memberjoin.t_photo;
			var fileMaxSize  = 10; // 첨부 최대 용량 설정
			if(file.value !=""){
				// 사이즈체크
				var maxSize  = 1024 * 1024 * fileMaxSize;  
				var fileSize = 0;
	
				// 브라우저 확인
				var browser=navigator.appName;
				// 익스플로러일 경우
				if (browser=="Microsoft Internet Explorer"){
					var oas = new ActiveXObject("Scripting.FileSystemObject");
					fileSize = oas.getFile(file.value).size;
				}else {
				// 익스플로러가 아닐경우
					fileSize = file.files[0].size;
				}
				//alert("파일사이즈 : "+ fileSize);
	
				if(fileSize > maxSize){
					alert(" 첨부파일 사이즈는 "+fileMaxSize+"MB 이내로 등록 가능합니다. ");
					return;
				}	
			}
	    	
	    	
	    	 if(memberjoin.t_id.value==''){
	             alert('아이디를 입력해주세요.');
	             memberjoin.t_id.focus();
	             return;
	         }
			
	    	if(memberjoin.idCheckValue.value!='ok'){
		        alert('아이디를 확인해주세요.');
		        memberjoin.t_id.focus();
		        return;
	   		 }
	    	
	    	 if(memberjoin.t_password.value==''){
	             alert('비밀번호를 입력해주세요.');
	             memberjoin.t_password.focus();
	             return;
	         }
	    	 if(memberjoin.t_password_confirm.value==''){
	             alert('비밀번호 확인을 입력해주세요.');
	             memberjoin.t_password_confirm.focus();
	             return;
	         }
	    	  if(memberjoin.t_password.value != memberjoin.t_password_confirm.value){
	      		 alert("비밀번호를 확인해주세요.");
	      		 memberjoin.t_password.focus();
	      		 return;
	      	}
	    	 if(memberjoin.t_name.value==''){
	             alert('이름을 입력해주세요.');
	             memberjoin.t_name.focus();
	             return;
	         }
	    	 if(memberjoin.t_year.value==''){
	             alert('출생년도를 입력해주세요.');
	             memberjoin.t_year.focus();
	             return;
	         }
	    	 if(memberjoin.t_monSelect.value==''){
	             alert('출생월을 입력해주세요.');
	             memberjoin.t_monSelect.focus();
	             return;
	         }
	    	 if(memberjoin.t_dateSelect.value==''){
	             alert('출생날짜를 입력해주세요.');
	             memberjoin.t_dateSelect.focus();
	             return;
	         }
	    	 if(memberjoin.t_gender.value==''){
	             alert('성별을 체크해주세요.');
	             memberjoin.t_gender.focus();
	             return;
	         }
	    	 if(memberjoin.t_citySelect.value==''){
	             alert('지역을 체크해주세요.');
	             memberjoin.t_citySelect.focus();
	             return;
	         }
	    	 if(memberjoin.t_email.value==''){
	             alert('이메일을 입력해주세요.');
	             memberjoin.t_email.focus();
	             return;
	         }
	    	 if(memberjoin.t_domain.value==''){
	             alert('도메인을 체크해주세요.');
	             memberjoin.t_domain.focus();
	             return;
	         }
	    	 if(memberjoin.t_tel1.value==''){
	             alert('첫번째 번호를 입력해주세요.');
	             memberjoin.t_tel1.focus();
	             return;
	         }
	    	 if(memberjoin.t_tel2.value==''){
	             alert('두번째 번호를 입력해주세요.');
	             memberjoin.t_tel2.focus();
	             return;
	         }
	    	 if(memberjoin.t_tel3.value==''){
	             alert('세번째 번호를 입력해주세요.');
	             memberjoin.t_tel3.focus();
	             return;
	         }
	    	 if(memberjoin.t_nickname.value==''){
	             alert('닉네임을 입력해주세요.');
	             memberjoin.t_nickname.focus();
	             return;
	         }
			 if(memberjoin.nicknameCheckValue.value=='no'){
			    alert('중복된 닉네임으로 가입하실 수 없습니다.');
			    memberjoin.t_nickname.focus();
			    return;
			 }
	        
			/* if(memberjoin.t_photo.value != memberjoin.t_ori_photo){
		        alert(memberjoin.t_photo.value);
		        memberjoin.t_nickname.focus();
		        return;
				 } */
				 
	        memberjoin.method="post";
			memberjoin.action="/Member?t_gubun=step3";
			memberjoin.submit(); 
		}
	    
		function goReturn(){
			back.t_gubun.value="step1";
			back.method="post";
			back.action="Member";
			back.submit();
		}    
	
		function fileChange(){
	        document.getElementById('fileName').value = document.getElementById('fileInput').files[0].name;
	     }
		
       
    </script>
</head>
<body>
	<form name="back">
	       	 <input type="hidden" name="t_gubun">
	         <input type="hidden"  value="2" name="t_step">
    </form>
    <%@ include file="/common_loginHeader.jsp" %>
    <div id="jform_wrap">
        <div class="top_title">
            <h1><b>회원 가입</b><br><span>[</span> 일반 회원 <span>]</span></h1>
            <div class="step_box disFlex align-center">
                <div id="step_top1">
                    <img src="../images/join/f_i1.png" alt="">
                    <p>STEP 1</p>
                    <p>개인정보 동의</p>
                </div>
                <p><i class="fa-solid fa-chevron-right fa-2x"></i></p>
                <div id="step_top2" class="step_on">
                    <img src="../images/join/f_i4.png" alt="">
                    <p>STEP 2</p>
                    <p>회원정보 입력</p>
                </div>
                <p><i class="fa-solid fa-chevron-right fa-2x"></i></p>
                <div id="step_top3">
                    <img src="../images/join/f_i5.png" alt="">
                    <p>STEP 3</p>
                    <p>입력정보 확인</p>
                </div>
            </div>
        </div>
        <div id="stepChange_wrap">
            <!-- STEP_2 -->
            <form name="memberjoin" enctype="multipart/form-data">
            <input type="hidden" name="t_gubun">
            <div id="step_2" class="content_wrap_2">
                <h1>[ 회원 정보 입력 ]</h1>
                <table>
                    <tr>
                        <th>아이디</th>
                        <td>
                            <input type="text" name="t_id" class="input200" value="${t_memberDto.getId()}" onkeyup="checkId()">
                            <span id="idResult"></span>
                            <input type="hidden" name="idCheckValue">
                        </td>
                    </tr>
                    <tr>
                        <th>비밀번호</th>
                        <td><input type="password" name="t_password" class="input300" value="${t_memberDto.getPassword()}"></td>
                    </tr>
                    <tr>
                        <th>비밀번호 확인</th>
                        <td><input type="password" name="t_password_confirm" class="input300" value="${t_password_confirm}"></td>
                    </tr>
                    <tr class="ma-t">
                        <th>이름</th>
                        <td>
                            <input type="text" name="t_name" class="input200" value="${t_memberDto.getName()}">
                        </td>
                    </tr>
                    <tr>
                        <th>생년월일</th>
                        <td>
                            <input type="text" name="t_year" class="input100" maxlength="4" placeholder="년(4자)" value="${t_year}">
                            <select name="t_monSelect" class="input80">
                                <option value="">월</option>
                                <c:forEach begin="1" end="12" step="1" var="mon">
                                	<option value="${mon}" <c:if test="${mon eq t_monSelect}">selected</c:if>>${mon}</option>
                                </c:forEach>
                            </select>
                            <select name="t_dateSelect" class="input80">
                                <option value="">일</option>
                                <c:forEach begin="1" end="31" step="1" var="date">
                                	<option value="${date}" <c:if test="${date eq t_dateSelect}">selected</c:if>>${date}</option>
                                </c:forEach>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <th>성별</th>
                        <td class="gender">
                            <input type="radio" name="t_gender" id="genderM" <c:if test="${t_memberDto.getGender() eq 'm'}">checked</c:if> value="m">
                            <label for="genderM">남자</label>
                            <input type="radio" name="t_gender" id="genderF" <c:if test="${t_memberDto.getGender() eq 'f'}">checked</c:if> value="f">
                            <label for="genderF">여자</label>
                        </td>
                    </tr>
                    <tr>
                        <th>지역</th>
                        <td>
                             <select name="t_citySelect" class="input100">
                               <option value="">=선택=</option>
	                             <c:forEach items="${t_cityDto}" var="dto">
	                             	<option value="${dto.getCommon_code()}" <c:if test="${t_memberDto.getCity_code() eq dto.getCommon_code() }">selected</c:if>>${dto.getCommon_name()}</option>
	                             </c:forEach>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <th>이메일</th>
                        <td>
                           <input type="text" name="t_email" value="${t_memberDto.getEmail_1()}" class="input160"> @
                            <select name="t_domain" class="input120">
                                <option value="">메일주소</option>
                                <option value="gmail.com" <c:if test="${t_memberDto.getEmail_2() eq 'gmail.com'}">selected</c:if>>gmail.com</option>
                                <option value="naver.com" <c:if test="${t_memberDto.getEmail_2() eq 'naver.com'}">selected</c:if>>naver.com</option>
                                <option value="daum.net" <c:if test="${t_memberDto.getEmail_2() eq 'daum.net'}">selected</c:if>>daum.net</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <th>휴대전화</th>
                        <td>
                             <input type="text" name="t_tel1" class="input80" value="010" maxlength="3"> -
                            <input type="text" name="t_tel2" class="input80" value="${t_memberDto.getTell_2()}" maxlength="4"> -
                            <input type="text" name="t_tel3" class="input80" value="${t_memberDto.getTell_3()}" maxlength="4">
                        </td>
                    </tr>
                </table>
                <table>
                    <tr>
                        <th>프로필사진</th>
                        <td>
                            <div class="pf_photo">
	                            <c:if test="${empty t_memberDto.getProfile_photo()}">
	                                <img src="../attach/member/profile/default_profile.png" alt="" id="prvImage">
	                            </c:if>
	                            <c:if test="${not empty t_memberDto.getProfile_photo()}">
	                                <img src="../attach/member/profile/${t_memberDto.getProfile_photo()}" alt="" id="prvImage">
	                            </c:if>
                            </div>
                            <label for="fileInput">
                                <div class="btn-upload">사진 선택</div>
                            </label>
                            <input type="file" name="t_photo" id="fileInput" onchange="javascript:fileChange()" >
                            <input type="hidden" name="fileName" id="fileName" value="${t_ori_photo}">
                            <input type="hidden" name="t_ori_photo" value="${t_ori_photo}">
                        </td>
                    </tr>
                    <tr>
                        <th>닉네임</th>
                       <td>
	                        <input type="text" name="t_nickname" class="input200" value="${t_memberDto.getNickname()}" onkeyup="checkNickName()">
	                        <span id="nicknameResult"></span>
	                        <input type="hidden" name="nicknameCheckValue">
                       </td>
                    </tr>
                </table>
            </div>
            </form>
        </div>
        <div class="btn_box disFlex align-center">
            <button class="back_btn_1" onclick="goReturn()">이전</button>
            <button class="next_btn" onclick="goStep3()">다음단계로<i class="fa-solid fa-angles-right"></i></button>
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
                    };
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
                readImage(e.target);
            })   
        });   
    </script>
    
   <!-- FOOTER -->
   <%@ include file="/common_footer.jsp" %>
	<!-- /FOOTER END -->
</body>
</html>