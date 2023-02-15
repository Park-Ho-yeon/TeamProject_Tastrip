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
    <title>테이스트립 :: 가게 정보 확인</title>
    <script>
  		function adminBusinessOpen(){
  			if(confirm('해당 가게가 검색결과에 노출됩니다. 등록 허가하시겠습니까?')){
  				form.t_gubun.value="adminOpenCheck";
  				form.method="post";
  				form.action="/Admin";
  				form.submit();
  			}
  		}
    </script>
</head>
<body>
    <%@ include file="/common_loginHeader.jsp" %>
    <div id="jform_wrap">
    <form name="form">
    	<input type="hidden" name="t_gubun">
    	<input type="hidden" name="t_s_no" value="${t_s_no}">
        <div class="top_title admin_view">
             <h1>
                <b>관리자 페이지</b><br>
                <span>[</span> 등록 대기중인 가게 <span>]</span>
            </h1>
        </div>
        <input type="hidden" name="t_password" value="${t_memberDto.getPassword()}">
        <input type="hidden" name="x_code" value="${t_storeDto.getX_code()}">
        <input type="hidden" name="y_code" value="${t_storeDto.getY_code()}">
            <!-- STEP_4 -->
            <div id="step_4" class="store_info">
                <h1>[ 입력 정보 ]</h1>
                <table class="step_4_store_tbl admin_view">
                    <tr>
                        <th>가게  이름</th>
                        <td>
                            ${t_storeDto.getS_name()}
                        </td>
                    </tr>
                    <tr>
                        <th>가게 주소</th>
                        <td>
                            ${t_storeDto.getS_address()}
                        </td>
                    </tr>
                    <tr>
                        <th>영업시간</th>
                        <td>
                            ${t_storeDto.getS_time()}
                        </td>
                    </tr>
                    <tr>
                        <th>가게 연락처</th>
                        <td>
                           ${t_storeDto.getS_tell()}
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
                            </ul>
                        <c:if test="${not empty t_storeDto.getS_menu_2()}">
                           	<ul class="menu_write">
                                <li>
                                 ${t_storeDto.getS_menu_2()}
                                    <span>${t_storeDto.getS_price_2()}원</span>
                                </li>
                            </ul>
                   	    </c:if>
                   	    <c:if test="${not empty t_storeDto.getS_menu_3()}">
                            <ul class="menu_write">
                                <li>
                                   ${t_storeDto.getS_menu_3()}
                                    <span>${t_storeDto.getS_price_3()}원</span>
                                </li>
                            </ul>
                        </c:if>
                        <c:if test="${not empty t_storeDto.getS_menu_4()}">
                      	    <ul class="menu_write">
                                <li>
                                ${t_storeDto.getS_menu_4()}
                                    <span>${t_storeDto.getS_price_4()}원</span>
                                </li>
                            </ul>
                        </c:if>    
                        <c:if test="${not empty t_storeDto.getS_menu_5()}">
                            <ul class="menu_write">
                                <li>
                                ${t_storeDto.getS_menu_5()}
                                    <span>${t_storeDto.getS_price_5()}원</span>
                                </li>
                            </ul>
                        </c:if>
                        </td>
                    </tr>
                    <tr>
                        <th>가게 사진</th>
                        <td>
                             <div id='image_preview_step4'>
                                <c:forEach items="${t_storeImages}" var="attach">
                           	     <img src="../attach/store/${t_storeDto.getS_name()}/${attach}" alt="">
                                </c:forEach>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th>가게 설명</th>
                        <td class="s_content_text">
                           ${t_storeDto.getS_content()}
                        </td>
                    </tr>
                    <tr>
                        <th>메뉴 종류</th>
                        <td>
                           ${t_storeDto.getMenu_name()}
                        </td>
                    </tr>
                    <tr>
                        <th>상세조건</th>
                        <td>
                            <div class="theme_box">
                                <ul class="control-group">
                                <c:if test="${not empty t_storeDto.getTheme_name_1()}">
                                    <li>
                                        <label class="control control-checkbox">
                                           ${t_storeDto.getTheme_name_1()}
                                            <input type="checkbox" name="theme" value="" disabled>
                                            <div class="control_indicator"></div>
                                        </label>
                                    </li>
                                  </c:if>
                                  <c:if test="${not empty t_storeDto.getTheme_name_2()}">
                                    <li>
                                        <label class="control control-checkbox">
                                            ${t_storeDto.getTheme_name_2()}
                                            <input type="checkbox" name="theme" value="" disabled>
                                            <div class="control_indicator"></div>
                                        </label>
                                    </li>
                                  </c:if>
                                  <c:if test="${not empty t_storeDto.getTheme_name_3()}">
                                    <li>
                                        <label class="control control-checkbox">
                                            ${t_storeDto.getTheme_name_3()}
                                            <input type="checkbox" name="theme" value="" disabled>
                                            <div class="control_indicator"></div>
                                        </label>
                                    </li>
                         		 </c:if>
                                </ul>
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
                <button class="back_btn" onclick="history.back()">이전</button>
                <button class="next_btn" onclick="adminBusinessOpen()">등록 허가</button>
                <input type="hidden" id="now_step" value="1">
            </div>
        </div>
    </div>
    <script>
    	var xxx = form.y_code.value;
    	var yyy = form.x_code.value;
    
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