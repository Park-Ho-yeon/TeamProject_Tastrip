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
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="https://kit.fontawesome.com/17da812ad5.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
    <title>테이스트립 :: 회원가입</title>
    <script>
	    function checkId(){
			$.ajax({
				type : "POST",
				url : "/MemberCheckId",
				data: "t_id="+ bsjoin.t_id.value,
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
					if(bsjoin.t_id.value=="") result="";
					
				 	 if($.trim(data) == "no"){
				 		$("#idResult").text("중복된 아이디입니다.");
						$("#idResult").css("color","red");
						bsjoin.idCheckValue.value ="no";
						bsjoin.t_id.focus();
					}else if($.trim(data) == "ok"){
				 		$("#idResult").text("사용가능한 아이디입니다.");
						$("#idResult").css("color","blue");
						bsjoin.idCheckValue.value = "ok";
					}else if($.trim(data) == "over"){
						$("#idResult").text("아이디 3~10자 사이");
						$("#idResult").css("color","red");
						bsjoin.idCheckValue.value ="no";
						bsjoin.t_id.focus();
					}else if($.trim(data) == "blank"){
						$("#idResult").text("");
					}
				}
			});	
		 }
		    
		    
		 function goNextStep(gubun){
			
			 if(bsjoin.t_bs1.value==''){
		         alert('첫번째 사업자 번호를 입력해주세요.');
		         bsjoin.t_bs1.focus();
		         return;
		     }
			 
			 if(bsjoin.t_bs2.value==''){
		         alert('두번째 사업자 번호를 입력해주세요.');
		         bsjoin.t_bs2.focus();
		         return;
		     }
			 
			 if(bsjoin.t_bs3.value==''){
		         alert('세번째 사업자 번호를 입력해주세요.');
		         bsjoin.t_bs3.focus();
		         return;
		     }
			 
			 if(bsjoin.t_id.value==''){
		         alert('아이디를 입력해주세요.');
		         bsjoin.t_id.focus();
		         return;
		     }
			
			if(bsjoin.idCheckValue.value=='no'){
		        alert('중복된 아이디로 가입하실 수 없습니다.');
		        bsjoin.t_id.focus();
		        return;
				 }
			
			 if(bsjoin.t_password.value==''){
		         alert('비밀번호를 입력해주세요.');
		         bsjoin.t_password.focus();
		         return;
		     }
			 if(bsjoin.t_password_confirm.value==''){
		         alert('비밀번호 확인란을 입력해주세요.');
		         bsjoin.t_password_confirm.focus();
		         return;
		     }
			  if(bsjoin.t_password.value != bsjoin.t_password_confirm.value){
		  		 alert("비밀번호를 확인해주세요.");
		  		 bsjoin.t_password.focus();
		  		 return;
		  	}
			 if(bsjoin.t_name.value==''){
		         alert('이름을 입력해주세요.');
		         bsjoin.t_name.focus();
		         return;
		     }
			 if(bsjoin.t_year.value==''){
		         alert('출생년도를 입력해주세요.');
		         bsjoin.t_year.focus();
		         return;
		     }
			 if(bsjoin.t_monSelect.value==''){
		         alert('출생월을 입력해주세요.');
		         bsjoin.t_monSelect.focus();
		         return;
		     }
			 if(bsjoin.t_dateSelect.value==''){
		         alert('출생날짜를 입력해주세요.');
		         bsjoin.t_dateSelect.focus();
		         return;
		     }
			 if(bsjoin.t_gender.value==''){
		         alert('성별을 체크해주세요.');
		         bsjoin.t_gender.focus();
		         return;
		     }
			 if(bsjoin.t_city.value==''){
		         alert('지역을 체크해주세요.');
		         bsjoin.t_city.focus();
		         return;
		     }
			 if(bsjoin.t_email.value==''){
		         alert('이메일을 입력해주세요.');
		         bsjoin.t_email.focus();
		         return;
		     }
			 if(bsjoin.t_domain.value==''){
		         alert('도메인을 체크해주세요.');
		         bsjoin.t_domain.focus();
		         return;
		     }
			 if(bsjoin.t_tel1.value==''){
		         alert('첫번째 번호를 입력해주세요.');
		         bsjoin.t_tel1.focus();
		         return;
		     }
			 if(bsjoin.t_tel2.value==''){
		         alert('두번째 번호를 입력해주세요.');
		         bsjoin.t_tel2.focus();
		         return;
		     }
			 if(bsjoin.t_tel3.value==''){
		         alert('세번째 번호를 입력해주세요.');
		         bsjoin.t_tel3.focus();
		         return;
		     }
			 
				 bsjoin.t_gubun.value=gubun;
				 bsjoin.method="post";
				 bsjoin.action="/Member";
				 bsjoin.submit();
			}
    </script>
   
    </script>
</head>
<body>
    <%@ include file="/common_loginHeader.jsp" %>
    <div id="jform_wrap">
        <div class="top_title">
            <h1><b>회원 가입</b><br><span>[</span> 사업자 회원 <span>]</span></h1>
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
                    <img src="../images/join/f_i6.png" alt="">
                    <p>STEP 3</p>
                    <p>가게정보 입력</p>
                </div>
                <p><i class="fa-solid fa-chevron-right fa-2x"></i></p>
                <div id="step_top4">
                    <img src="../images/join/f_i5.png" alt="">
                    <p>STEP 4</p>
                    <p>입력정보 확인</p>
                </div>
            </div>
        </div>
            <!-- STEP_2 -->
            <form name="bsjoin">
				<input type="hidden" name="t_gubun">
            <div id="step_2" class="content_wrap_2">
                <h1>[ 회원 정보 입력 ]</h1>
                <table>
                    <tr>
                        <th>사업자등록번호</th>
                        <td>
                            <input type="text" name="t_bs1" class="input80" placeholder="000" maxlength="3" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"> -
                            <input type="text" name="t_bs2" class="input80" placeholder="00"  maxlength="2" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"> -
                            <input type="text" name="t_bs3" class="input100" placeholder="00000"  maxlength="5" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
                        </td>
                    </tr>
                    <tr>
                        <th>아이디</th>
                        <td>
                            <input type="text" name="t_id" class="input200" onkeyup="checkId()">
                            <span id="idResult"></span>
                            <input type="hidden" name="idCheckValue">
                        </td>
                    </tr>
                    <tr>
                        <th>비밀번호</th>
                        <td><input type="password" name="t_password" class="input300"></td>
                    </tr>
                    <tr>
                        <th>비밀번호 확인</th>
                        <td><input type="password" name="t_password_confirm" class="input300"></td>
                    </tr>
                    <tr class="ma-t">
                        <th>이름</th>
                        <td>
                            <input type="text" name="t_name" class="input200" oninput="this.value = this.value.replace(/[^ㄱㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g, '').replace(/(\..*)\./g, '$1');">
                        </td>
                    </tr>
                    <tr>
                        <th>생년월일</th>
                        <td>
                            <input type="text" name="t_year" class="input100" maxlength="4" placeholder="년(4자)" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
                             <select name="t_monSelect" class="input80">
                                <option value="">월</option>
                             	<%for (int k=1; k<13; k++){ %> 
                             	   <option value="<%=k%>"><%=k %></option>
                                <%}%>
                            </select>
                            <select name="t_dateSelect" class="input80">
                                <option value="">월</option>
                                <%for (int k=1; k<32; k++){ %> 
                             	   <option value="<%=k%>"><%=k %></option>
                                <%}%>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <th>성별</th>
                        <td class="gender">
                            <input type="radio" name="t_gender" id="genderM" value="m">
                            <label for="genderM">남자</label>
                            <input type="radio" name="t_gender" id="genderF" value="f">
                            <label for="genderF">여자</label>
                        </td>
                    </tr>
                    <tr>
                        <th>지역</th>
                        <td>
                            <select name="t_city" class="input100">
                                <option value="">=선택=</option>
	                             <c:forEach items="${t_cityDto}" var="dto">
	                             	<option value="${dto.getCommon_code()}">${dto.getCommon_name()}</option>
	                             </c:forEach>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <th>이메일</th>
                        <td>
                            <input type="text" name="t_email" class="input160"> @
                            <select name="t_domain" class="input120">
                                <option value="">메일주소</option>
                                <option value="gmail.com">gmail.com</option>
                                <option value="naver.com">naver.com</option>
                                <option value="daum.net">daum.net</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <th>휴대전화</th>
                        <td>
                            <input type="text" name="t_tel1" class="input80" maxlength="3" value="010" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"> -
                            <input type="text" name="t_tel2" class="input80" maxlength="4" placeholder="1234" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"> -
                            <input type="text" name="t_tel3" class="input80" maxlength="4" placeholder="1234" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
                        </td>
                    </tr>
                </table>
            </div>
            </form>	
            <div class="btn_box disFlex align-center">
                <button class="next_btn" onclick="goNextStep('bussinessStep3')">다음 단계로 <i class="fa-solid fa-angles-right"></i></button>
                <input type="hidden" id="now_step" value="1">
            </div>
        </div>
    </div>
   <script>
        ( /* att_zone : 이미지들이 들어갈 위치 id, btn : file tag id */
        imageView = function imageView(att_zone, btn){

            var attZone = document.getElementById(att_zone);
            var btnAtt = document.getElementById(btn)
            var sel_files = [];
        
            btnAtt.onchange = function(e){
            var files = e.target.files;
            var fileArr = Array.prototype.slice.call(files)
            for(f of fileArr){
                imageLoader(f);
            }
            }  
            
            // 탐색기에서 드래그앤 드롭 사용
            attZone.addEventListener('dragenter', function(e){
            e.preventDefault();
            e.stopPropagation();
            }, false)
            
            attZone.addEventListener('dragover', function(e){
            e.preventDefault();
            e.stopPropagation();
            
            }, false)
        
            attZone.addEventListener('drop', function(e){
            var files = {};
            e.preventDefault();
            e.stopPropagation();
            var dt = e.dataTransfer;
            files = dt.files;
            for(f of files){
                imageLoader(f);
            }
            
            }, false)
            
            
            /*첨부된 이미지를 배열에 넣고 미리보기 */
            imageLoader = function(file){
            sel_files.push(file);
            var reader = new FileReader();
            reader.onload = function(ee){
                let img = document.createElement('img')
                img.src = ee.target.result;
                attZone.appendChild(makeDiv(img, file));
            }
            
            reader.readAsDataURL(file);
            }
            
            /*첨부된 파일이 있는 경우 checkbox와 함께 attZone에 추가할 div를 만들어 반환 */
            makeDiv = function(img, file){
            var div = document.createElement('div')
            var btn = document.createElement('input')
            btn.setAttribute('type', 'button')
            btn.setAttribute('value', 'X')
            btn.setAttribute('delFile', file.name);
            btn.onclick = function(ev){
                var ele = ev.srcElement;
                var delFile = ele.getAttribute('delFile');
                for(var i=0 ;i<sel_files.length; i++){
                if(delFile== sel_files[i].name){
                    sel_files.splice(i, 1);      
                }
                }
                
                dt = new DataTransfer();
                for(f in sel_files) {
                var file = sel_files[f];
                dt.items.add(file);
                }
                btnAtt.files = dt.files;
                var p = ele.parentNode;
                attZone.removeChild(p)
            }
            div.appendChild(img)
            div.appendChild(btn)
            return div
            }
          }
         )('att_zone', 'btnAtt')
    </script>
   <!-- FOOTER -->
   <%@ include file="/common_footer.jsp" %>
    <!-- /FOOTER END -->
</body>
</html>