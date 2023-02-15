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
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=323ee6f187682a0545434981b559d7a2&libraries=services"></script>
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
    <title>테이스트립 :: 가게 정보 수정</title>
    <script>
        $(function(){
            //체크박스 갯수 제한
            $("input[type='checkbox']").on("click",function(){
                let count = $("input:checked[type='checkbox']").length;
        
                if(count>3){
                    $(this).prop("checked",false);
                    alert('키워드는 최대 3개까지 선택 가능합니다.');
                }
             });
        })
        
         function goLocal(){
	          $.ajax({
	            type : "POST",
	            url : "MemberLocPlz",
	            data: "t_city_select="+ update.t_city_select.value,
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
    <script type="text/javascript">
	    function goUpdate(no){
	    	update.t_no.value=no;
	    	update.method="post";
	    	update.action="Member?t_gubun=b_DBupdate";
	    	update.submit();
	    }
	    
	    //기존사진 미리보기 삭제
	    function delImage(e){
	    	var delValue = e.nextElementSibling;
	    	var delInput = delValue.cloneNode();
	    	delInput.setAttribute('name','t_del_attach');
	    	update.append(delInput);
	    	e.parentElement.remove();
	    }
    </script>
	
</head>
<body>
	
    <%@ include file = "/common_loginHeader.jsp" %>
    <div id="member_list">
        <div class="top_header">
            <h1><b>마이 페이지</b><br><span>[</span> 가게 정보 수정 <span>]</span></h1>
        </div>
        <div class="mypage_wrap">
            <%@ include file="/common_BSpage_menu.jsp" %>
            <div>

              <form name="update" enctype="multipart/form-data">
            	<input type="hidden" name="t_gubun">
            	<input type="hidden" name="t_no">
                <div class="list_wrap busi store_info content_wrap_2">
                    <div class="s_write">
                        <h1>가게 정보 수정</h1>
                    </div>
                    <table>
                        <tr>
                            <th>가게 이름</th>
                            <td>
                            	${t_storeDto.getS_name()}
                                <input type="hidden" name="t_s_name" class="input300" value="${t_storeDto.getS_name()}">
                                <span></span>
                            </td>
                        </tr>
                       
                        <tr>
                            <th>가게 주소</th>
                            <td>
                                <select name="t_city_select" id="city_select" class="city_select" onclick="goMapView()" onchange="goLocal()">
                                    <option value="">=선택=</option>
                                    <c:forEach items="${t_cityDto}" var="dto">
		                             	<option value="${dto.getCommon_code()}" <c:if test="${dto.getCommon_name() eq t_city}">selected</c:if>>${dto.getCommon_name()}</option>
		                             </c:forEach>
                                </select>
                                <select name="t_local_select" id="local_select" class="local_select" onclick="goMapView()">
                                  <option value="" id="Localclear" >=선택=</option>
                                  <c:forEach items="${t_localDto}" var="dto">
                                  	    <option value="${dto.getCommon_code()}" <c:if test="${dto.getCommon_name() eq t_local}">selected</c:if>>${dto.getCommon_name()}</option>
                                  </c:forEach>
                               </select>
                                <input type="text" name="t_s_address" class="input300 adr" placeholder="상세주소" value="${t_address}" onkeyup="goMapView()">
                            </td>
                        </tr>
                        <tr>
                            <th>위치</th>
                            <td>
                              <div id="map" style="width:400px;height:300px;"></div>
                              <input type="hidden" name="x_code" value="${t_storeDto.getX_code()}">
							  <input type="hidden" name="y_code" value="${t_storeDto.getY_code()}">
                            </td>
                            
                        </tr>
                        <tr>
                            <th>영업시간</th>
                            <td>
                                <input type="text" name="t_opentime" class="timepicker input120" value="${t_opentime}" placeholder="00:00">
                                ~
                                <input type="text" name="t_endtime" class="timepicker input120" value="${t_endtime}" placeholder="00:00">
                            </td>
                        </tr>
                        <tr>
                            <th>가게 연락처</th>
                            <td>
                                <input type="text" name="t_tell1" class="input100" value="${t_tell1}"> -
                                <input type="text" name="t_tell2" class="input100" value="${t_tell2}"> -
                                <input type="text" name="t_tell3" class="input100" value="${t_tell3}">
                            </td>
                        </tr>
                        <tr>
                            <th>가게 사진</th>
                            <td>
                                <div id='image_preview'>
                                    <input type='file' id='btnAtt' name="t_photo" multiple='multiple' />
                                    <div id='att_zone' data-placeholder='원하시는 이미지를 추가해주세요.(최대 5개)'>
                                   	 <c:forEach items="${t_attachDto}" var="img">
									<div>
										<img src="attach/store/${t_storeDto.getS_name()}/${img}">
										<input type="button" value="X" onclick="delImage(this)">
										<input type="hidden" value="${img}" name="t_not_delete">
									</div>
                        			</c:forEach>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th>가게 설명</th>
                            <td>
                                <textarea name="t_s_content" id="" placeholder="최대1000자">${t_storeDto.getS_content()}</textarea>
                            </td>
                        </tr>
                        <tr>
                            <th>메뉴 종류</th>
                            <td>
                                <select name="t_s_menu">
                                    <option value="">= 선택 =</option>
                                    <c:forEach var="menu" items="${t_menuDto}">
                                    <option value="${menu.getCommon_code()}" <c:if test="${menu.getCommon_name() eq t_storeDto.getMenu_name()}">selected</c:if>>${menu.getCommon_name()}</option>
                                   </c:forEach>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th>대표 메뉴</th>
                            <td>
                                <ul class="menu_write">
                                    <li>
                                        <input type="text" name="t_menu_name_1" placeholder="1. 메뉴명(최소 한개)" value="${t_storeDto.getS_menu_1()}">
                                        <input type="text" name="t_price_1" placeholder="가격" value="${t_storeDto.getS_price_1()}">
                                    </li>
                                    <li>
                                        <input type="text" name="t_menu_name_2" placeholder="2. 메뉴명" value="${t_storeDto.getS_menu_2()}">
                                        <input type="text" name="t_price_2" placeholder="가격" value="${t_storeDto.getS_price_2()}">
                                    </li>
                                    <li>
                                        <input type="text" name="t_menu_name_3" placeholder="3. 메뉴명" value="${t_storeDto.getS_menu_3()}">
                                        <input type="text" name="t_price_3" placeholder="가격" value="${t_storeDto.getS_price_3()}">
                                    </li>
                                    <li>
                                        <input type="text" name="t_menu_name_4" placeholder="4. 메뉴명" value="${t_storeDto.getS_menu_4()}">
                                        <input type="text" name="t_price_4" placeholder="가격" value="${t_storeDto.getS_price_4()}">
                                    </li>
                                    <li>
                                        <input type="text" name="t_menu_name_5" placeholder="5. 메뉴명" value="${t_storeDto.getS_menu_5()}">
                                        <input type="text" name="t_price_5" placeholder="가격" value="${t_storeDto.getS_price_5()}">
                                    </li>
                                </ul>
                            </td>
                        </tr>
                        <tr>
                            <th>검색테마</th>
                            <td>
                            <c:set var="myTheme1" value="${t_storeDto.getTheme_name_1()}"/>
                            <c:set var="myTheme2" value="${t_storeDto.getTheme_name_2()}"/>
                            <c:set var="myTheme3" value="${t_storeDto.getTheme_name_3()}"/>
                            <c:forEach var="themeDto" items="${t_themeDto}">
                                <div class="theme_box">
                                    <ul class="control-group">
                                        <li>
                                            <label class="control control-checkbox">
                                               ${themeDto.getCommon_name()}
                                                <input type="checkbox" name="t_theme" value="${themeDto.getCommon_code()}" <c:if test="${myTheme1 eq themeDto.getCommon_name() or myTheme2 eq themeDto.getCommon_name() or myTheme3 eq themeDto.getCommon_name()}">checked</c:if>>
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
                <div class="btn_group disFlex align-center busi">
                    <input type="button" onclick="history.back()" value="취소" class="cancelBtn">
                    <input type="button" onclick="goUpdate('${t_s_no}')" value="수정등록" class="updateBtn">
                </div>
            </div>
        </div>
    </div>
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
           center: new kakao.maps.LatLng(update.x_code.value, update.y_code.value), // 지도의 중심좌표
           level: 3 // 지도의 확대 레벨
       };  
      
      // 지도를 생성합니다    
      var map = new kakao.maps.Map(mapContainer, mapOption); 
      
      // 주소-좌표 변환 객체를 생성합니다
      var geocoder = new kakao.maps.services.Geocoder();
      
      // 마커가 표시될 위치입니다 
      var markerPosition  = new kakao.maps.LatLng(update.x_code.value, update.y_code.value); 
   
      // 마커를 생성합니다
      var marker = new kakao.maps.Marker({
          position: markerPosition
      });
      
      marker.setMap(map);
      
      function goMapView(){
         var city = document.getElementById('city_select');
          city = city.options[city.selectedIndex].text;
          
          var local = document.getElementById('local_select');
          local = local.options[local.selectedIndex].text;
          
         var address = city + " " + local + " " + update.t_s_address.value;
		console.log(city + local + address);
         // 주소로 좌표를 검색합니다
         geocoder.addressSearch(address, function(result, status) {
            
            // 정상적으로 검색이 완료됐으면 
              if (status === kakao.maps.services.Status.OK) {
                var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
                
                var x_code = result[0].y;
                var y_code = result[0].x;
                 
                update.x_code.value = x_code;
                update.y_code.value = y_code;
                 
           	 	marker.setPosition(coords);
                map.setCenter(coords);
             } 
             
         });    
         
      }
      
   </script>
   
    <!-- FOOTER -->
   <%@ include file="/common_footer.jsp" %>
</body>
</html>