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
 	
		 function goNextStep(gubun){
		 
			member.t_gubun.value=gubun;
			member.method="post";
			member.action="/Member?t_gubun=bussinessStep4";
			member.submit();
		}
	      
		 function goLocal(){
	          $.ajax({
	            type : "POST",
	            url : "MemberLocPlz",
	            data: "t_city_select="+ member.t_city_select.value,
	            dataType : "text",
	            error : function(){
	               alert('통신실패!!');
	            },
	            success : function(data){
	               var json = JSON.parse(data.trim());
	               
	               $("#local_select>option").not('#Localclear').remove();
	               for(var i = 0; i < json.length; i++){
	                  code = json[i].code;
	                  name = json[i].name;
	                  
	                  $("#local_select").append("<option value="+code+">"+name+"</option>");
	               }
	            }
	         });   
	       }    
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
                <div id="step_top2">
                    <img src="../images/join/f_i4.png" alt="">
                    <p>STEP 2</p>
                    <p>회원정보 입력</p>
                </div>
                <p><i class="fa-solid fa-chevron-right fa-2x"></i></p>
                <div id="step_top3" class="step_on">
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
       

            <!-- STEP_3 -->
             <form name="member" enctype="multipart/form-data">
					<input type="hidden" name="t_gubun">
					<input type="hidden" name="t_id" value="${t_memberDto.getId()}">
					<input type="hidden" name="t_password" value="${t_memberDto.getPassword()}">
					<input type="hidden" name="t_name" value="${t_memberDto.getName()}">
					<input type="hidden" name="t_year" value="${t_year}">
					<input type="hidden" name="t_monSelect" value="${t_monSelect}">
					<input type="hidden" name="t_dateSelect" value="${t_dateSelect}">
					<input type="hidden" name="t_birth" value="${t_memberDto.getBirth()}">
					<input type="hidden" name="t_gender" value="${t_memberDto.getGender()}">
					<input type="hidden" name="t_city" value="${t_memberDto.getCity_code()}">
					<input type="hidden" name="t_email" value="${t_memberDto.getEmail_1()}">
					<input type="hidden" name="t_domain" value="${t_memberDto.getEmail_2()}">
					<input type="hidden" name="t_tel1" value="${t_memberDto.getTell_1()}">
					<input type="hidden" name="t_tel2" value="${t_memberDto.getTell_2()}">
					<input type="hidden" name="t_tel3" value="${t_memberDto.getTell_3()}">
					<input type="hidden" name="t_reg_date" value="${t_memberDto.getReg_date()}">
					<input type="hidden" name="t_bs1" value="${t_bs1}">
					<input type="hidden" name="t_bs2" value="${t_bs2}">
					<input type="hidden" name="t_bs3" value="${t_bs3}">
					<input type="hidden" name="t_x_code">
					<input type="hidden" name="t_y_code">
             
	            <div id="step_3" class="content_wrap_2 store_info">
	                <h1>[ 가게 정보 입력 ]</h1>
	                <table>
	                    <tr>
	                        <th>가게 이름</th>
	                        <td>
	                            <input type="text" name="t_s_name" class="input300"">
	                            <span></span>
	                        </td>
	                    </tr>
	                    <tr>
	                        <th>가게 주소</th>
	                        <td>
	                            <select name="t_city_select" id="city_select" class="city_select" onclick="goMapView()" onchange="goLocal()">
	                               <option value="">=선택=</option>
		                             <c:forEach items="${t_cityDto}" var="dto">
		                             	<option value="${dto.getCommon_code()}">${dto.getCommon_name()}</option>
		                             </c:forEach>
	                            </select>
	                            
	                            <select name="t_local_select" id="local_select" class="local_select" onclick="goMapView()" >
	                               <option value="" id="Localclear">=선택=</option>
	                            </select>
	                            <input type="text" name="t_address" class="input300 adr" placeholder="상세주소" onkeyup="goMapView()">
	                        </td>
	                    </tr>
	                    <tr>
	                        <th>위치</th>
	                        <td>
	                        	<div id="map" style="width:600px;height:450px;"></div>
	                        </td>
	                        
	                    </tr>
	                    <tr>
	                        <th>영업시간</th>
	                        <td>
	                            <input type="text" class="timepicker input120" name="t_opentime" placeholder="00:00">
	                            ~
	                            <input type="text" class="timepicker input120" name="t_endtime" placeholder="00:00">
	                        </td>
	                    </tr>
	                    <tr>
	                        <th>가게 연락처</th>
	                        <td>
	                            <input type="text" name="t_s_tell1" class="input100" maxlength="4" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"> -
	                            <input type="text" name="t_s_tell2" class="input100" maxlength="4" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"> -
	                            <input type="text" name="t_s_tell3" class="input100" maxlength="4" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
	                        </td>
	                    </tr>
	                    <tr>
	                        <th>가게 사진</th>
	                        <td>
	                            <div id='image_preview'>
	                                <input type='file' name="t_photo" id='btnAtt' multiple='multiple'>
	                                <div id='att_zone' data-placeholder='원하시는 이미지를 추가해주세요.(최대 5개)'></div>
	                            </div>
	                        </td>
	                    </tr>
	                    <tr>
	                        <th>가게 설명</th>
	                        <td>
	                            <textarea name="t_s_content" id="" placeholder="최대1000자"></textarea>
	                        </td>
	                    </tr>
	                    <tr>
	                        <th>메뉴 종류</th>
	                        <td>
	                            <select name="t_s_menu">
	                                <option value="">= 선택 =</option>
	                                <c:forEach items="${t_menuDto}" var="menuDto">
	                                	<option value="${menuDto.getCommon_code()}">${menuDto.getCommon_name()}</option>
	                                </c:forEach>
	                            </select>
	                        </td>
	                    </tr>
	                    <tr>
	                        <th>대표 메뉴</th>
	                        <td>
	                            <ul class="menu_write">
	                                <li>
	                                    <input type="text" name="t_s_menu_name_1" placeholder="1. 메뉴명(최소 한개)">
	                                    <input type="text" name="t_s_menu_price_1" placeholder="가격" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
	                                </li>
	                                <li>
	                                    <input type="text" name="t_s_menu_name_2" placeholder="2. 메뉴명">
	                                    <input type="text" name="t_s_menu_price_2" placeholder="가격" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
	                                </li>
	                                <li>
	                                    <input type="text" name="t_s_menu_name_3" placeholder="3. 메뉴명">
	                                    <input type="text" name="t_s_menu_price_3" placeholder="가격" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
	                                </li>
	                                <li>
	                                    <input type="text" name="t_s_menu_name_4" placeholder="4. 메뉴명">
	                                    <input type="text" name="t_s_menu_price_4" placeholder="가격" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
	                                </li>
	                                <li>
	                                    <input type="text" name="t_s_menu_name_5" placeholder="5. 메뉴명">
	                                    <input type="text" name="t_s_menu_price_5" placeholder="가격" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
	                                </li>
	                            </ul>
	                        </td>
	                    </tr>
	                    <tr>
	                        <th>상세조건</th>
	                        <td>
	                        
	                       <c:forEach items="${t_themeDto}" var="themeDto">
	                            <div class="theme_box">
	                                <ul class="control-group">
	                                    <li>
	                                        <label class="control control-checkbox">
	                                            ${themeDto.getCommon_name()}
	                                            <input type="checkbox" name="t_theme" value="${themeDto.getCommon_code()}">
	                                            <div class="control_indicator"></div>
	                                        </label>
	                                    </li>
	                                </ul>
	                            </div>
	                       </c:forEach>
	                        </td>
	                    </tr>    
	                </table>
            	</div>
            </form>
            <script type="text/javascript">

	            //체크박스 갯수 제한
	            $("input[type='checkbox']").on("click",function(){
	                let count = $("input:checked[type='checkbox']").length;
	
	                if(count>3){
	                    $(this).prop("checked",false);
	                    alert('키워드는 최대 3개까지 선택 가능합니다.');
	                }
	            });
            </script>
            <script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
            <script>
                $('.timepicker').timepicker({
                    timeFormat: 'HH:mm',
                    interval: 30,
                    startTime: '00:00',
                    dynamic: false,
                    dropdown: true,
                    scrollbar: true
                });
            </script>
            <div class="btn_box disFlex align-center">
                <button class="next_btn" onclick="goNextStep('bussinessStep4')">다음 단계로 <i class="fa-solid fa-angles-right"></i></button>
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
            
            /*
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
            */
            
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

       var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
       mapOption = {
           center: new kakao.maps.LatLng(36.326784, 127.407836), // 지도의 중심좌표
           level: 3 // 지도의 확대 레벨
       };  
      
      // 지도를 생성합니다    
      var map = new kakao.maps.Map(mapContainer, mapOption); 
      
      // 주소-좌표 변환 객체를 생성합니다
      var geocoder = new kakao.maps.services.Geocoder();
      
      // 마커가 표시될 위치입니다 
      var markerPosition  = new kakao.maps.LatLng(36.326784, 127.407836); 
   
      // 마커를 생성합니다
      var marker = new kakao.maps.Marker({
          position: markerPosition
      });
      
      marker.setMap(map);
      
      function goMapView(){
         var city = document.getElementById('city_select');
          city =   city.options[city.selectedIndex].text;
          
          var local = document.getElementById('local_select');
          local =  local.options[local.selectedIndex].text;
          
         var address = city + " " + local + " " + member.t_address.value;

         // 주소로 좌표를 검색합니다
         geocoder.addressSearch(address, function(result, status) {
            
            // 정상적으로 검색이 완료됐으면 
              if (status === kakao.maps.services.Status.OK) {
                var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
                console.log(coords);
                 var x_code = result[0].x;
                 var y_code = result[0].y;
                 
                 member.t_x_code.value = x_code;
                 member.t_y_code.value = y_code;
                 
               	 marker.setPosition(coords);
                 map.setCenter(coords);
             } 
             
         });    
         
      }
      
   </script>
   <!-- FOOTER -->
   <%@ include file="/common_footer.jsp" %>
    <!-- /FOOTER END -->
</body>
</html>