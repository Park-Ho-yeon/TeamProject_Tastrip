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
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=323ee6f187682a0545434981b559d7a2&libraries=services"></script>
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
    <title>테이스트립 :: 회원가입</title>
    <script>
  		function goBusinessSave(){
  			form.t_gubun.value="businessSave";
  			form.method="post";
  			form.action="/Member";
  			form.submit();
  		}

    </script>
</head>
<body>
    <%@ include file="/common_loginHeader.jsp" %>
    <div id="jform_wrap">
    <form name="form">
    	<input type="hidden" name="t_gubun">
        <div class="top_title">
            <h1><b>회원 가입</b><br><span>[</span> 사업자 회원 <span>]</span></h1>
            <div class="step_box disFlex align-center">
                <div id="step_top1">
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
                <div id="step_top3">
                    <img src="../images/join/f_i6.png" alt="">
                    <p>STEP 3</p>
                    <p>가게정보 입력</p>
                </div>
                <p><i class="fa-solid fa-chevron-right fa-2x"></i></p>
                <div id="step_top4" class="step_on">
                    <img src="../images/join/f_i5.png" alt="">
                    <p>STEP 4</p>
                    <p>입력정보 확인</p>
                </div>
            </div>
        </div>
        <input type="hidden" name="t_password" value="${t_memberDto.getPassword()}">
        <input type="hidden" name="x_code" value="${t_storeDto.getX_code()}">
        <input type="hidden" name="y_code" value="${t_storeDto.getY_code()}">
            <!-- STEP_4 -->
            <div id="step_4" class="store_info">
                <h1>[ 입력 정보 확인 ]</h1>
                <table>
                    <tr>
                        <th>사업자 등록번호</th>
                        <td>
                           ${t_memberDto.getBs_no()}
                           <input type="hidden" name="t_bs_no" value="${t_memberDto.getBs_no()}">
                        </td>
                    </tr>
                    <tr>
                        <th>아이디</th>
                        <td>
                           ${t_memberDto.getId()}
                           <input type="hidden" name="t_id" value="${t_memberDto.getId()}">
                        </td>
                    </tr>
                    <tr class="ma-t">
                        <th>이름</th>
                        <td>
                           ${t_memberDto.getName()}
                           <input type="hidden" name="t_name" value="${t_memberDto.getName()}">
                        </td>
                    </tr>
                    <tr>
                        <th>생년월일</th>
                        <td>
                           ${t_memberDto.getBirth()}
                           <input type="hidden" name="t_birth" value="${t_memberDto.getBirth()}">
                        </td>
                    </tr>
                    <tr>
                        <th>성별</th>
                        <td class="gender">
                        	<c:if test="${t_memberDto.getGender() eq 'm'}">
                        		남자
                        	</c:if>
                        	<c:if test="${t_memberDto.getGender() eq 'f'}">
                        		여자
                        	</c:if>
                            <input type="hidden" name="t_gender" value="${t_memberDto.getGender()}">
                        </td>
                    </tr>
                    <tr>
                        <th>지역</th>
                        <td>
                        	${t_memberDto.getCity_code()}
                        	<input type="hidden" name="t_city" value="${t_memberDto.getCity_code()}">
                        </td>
                    </tr>
                    <tr>
                        <th>이메일</th>
                        <td>
                            ${t_memberDto.getEmail_1()} @ ${t_memberDto.getEmail_2()}
                            <input type="hidden" name="t_email1" value="${t_memberDto.getEmail_1()}">
                            <input type="hidden" name="t_email2" value="${t_memberDto.getEmail_2()}">
                        </td>
                    </tr>
                    <tr>
                        <th>휴대전화</th>
                        <td>
                            ${t_memberDto.getTell_1()} - ${t_memberDto.getTell_2()} - ${t_memberDto.getTell_3()}
                            <input type="hidden" name="t_tel1" value="${t_memberDto.getTell_1()}">
                            <input type="hidden" name="t_tel2" value="${t_memberDto.getTell_2()}">
                            <input type="hidden" name="t_tel3" value="${t_memberDto.getTell_3()}">
                        </td>
                    </tr>
                </table>
                <table class="step_4_store_tbl">
                    <tr>
                        <th>가게 이름</th>
                        <td>
                            ${t_storeDto.getS_name()}
                            <input type="hidden" name="t_s_name" value="${t_storeDto.getS_name()}">
                        </td>
                    </tr>
                   
                    <tr>
                        <th>가게 주소</th>
                        <td>
                           	${t_storeDto.getS_address()}
                           	<input type="hidden" name="t_s_city" value="${t_storeDto.getCity_code()}">
                           	<input type="hidden" name="t_s_local" value="${t_storeDto.getLocal_code()}">
                           	<input type="hidden" name="t_s_address" value="${t_storeDto.getS_address()}">
                        </td>
                    </tr>
                    <tr>
                        <th>영업시간</th>
                        <td>
                            ${t_storeDto.getS_time()}
                           	<input type="hidden" name="t_s_time" value="${t_storeDto.getS_time()}">
                        </td>
                    </tr>
                    <tr>
                        <th>가게 연락처</th>
                        <td>
                            ${t_storeDto.getS_tell()}
                            <input type="hidden" name="t_s_tell" value="${t_storeDto.getS_tell()}">
                        </td>
                    </tr>
                    <tr>
                        <th>대표 메뉴</th>
                        <td>
                            <ul class="menu_write">
                                <li>
                                    ${t_storeDto.getS_menu_1()}
                                    <span>${t_storeDto.getS_price_1()}원</span>
                                </li>
                                <c:if test="${not empty t_storeDto.getS_menu_2()}">
	                                <li>
	                                     ${t_storeDto.getS_menu_2()}
	                                    <span>${t_storeDto.getS_price_2()}원</span>
	                                </li>
                                </c:if>
                                <c:if test="${not empty t_storeDto.getS_menu_3()}">
	                                <li>
	                                     ${t_storeDto.getS_menu_3()}
	                                    <span>${t_storeDto.getS_price_3()}원</span>
	                                </li>
                                </c:if>
                                <c:if test="${not empty t_storeDto.getS_menu_4()}">
	                                <li>
	                                     ${t_storeDto.getS_menu_4()}
	                                    <span>${t_storeDto.getS_price_4()}원</span>
	                                </li>
                                </c:if>
                                <c:if test="${not empty t_storeDto.getS_menu_5()}">
	                                <li>
	                                     ${t_storeDto.getS_menu_5()}
	                                    <span>${t_storeDto.getS_price_5()}원</span>
	                                </li>
                                </c:if>
                            </ul>
                            <input type="hidden" name="t_s_menu_name_1"  value="${t_storeDto.getS_menu_1()}">
                            <input type="hidden" name="t_s_menu_price_1" value="${t_storeDto.getS_price_1()}">
                            <input type="hidden" name="t_s_menu_name_2"  value="${t_storeDto.getS_menu_2()}">
                            <input type="hidden" name="t_s_menu_price_2" value="${t_storeDto.getS_price_2()}">
                            <input type="hidden" name="t_s_menu_name_3"  value="${t_storeDto.getS_menu_3()}">
                            <input type="hidden" name="t_s_menu_price_3" value="${t_storeDto.getS_price_3()}">
                            <input type="hidden" name="t_s_menu_name_4"  value="${t_storeDto.getS_menu_4()}">
                            <input type="hidden" name="t_s_menu_price_4" value="${t_storeDto.getS_price_4()}">
                            <input type="hidden" name="t_s_menu_name_5"  value="${t_storeDto.getS_menu_5()}">
                            <input type="hidden" name="t_s_menu_price_5" value="${t_storeDto.getS_price_5()}">
                        </td>
                    </tr>
                    <tr>
                        <th>가게 사진</th>
                        <td>
                            <div id='image_preview_step4'>
                               <c:forEach items="${t_attachFiles}" var="attach">
                                <img src="../attach/store/${t_storeDto.getS_name()}/${attach}" alt="">
                                <input type="hidden" name="t_attach" value="${attach}">
                                </c:forEach>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th>가게 설명</th>
                        <td class="s_content_text">
                        	${v_content}
                        	 <input type="hidden" name="t_s_content" value="${t_storeDto.getS_content()}">
                        </td>
                    </tr>
                    <tr>
                        <th>메뉴 종류</th>
                        <td>
                        ${s_menu_name}
                       	 <input type="hidden" name="t_menu_code" value="${t_storeDto.getMenu_code()}">
                        </td>
                    </tr>
                    <tr>
                        <th>상세조건</th>
                        <td>
                            <div class="theme_box">
                                <ul class="control-group">
                                <c:forEach items="${t_themeDto}" var="themedto">
                                <c:if test="${themedto.getCommon_code() eq t_storeDto.getTheme_code_1()}">
                                    <li>
                                        <label class="control control-checkbox">
                                            ${themedto.getCommon_name()}
                                            <input type="checkbox" name="theme" value="${themedto.getCommon_code()}" checked>
                                            <div class="control_indicator"></div>
                                        </label>
                                    </li>
                                </c:if>
                                <c:if test="${themedto.getCommon_code() eq t_storeDto.getTheme_code_2()}">
                                    <li>
                                        <label class="control control-checkbox">
                                            ${themedto.getCommon_name()}
                                            <input type="checkbox" name="theme" value="${themedto.getCommon_code()}" checked>
                                            <div class="control_indicator"></div>
                                        </label>
                                    </li>
                                </c:if>
                                <c:if test="${themedto.getCommon_code() eq t_storeDto.getTheme_code_3()}">
                                    <li>
                                        <label class="control control-checkbox">
                                            ${themedto.getCommon_name()}
                                            <input type="checkbox" name="theme" value="${themedto.getCommon_code()}" checked>
                                            <div class="control_indicator"></div>
                                        </label>
                                    </li>
                                </c:if>
                                </c:forEach>
                                </ul>
                                <input type="hidden" name="t_theme_1" value="${t_storeDto.getTheme_code_1()}">
                                <input type="hidden" name="t_theme_2" value="${t_storeDto.getTheme_code_2()}">
                                <input type="hidden" name="t_theme_3" value="${t_storeDto.getTheme_code_3()}">
                            </div>
                        </td>
                    </tr>    
                    <tr class="step_4_map">
                        <td>
							<div id="map" style="width:400px;height:300px;"></div>
                        </td>
                    </tr>
                </table>
            </div>
            </form>
            <div class="btn_box disFlex align-center">
                <button class="next_btn" onclick="goBusinessSave()">회원 가입</button>
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
    <script>
    	var xxx = form.x_code.value;
    	var yyy = form.y_code.value;
    
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = { 
		        center: new kakao.maps.LatLng(yyy, xxx), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };
		
		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		
		// 마커가 표시될 위치입니다 
		var markerPosition  = new kakao.maps.LatLng(yyy, xxx); 
		
		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
		    position: markerPosition
		});
		
		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);
	 
	</script>
   <!-- FOOTER -->
   <%@ include file="/common_footer.jsp" %>
    <!-- /FOOTER END -->
</body>
</html>