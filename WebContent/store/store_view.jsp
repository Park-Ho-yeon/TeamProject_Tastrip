<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/common.css">
    <link rel="stylesheet" href="../css/font.css">
    <link rel="stylesheet" href="../css/store.css">
    <link
    rel="stylesheet"
    href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css"
    />
    <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
    <script src="https://kit.fontawesome.com/17da812ad5.js" crossorigin="anonymous"></script>
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=323ee6f187682a0545434981b559d7a2"></script>
    <script src="../js/store.js"></script>
    <title>테이스트립 :: ${t_sdto.getS_name()}</title>
	<script type="text/javascript">
	
		//리뷰 새창열기
	 	function goReviewView(no){
	 		reviewView.target="_blank";
	 		reviewView.t_gubun.value="reviewView";
	 		reviewView.t_r_no.value=no;
	 		reviewView.method="post";
	 		reviewView.action="/Review";
	 		reviewView.submit();
	 	}
	 	
		//리뷰 정렬순서 바꾸기
	 	function goStoreView(star, desc){
	 		storeView.t_gubun.value="storeView";
			storeView.t_scroll.value="reviewScroll";
	 		storeView.t_star.value=star;
	 		storeView.t_desc.value=desc;
	 		storeView.method="post";
	 		storeView.action="/Store";
	 		storeView.submit();
	 	}
	 	
		//리뷰작성 - 로그인 안되있을때 
	 	function goMemberPage(){
			if(confirm('로그인이 필요한 서비스입니다. 로그인 하시겠습니까?')){
		 		reviewView.t_gubun.value='login';
		 		reviewView.method="post";
		 		reviewView.action="/Member";
		 		reviewView.submit();
			}
	 	}
	 	
		//리뷰작성 - 로그인되어있을때
	 	function goReviewWrite(){
			reviewWrite.target="_blank";
	 		reviewWrite.t_gubun.value="reviewWrite";
	 		reviewWrite.method="post";
	 		reviewWrite.action="/Review";
	 		reviewWrite.submit();
	 	}
	 	//관심가게 하트 클릭
		function saveFavorite(id, s_no){	
		       if(id==""){
		    	  alert("로그인이 필요한 서비스입니다");
		    	  location.href="/Member";
		    	  return;
		    	  /*
				  saveFav.t_gubun.value="login";
		    	  saveFav.method="post";
		    	  saveFav.action="/Member";
		    	  saveFav.submit();
		    	  */
		      }
		       if(id!=""){
		    	   ajaxFavorite(s_no);
		       }
		}
		
		//관심가게 등록-해제
		function ajaxFavorite(s_no){
			 $.ajax({
		           type : "POST",
		           url : "MemberSaveFavorite",
		           data: "t_s_no="+s_no,
		           dataType : "text",
		           error : function(){
		              alert('통신실패');
		           },
		           success : function(data){
		              $('#favCount').text(data);
		           }
		       }); 
		}
		
		//더보기버튼
		function moreList(){
			
			$(".more_btn").hide();
			$("#LoddingAni").show();
			
			setTimeout(() => {
				var queryString = $("#storeView").serialize();
				$.ajax({
					type : "POST",
					url : "StoreReviewPaging",
					data: queryString,
					dataType : "html",
					error : function(error){
						alert("통신실패!!");
					},
					success : function(data){
						$("#LoddingAni").hide();
						$(".more_btn").show();
						
						var num = storeView.pageNum.value;
						storeView.pageNum.value = Number(num)+5;
						$("#pageNum").text(storeView.pageNum.value);
						$("#store_review").append(data);
						
						if($.trim(data)==''){
							$(".more_btn>a").hide();
						}
					}
				});	
			}, 1000);
		}
		
		function goMemberMyPage(gubun){
			page.t_gubun.value=gubun;
			page.method="post";
			page.action="/Member";
			page.submit();
		}
		
		function goMemberLogin(gubun){
			if(confirm("로그인 하시겠습니까?")){
				page.t_gubun.value=gubun;
				page.method="post";
				page.action="/Member";
				page.submit();
			}
		}
		
		function goMemberLogout(gubun){
			if(confirm("로그아웃 하시겠습니까?")){
				page.t_gubun.value=gubun;
				page.method="post";
				page.action="/Member";
				page.submit();
			}
		}
		
		//상단 키워드검색바
		function goSearchKeyword(){
			var keyword = document.getElementById("keyword");
			storeView.t_keyword.value=keyword.value;
			storeView.t_gubun.value="storeList";
			storeView.method="post";
			storeView.action="/Store";
			storeView.submit();
		}
			
		
	 </script>
	 <c:if test="${not empty t_scroll}">
	 	<script type="text/javascript">
	 		$(function(){
	 			var scrollPosition = $("#store_review").offset().top-140;
	 			$('html, body').scrollTop(scrollPosition);
	 		})
	 	</script>
	 </c:if>
</head>
<body>
<form name="page">
	<input type="hidden" name="t_gubun">
</form>
 <form name="reviewWrite">
 	<input type="hidden" name="t_gubun">
 	<input type="hidden" name="t_s_no" value="${t_s_no}"> 
 </form>
 <form name="reviewView">
 	<input type="hidden" name="t_gubun">
 	<input type="hidden" name="t_r_no">
 </form>
  <form id="storeView" name="storeView">
 	<input type="hidden" name="t_gubun">
 	<input type="hidden" name="t_kg" value="fromView"> 	
 	<input type="hidden" name="t_keyword">
 	<input type="hidden" name="t_s_no" value="${t_s_no}">
 	<input type="hidden" name="t_star" value="${about}">
 	<input type="hidden" name="t_desc" value="${order}">
 	<input type="hidden" name="t_scroll">
 	<input type="hidden" name="pageNum" value="${pageNum}">
 	<input type="hidden" name="s_name" value="${t_sdto.getS_name()}">
    <input type="hidden" name="x_code" value="${t_sdto.getX_code()}">
    <input type="hidden" name="y_code" value="${t_sdto.getY_code()}">
    <header>
        <div class="header_wrap disFlex align-center">
            <a href="/Index">
                <img src="../images/logo_design_200.png" class="top_logo" alt="로고">
            </a>
            <ul class="search_bar disFlex">
                <li><input type="text" id="keyword" class="search_v2" placeholder="가게 이름, 메뉴 등" value="${keyword}" onkeypress="if(event.keyCode==13){goSearchKeyword()}"></li>
                <li><input type="button" value="검색" onclick="goSearchKeyword()"></li>
            </ul>
             <div class="disFlex align-center">
                   <!-- ==로그인상태일떄== -->
                   <c:if test="${not empty sessionId}">
		            <c:if test="${sessionLevel_code eq 'business'}">
	                	<i class="fa-solid fa-user-tie fa-lg" title="사업자 회원"></i>
	                	<a href="javascript:goMemberMyPage('b_mypage')" class="top_btn">마이페이지</a>
		            </c:if>
		            
		            <c:if test="${sessionLevel_code eq 'member'}">
		            <div class="member_profile">
		            <c:if test="${sessionApi eq 'N'}">
		                <a href="javascript:goMemberMyPage('mypage')">
		                    <img src="${sessionProfile}">
		                </a>
		            </c:if>
		            <c:if test="${sessionApi ne 'N'}">
		                <a href="javascript:goMemberMyPage('mypage')">
		                    <img src="../attach/member/profile/${sessionProfile}">
		                </a>
		            </c:if>
		            </div>
		            <a href="javascript:goMemberMyPage('mypage')" class="top_btn">마이페이지</a>
		            </c:if>
		            
		            <c:if test="${sessionLevel_code eq 'admin'}">
		                <a href="/Admin" class="user_icon">
		                    <i class="fa-solid fa-user-gear fa-2x"></i>
		                </a>
		                <a href="/Admin" class="top_btn">관리자페이지</a>
		            </c:if>
                ·
                <c:if test="${not empty sessionId}">
                	<a href="javascript:goMemberLogout('logout')" class="top_btn">로그아웃</a>
                </c:if>
		            
	            </c:if>
	            <!-- ==로그인이 안되었을떄==  -->
	              <c:if test="${empty sessionId}">
	                <a href="javascript:goMemberLogin('login')">로그인</a>
	                &nbsp;&nbsp;·&nbsp;&nbsp;
	                <a href="javascript:goMemberMyPage('join')">회원가입</a>
	            </c:if>
            </div>
           
        </div>
    </header>
 </form>

    <div id="background">
 
        <div id="store_view">
            <div class="store_photo">
                <div class="swiper mySwiper">
                    <div class="swiper-wrapper">
                    <c:forEach items="${storeImg}" var="storeImg">
                        <div class="swiper-slide"><img src="/attach/store/${t_sdto.getS_name()}/${storeImg}"></div>
                    </c:forEach>
                    </div>
                </div>
                <div class="myBtn myBtn-next s2Next"><i class="fa-solid fa-chevron-right"></i></div>
                <div class="myBtn myBtn-prev s2Prev"><i class="fa-solid fa-chevron-left"></i></div>
            </div>
            <div class="store_Information">
                <div class="left_box">
                    <div>
                        <p>${t_sdto.getS_name()}<span>${t_sdto.getStar()}</span></p>
                        <i class="fa-solid fa-comment-dots"><span>${total_count}</span></i>
                        <i class="no_click fa-solid fa-heart"><span id="favCount">${t_sdto.getFavCount()}</span></i>
                        <p class="text">
                        	${t_sdto.getS_content()}
                        </p>
                    	<c:if test="${empty sessionId}">
	                        <div class="list_btn favo disFlex align-center" onclick="javascript:goMemberPage()">
                        	<c:set var="yn" value="no"/>
	                        	<c:forEach items="${f_dto}" var="f">
	                        		<c:if test="${t_s_no eq f.getS_no() && sessionId eq f.getId()}">
	                        			<c:set var="yn" value="yes"/>
			                        	<i class="fa-solid fa-heart fa-2x"></i>
			                        </c:if>
	                        	</c:forEach>
	                        	<c:if test="${yn eq 'no'}">
		                        	<i class="fa-regular fa-heart fa-2x"></i>
		                        </c:if>
                            	<p>관심 가게</p>
                        	</div>
                        </c:if>
                        <c:if test="${not empty sessionId}">
                        	<c:if test="${sessionLevel_code eq 'member'}">
	                        	<div class="list_btn favo disFlex align-center" onclick="javascript:saveFavorite('${sessionId}','${t_s_no}')">
	                        	<c:set var="yn" value="no"/>
		                        	<c:forEach items="${f_dto}" var="f">
		                        		<c:if test="${t_s_no eq f.getS_no() && sessionId eq f.getId()}">
		                        			<c:set var="yn" value="yes"/>
				                        	<i class="fa-solid fa-heart fa-2x favoriteBtn"></i>
				                        </c:if>
		                        	</c:forEach>
		                        	<c:if test="${yn eq 'no'}">
			                        	<i class="fa-regular fa-heart fa-2x favoriteBtn"></i>
			                        </c:if>
	                            	<p>관심 가게</p>
	                        	</div>
                        	</c:if>
                        </c:if>
                        
                        <c:if test="${empty sessionId}">
	                        <div class="list_btn revi disFlex align-center" onclick="javascript:goMemberPage()">
	                            <i class="fa-regular fa-comment-dots fa-2x"></i>
	   	                        <p>리뷰 등록</p>
		    	            </div>
                        </c:if>
                        <c:if test="${not empty sessionId}">
                        	<c:if test="${sessionLevel_code eq 'member'}">
                        		 <div class="list_btn revi disFlex align-center" onclick="javascript:goReviewWrite()">
                        			<i class="fa-regular fa-comment-dots fa-2x"></i>
  	                    		 	<p>리뷰 등록</p>
  	                      		 </div>
                        	</c:if>
                        </c:if>
                    </div>
                    <div class="store_table">
                        <table>
                            <tr>
                                <td>주소</td>
                                <td>${t_sdto.getS_address()}</td>
                            </tr>
                            <tr>
                                <td>전화 번호</td>
                                <td>${t_sdto.getS_tell()}</td>
                            </tr>
                            <tr>
                                <td>음식 종류</td>
                                <td>${t_sdto.getMenu_name()}</td>
                            </tr>
                            <tr>
                                <td>영업 시간</td>
                                <td>${t_sdto.getS_time()}</td>
                            </tr>
                            <tr>
                                <td>메뉴</td>
                                <td>
                                    <ul>                                    	
                                        <li>${t_sdto.getS_menu_1()}<span>${t_sdto.getS_price_1()}원</span></li>
                                        
                                        <c:if test="${t_sdto.getS_menu_2() ne null}">
                                        	<li>${t_sdto.getS_menu_2()}<span>${t_sdto.getS_price_2()}원</span></li>
                                        </c:if>
                                        
                                        <c:if test="${t_sdto.getS_menu_3() ne null}">
                                        	<li>${t_sdto.getS_menu_3()}<span>${t_sdto.getS_price_3()}원</span></li>
                                        </c:if>
                                        
                                        <c:if test="${t_sdto.getS_menu_4() ne null}">
                                        	<li>${t_sdto.getS_menu_4()}<span>${t_sdto.getS_price_4()}원</span></li>
                                        </c:if>
                                        
                                        <c:if test="${t_sdto.getS_menu_5() ne null}">
                                        	<li>${t_sdto.getS_menu_5()}<span>${t_sdto.getS_price_5()}원</span></li>
                                        </c:if>                                        
                                    </ul>
                                </td>
                            </tr>
                            <tr>
                                <td>테마</td>
                                <td>
                                    <span>#${t_sdto.getTheme_name_1()}</span>
                                    <span>#${t_sdto.getTheme_name_2()}</span>
                                    <span>#${t_sdto.getTheme_name_3()}</span>
                                </td>
                            </tr>
                        </table>
                    </div>
                    
                </div>
                <div id="map" style="width:300px;height:300px;"></div>
            </div>
            <div id="store_review">
                <div class="store_count disFlex justify-space-between">
                    <span>리뷰 (${total_count})</span> 
                    <div>
                        <a href="javascript:goStoreView('a.r_no','desc')" <c:if test="${about eq 'a.r_no' && order eq 'desc'}">class="on"</c:if>>등록 순</a> <span> | </span>
                        <a href="javascript:goStoreView('a.star','desc')" <c:if test="${about eq 'a.star' && order eq 'desc'}">class="on"</c:if>>별점 높은 순</a> <span> | </span>
                        <a href="javascript:goStoreView('a.star','asc')" <c:if test="${about eq 'a.star' && order eq 'asc'}">class="on"</c:if>>별점 낮은 순</a>
                    </div>
                </div>
                <c:forEach items="${t_rdtos}" var="rdto">
                <a href="javascript:goReviewView('${rdto.getR_no()}')">
                    <div class="disFlex">
                        <div class="review_profile disFlex align-center">
                            <div class="member_img">
                            <c:if test="${rdto.getApi() ne 'N'}">
                                <img src="../attach/member/profile/${rdto.getProfile_photo()}"> 
                            </c:if>
                            <c:if test="${rdto.getApi() eq 'N'}">
                                <img src="${rdto.getProfile_photo()}"> 
                            </c:if>
                            </div>
                            <p><b>${rdto.getNickname()}</b></p>
                        </div>
                        <div class="bubble">
                            <span><i class="fa-solid fa-pen-to-square"></i>${rdto.getReg_date()}</span>
                            <div class="star disFlex align-center">
                               <span class="star">
		                          <c:set var="num" value="${rdto.getStar_end()}"/>
		                             <c:forEach begin="1" end="${rdto.getStar_front()}">
		                                 <i class="fa-solid fa-star"></i>                                                
		                             </c:forEach>
		                             <c:if test="${num eq 5}">
		                                 <i class="fa-regular fa-star-half-stroke"></i>
		                                 <c:forEach begin="2" end="${rdto.getStar_empty()}">
		                                    <i class="fa-regular fa-star"></i>
		                                 </c:forEach>                                  
		                             </c:if>
		                             <c:if test="${num eq 0}"> 
	                                     <c:forEach begin="1" end="${rdto.getStar_empty()}">
	                                        <i class="fa-regular fa-star"></i>
	                                     </c:forEach>
									 </c:if>
	                           	</span>
                            </div>
                            <p>
                            	${rdto.getContent()}
                         		<span>자세히보기</span>
                            </p>
                            <c:if test="${not empty rdto.getAttach_1()}">
                            <div class="review_photo">
	                            <img src="../attach/review/${rdto.getAttach_1()}">
	                            <c:if test="${not empty rdto.getAttach_2()}">
	                                <img src="../attach/review/${rdto.getAttach_2()}">
	                            </c:if>
	                            <c:if test="${not empty rdto.getAttach_3()}">
	                                <img src="../attach/review/${rdto.getAttach_3()}">
	                            </c:if>
	                            <c:if test="${not empty rdto.getAttach_4()}">
	                                <img src="../attach/review/${rdto.getAttach_4()}">
	                            </c:if>
	                            <c:if test="${not empty rdto.getAttach_5()}">
	                                <img src="../attach/review/${rdto.getAttach_5()}">
	                            </c:if>
                            </div>
                            </c:if>
                        </div>
                    </div>
                </a>
              	</c:forEach>               
            </div>
            <div class="btn_wrap">
                <c:if test="${not empty t_rdtos}">
	            <div id="LoddingAni">
		             <img alt="로딩중..." src="../images/loading.jpg">
	            </div> 
	            <div class="more_btn">
	            	<c:if test="${t_rdtos.size()>=5}">
	                <a href="javascript:moreList()" class="button" id="moreBtn"><i class="fa-solid fa-angle-down"></i> 더보기</a>
	            	</c:if>
	            </div>
            </c:if>
            <c:if test="${empty t_rdtos}">
            	<div class="no_result">
	            	<p>작성된 리뷰가 없습니다.</p>
            	</div>
            </c:if>
            </div>
        </div>
    </div>
    
    <a href="#" id="scrollTop" class="top">TOP</a>
     <script>
	        // 스크롤 TOP 버튼
	    $( window ).scroll( function() {
	        if ( $( this ).scrollTop() > 200 ) {
	            $( '#scrollTop' ).fadeIn();
	        } else {
	            $( '#scrollTop' ).fadeOut();
	        }
	    });
	
	    $( '#scrollTop' ).click( function() {
	        $( 'html, body' ).animate( { scrollTop : 0 }, 400 );
	        return false;
	    });
	    
		$('.favoriteBtn').click(function(){
			
		    if($(this).hasClass('fa-regular')){
		        $(this).addClass('fa-solid');
		        $(this).removeClass('fa-regular');
		        
		    }else{
		        $(this).addClass('fa-regular');
		        $(this).removeClass('fa-solid');
		    }
		});
    </script>
    <!-- FOOTER -->
    <%@ include file="/common_footer.jsp" %>
    <!-- /FOOTER END -->
</body>
<script>
    var swiper = new Swiper(".mySwiper", {
      slidesPerView: 3,
      spaceBetween: 5,
      slidesPerGroup: 1,
      loop: true,
      loopFillGroupWithBlank: true,
      pagination: {
        el: ".swiper-pagination",
        clickable: true,
      },
      navigation: {
        nextEl: ".myBtn.myBtn-next.s2Next",
        prevEl: ".myBtn.myBtn-prev.s2Prev",
      },
    });
  </script>
  <script>
      var x_code = storeView.x_code.value;
      var y_code = storeView.y_code.value;
   
      var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
          mapOption = { 
              center: new kakao.maps.LatLng(x_code, y_code), // 지도의 중심좌표
              level: 3 // 지도의 확대 레벨
          };
      
      var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
      
      // 마커가 표시될 위치입니다 
      var markerPosition  = new kakao.maps.LatLng(x_code, y_code); 
      
      // 마커를 생성합니다
      var marker = new kakao.maps.Marker({
          position: markerPosition
      });
      
      // 마커가 지도 위에 표시되도록 설정합니다
      marker.setMap(map);
      
      var s_name = storeView.s_name.value;
      
      // 커스텀 오버레이에 표시할 내용입니다     
      // HTML 문자열 또는 Dom Element 입니다 
      var content = '<div class ="label"><span class="left"></span><span class="center">' + s_name + '</span><span class="right"></span></div>';

      // 커스텀 오버레이가 표시될 위치입니다 
      var position = new kakao.maps.LatLng(x_code, y_code);  

      // 커스텀 오버레이를 생성합니다
      var customOverlay = new kakao.maps.CustomOverlay({
          position: position,
          content: content   
      });

      // 커스텀 오버레이를 지도에 표시합니다
      customOverlay.setMap(map);
    
   </script>
  
  
</html>