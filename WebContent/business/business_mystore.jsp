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
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=323ee6f187682a0545434981b559d7a2&libraries=services"></script>
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="https://kit.fontawesome.com/17da812ad5.js" crossorigin="anonymous"></script>
    <title>테이스트립 :: 마이페이지</title>
	
</head>
<script type="text/javascript">
	function goStoreView(gubun, no){
		view.target="blank";
		view.t_gubun.value=gubun;
		view.t_s_no.value=no;
		
		view.method="post";
		view.action="/Store";
		view.submit();
	}
	
	function storeClose(){
		view.t_gubun.value="storeClose";
		view.method="post";
		view.action="/Store";
		view.submit();
	}
	
	function showModal(){
        document.getElementById('modal_wrap').style.display="block";
    }

    function closeModal(){
        document.getElementById('modal_wrap').style.display="none";
    }
    
    function goStoreRep(gubun,s_no){
    	view.t_gubun.value=gubun;
		view.method="post";
		view.action="/Store";
		view.submit();
    }
</script>
<body>
    <%@ include file = "/common_loginHeader.jsp" %>
    <div id="member_list">
<form name="store">
	<input type="hidden" name="x_code" value="${t_storeDto.getX_code()}">
	<input type="hidden" name="y_code" value="${t_storeDto.getY_code()}">
</form>
<form name="view">
	<input type="hidden" name="t_s_no" value="${t_s_no}">
	<input type="hidden" name="t_gubun">
</form>  
        <div class="top_header">
            <h1><b>마이 페이지</b><br><span>[</span> 내 가게 관리 <span>]</span></h1>
        </div>
        <div class="mypage_wrap">
           <%@ include file="/common_BSpage_menu.jsp" %>
            <div class="list_wrap busi store_info <c:if test="${close_check eq 'Y'}">close_block</c:if>">
				<c:if test="${admin_check eq 'Y'}">
					<c:if test="${close_check eq 'N'}">
		                 <div class="s_name disFlex justify-space-between">
		                    <h1>
			                    <a href="javascript:goStoreView('storeView','${t_s_no}')">${t_storeDto.getS_name()}
			                    </a>
		                    	<c:if test="${rep eq 'Y'}"><i class="fa-solid fa-crown fa-xs"></i></c:if>
		                    </h1>
		                    <div>
		                    	<c:if test="${rep eq 'N'}">
			                        <a href="javascript:goStoreRep('setStoreRep','${t_s_no}')">대표가게 설정</a>&nbsp;|&nbsp;
		                    	</c:if>
		                        <a href="javascript:goStoreView('storeView','${t_s_no}')">가게 상세</a>&nbsp;|&nbsp;
		                        <a href="javascript:goMemberPage('b_storeUpdate','${t_s_no}')">정보 수정</a>&nbsp;|&nbsp;
		                        <a href="javascript:showModal()">폐점 신청</a>
		                    </div>
		                </div>
					</c:if>
					<c:if test="${close_check eq 'Y'}">
					<div class="s_name disFlex justify-space-between">
						<h1 class="notyet">${t_storeDto.getS_name()} [ 폐점 ]</h1>
					</div>
					</c:if>
                </c:if>
                <c:if test="${admin_check eq 'N'}">   
                <div class="s_name disFlex justify-space-between">
                    <h1 class="notyet">${t_storeDto.getS_name()}</h1>
                    <span><i class="fa-solid fa-circle-exclamation"></i>관리자가 등록 검토중인 가게입니다</span>
                </div> 
                </c:if>  
                <table class="step_4_store_tbl">
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
                    <tr class="min228">
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
           
        </div>
        <div id="modal_wrap">
        <div class="modal_box">
            <h2>[ 폐점 신청 ]</h2>
            <p>
                폐점 신청을 하시게되면 해당 가게는 더이상 검색 결과에 노출되지않습니다.
                해당 가게에 등록된 리뷰는 삭제되지않습니다.
                <br>
                또한 폐점 신청은 철회가 불가능합니다.
                <br>
                <br>
                폐점 신청 하시겠습니까?
                <br>
                <span>가게이름 : [${t_storeDto.getS_name()}]</span>
            </p>
            <button onclick="closeModal()" class="cbtn">취소</button>
            <button onclick="storeClose()">확인</button>
        </div>
    </div>
    </div>
     <script>
    	var xxx = store.x_code.value;
    	var yyy = store.y_code.value;
    
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = { 
		        center: new kakao.maps.LatLng(xxx, yyy), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };
		
		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		
		// 마커가 표시될 위치입니다 
		var markerPosition  = new kakao.maps.LatLng(xxx, yyy); 
		
		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
		    position: markerPosition
		});
		
		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);
	 
	</script>
    <!-- FOOTER -->
    <%@ include file="/common_footer.jsp" %>
</body>
</html>