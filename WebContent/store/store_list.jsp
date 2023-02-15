<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/common.css">
    <link rel="stylesheet" href="css/font.css">
    <link rel="stylesheet" href="css/store.css">
    <script src="https://kit.fontawesome.com/17da812ad5.js" crossorigin="anonymous"></script>
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="../js/store.js"></script>
    <title>테이스트립 :: 맛집 검색</title>
    
    
<script type="text/javascript">
	
	function goStoreList(){
		search.t_gubun.value="storeList";
		search.method="post";
		search.action="Store";
		search.submit();
	}
	
	/*도시 선택*/
	function goCityList(city){
		search.t_city.value=city;
		goStoreList();
	}
	
	/*테그 선택 */
	function gotheme(e){
		var theme = e.value;
		if(e.checked){
			if(search.t_theme_1.value == ""){
				search.t_theme_1.value = theme;
			}else{
				if(search.t_theme_2.value ==""){
					search.t_theme_2.value = theme;
				}else{
					search.t_theme_3.value = theme;
				}
				
			}
		}else{
			if(search.t_theme_1.value == e.value){
				search.t_theme_1.value = "";
			}else if(search.t_theme_2.value == e.value){
				search.t_theme_2.value = "";
			}else if(search.t_theme_3.value == e.value){
				search.t_theme_3.value = "";
			}
		}
		goStoreList();
	}
	
	/*메뉴 선택*/
	function goMenuList(menu){
		search.t_menu_code.value=menu;
		goStoreList();
	}
	
	//상단 키워드검색바
	function goSearchKeyword(){
		var keyword = document.getElementById("keyword");
		search.t_keyword.value=keyword.value;
		goStoreList();
	}
	
	/*리뷰->가게상세 바로*/
	function goStoreView(no){
		storeView.t_gubun.value="storeView";
		storeView.t_s_no.value=no;
		storeView.method="post";
		storeView.action="/Store";
		storeView.submit();
	}
	
	//더보기버튼
	function moreList(){
		
		$(".more_btn").hide();
		$("#LoddingAni").show();
		
		setTimeout(() => {
			var queryString = $("#search").serialize();
			$.ajax({
				type : "POST",
				url : "StorePaging",
				data: queryString,
				dataType : "html",
				error : function(error){
					alert("통신실패!!");
				},
				success : function(data){
					$("#LoddingAni").hide();
					$(".more_btn").show();
					
					var num = search.pageNum.value;
					search.pageNum.value = Number(num)+10;
					$("#pageNum").text(search.pageNum.value);
					$("#listBox").append(data);
					
					if($.trim(data)==''){
						$(".more_btn>a").hide();
					}
				
				}
			});	
		}, 1000);
	}
	
	//로그인화면으로
	function goLogin(){
	   	  alert("로그인이 필요한 서비스입니다");
	   	  location.href="/Member";
	   	  return;
	}
	
	//관심가게 등록-해제
	function ajaxFavorite(s_no){
		var sessionId = '${sessionId}';
		
		if(sessionId==''){
			goLogin();
		}else{
			var className = s_no;
			
		    if($('.'+className).hasClass('fa-regular')){
		        $('.'+className).addClass('fa-solid');
		        $('.'+className).removeClass('fa-regular');
		        
		    }else{
		        $('.'+className).addClass('fa-regular');
		        $('.'+className).removeClass('fa-solid');
		    }
		    
			 $.ajax({
		           type : "POST",
		           url : "MemberSaveFavorite",
		           data: "t_s_no="+s_no,
		           dataType : "text",
		           context: this,
		           error : function(){
		              alert('통신실패');
		           },
		           success : function(data){

		           }
		     }); 	
		}
	}
	
	//가게 정렬변경	
	function order(desc){
		search.t_order.value=desc;
		goStoreList();
	}
	
	//테마 체크박스 값 해제
	function ResetValue(gubun){
		if(gubun == 'a'){
			search.t_city.value = "";
		}else if(gubun == 'b'){
			search.t_menu_code.value = "";
		}else if(gubun == 'c'){
			search.t_theme_1.value = "";
		}else if(gubun == 'd'){
			search.t_theme_2.value = "";
		}else if(gubun == 'e'){
			search.t_theme_3.value = "";
		}else if(gubun == 'f'){
			search.t_keyword.value = "";
		}
		
		goStoreList();
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
	
</script>   

</head>
<body>
<form name="page">
	<input type="hidden" name="t_gubun">
</form>
<form name="storeView">
	<input type="hidden" name="t_gubun">
	<input type="hidden" name="t_s_no">
</form>
 <form id="search" name="search">
	<input type="hidden" name="t_gubun">
	<input type="hidden" name="t_theme_1" value="${theme_1}">
	<input type="hidden" name="t_theme_2" value="${theme_2}">
	<input type="hidden" name="t_theme_3" value="${theme_3}">
	<input type="hidden" name="t_city" value="${city_name}">
	<input type="hidden" name="t_local" value="${local_code}">
	<input type="hidden" name="t_menu_code" value="${menu_code}">
	<input type="hidden" name="t_keyword" value="${keyword}">
	<input type="hidden" name="pageNum" value="${pageNum}">
	<input type="hidden" name="t_order" value="${order}">
</form>

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
		                <a href="/Admin" class="top_btn" class="top_btn">관리자페이지</a>
		            </c:if>
                ·
                <c:if test="${not empty sessionId}">
                	<a href="javascript:goMemberLogout('logout')" class="top_btn">로그아웃</a>
                </c:if>
		            
	            </c:if>
	            <!-- ==로그인이 안되었을떄==  -->
	              <c:if test="${empty sessionId}">
	                <a href="javascript:goMemberLogin('login')" class="top_btn">로그인</a>
	                &nbsp;&nbsp;·&nbsp;&nbsp;
	                <a href="javascript:goMemberMyPage('join')" class="top_btn">회원가입</a>
	            </c:if>
            </div>
           
        </div>
    </header>

    
    <div id="content_wrap">
    	<div class="left_h">
	        <div id="left_content">
	            <ul class="left_menu">
	                <li class="cate_city">
	                    <p><i class="fa-solid fa-map-location-dot i_menu fa-lg"></i><span>지역</span>으로 찾기<i class="fa-solid fa-chevron-down fa-lg i_arrow"></i></p>
	                    <ul class="submenu">
	                    <c:forEach items="${cityDtos}" var="city" begin="0" end="7">
	                        <li><a href="javascript:goCityList('${city.getCommon_name()}')"
	                        <c:if test="${city.getCommon_name() eq city_name}">class="on"</c:if>
	                        >${city.getCommon_name()}</a></li>
	                    </c:forEach>
	                   
	                    </ul>
	                </li>
	                <li class="cate_menu">
	                    <p><i class="fa-solid fa-utensils i_menu fa-lg"></i><span>메뉴</span>로 찾기<i class="fa-solid fa-chevron-down fa-lg i_arrow"></i></p>
	                    <ul class="submenu">
	                    <c:forEach items="${menuDtos}" var="menu">
	                        <li><a href="javascript:goMenuList('${menu.getCommon_code()}')"
	                        <c:if test="${menu.getCommon_code() eq menu_code}">class="on"</c:if>
	                        >${menu.getCommon_name()}</a></li>
						</c:forEach>
	                    </ul>
	                </li>
	                <li class="cate_theme">
	                    <p><i class="fa-solid fa-hashtag i_menu fa-lg"></i></i><span>테마</span>로 찾기<i class="fa-solid fa-chevron-down fa-lg i_arrow"></i></p>
	                    <ul class="submenu control-group">
	                    
	                    <c:forEach items="${themeDtos}" var="theme">
	                        <li>
	                            <label class="control control-checkbox">
	                              ${theme.getCommon_name()}
	                                <input type="checkbox" name="theme" onclick="gotheme(this)"
	                               	<c:if test="${theme.getCommon_code() eq theme_1 or theme.getCommon_code()  eq theme_2 or theme.getCommon_code()  eq theme_3}">checked</c:if>
	                               	value="${theme.getCommon_code()}">
	                              			
	                                <div class="control_indicator"></div>
	                                
	                            </label>
	                        </li>
	                    </c:forEach>
	                    
	                    </ul>
	                </li>
	            </ul>
	        </div>
        </div>
        <div id="right_content">
            <div class="right_top">
                <h3>
                	${city_name} ${menu_name}
	                <c:if test="${not empty keyword}"> "${keyword}" </c:if>
	                <c:if test="${empty city_name && empty menu_name && not empty theme_1_name || not empty theme_2_name || not empty theme_3_name}">테마별 </c:if>
	                <c:if test="${empty city_name && empty menu_name && empty theme_1_name && empty keyword}">모든 </c:if>
              		맛집
              	</h3>
                 <c:if test="${not empty city_name}">
	                <span class="tag">${city_name} <span onclick="ResetValue('a')">X</span></span>
                </c:if>
                <c:if test="${not empty menu_name}">
	                <span class="tag">${menu_name} <span onclick="ResetValue('b')">X</span></span>
                </c:if>
                <c:if test="${not empty keyword}">
	                <span class="tag">"${keyword}" <span onclick="ResetValue('f')">X</span></span>
                </c:if>
                <c:if test="${not empty theme_1_name}">
	                <span class="tag">${theme_1_name} <span onclick="ResetValue('c')">X</span></span>
                </c:if>
                <c:if test="${not empty theme_2_name}">
	                <span class="tag">${theme_2_name} <span onclick="ResetValue('d')">X</span></span>
                </c:if>
                <c:if test="${not empty theme_3_name}">
	                <span class="tag">${theme_3_name} <span onclick="ResetValue('e')">X</span></span>
                </c:if>
            </div>
            <ul class="tab_wrap disFlex">
          		<li <c:if test="${order eq 'TO_NUMBER(s.star) desc' }"> class="tab_on"</c:if> onclick="order('TO_NUMBER(s.star) desc')"><i class="fa-solid fa-star"></i>별점 높은 순</li>
             	<li <c:if test="${order eq 'TO_NUMBER(s.review_count) desc' }"> class="tab_on"</c:if> onclick="order('TO_NUMBER(s.review_count) desc')"><i class="fa-regular fa-comment-dots"></i>리뷰 많은 순</li>
               	<li <c:if test="${order eq 's.reg_date desc' }"> class="tab_on"</c:if> onclick="order('s.reg_date desc')"><i class="fa-solid fa-shop"></i>새로 등록된 가게</li>
            </ul>
            <div id="listBox" class="list_wrap">
                <c:if test="${not empty dtos}">
	                <p class="disFlex justify-space-between">
	                    <span>1 - <span id="pageNum">${pageNum}</span>건 표시</span>
	                    <span>총 ${total_count}건</span>
	                </p>
                </c:if>
                
                
                <c:forEach items="${dtos}" var="dtos">
                <div class="list_box disFlex">
                    <a href="javascript:goStoreView('${dtos.getS_no()}')"><img src="/attach/store/${dtos.getS_name()}/${dtos.getS_attach_1()}" alt=""></a>
                    <div class="list_text">
                        <div class="name disFlex align-center">
                            <h4>${dtos.getS_name()}</h4>
                            <c:choose>
                               <c:when test="${dtos.getStar_front() eq 0 and dtos.getStar_end() eq 0}">
                                  &nbsp;&nbsp;<span class="gray_txt">리뷰없음</span>
                               </c:when>
                               <c:otherwise>
                                 <span class="star">
                                 <c:set var="num" value="${dtos.getStar_end()}"/>
                                    <c:forEach begin="1" end="${dtos.getStar_front()}">
                                        <i class="fa-solid fa-star fa-xs"></i>                                                
                                    </c:forEach>
                                    <c:if test="${num eq 3 or num eq 4 or num eq 5 or num eq 6 or num eq 7}">
                                        <i class="fa-regular fa-star-half-stroke fa-xs"></i>
                                        <c:forEach begin="2" end="${dtos.getStar_empty()}">
                                           <i class="fa-regular fa-star fa-xs"></i>
                                        </c:forEach>                                  
                                    </c:if>
                                    <c:if test="${num eq 0 or num eq 1 or num eq 2}"> 
                                       <c:forEach begin="1" end="${dtos.getStar_empty()}">
                                          <i class="fa-regular fa-star fa-xs"></i>
                                       </c:forEach>
                                    </c:if>
                                    <c:if test="${num eq 8 or num eq 9}">
                                       <i class="fa-solid fa-star fa-xs"></i>
                                       <c:forEach begin="2" end="${dtos.getStar_empty()}">
                                          <i class="fa-regular fa-star fa-xs"></i>
                                      </c:forEach>
                                    </c:if>
                                  </span>
                                  <span>${dtos.getStar()}</span>
                                  <c:if test="${order eq 'TO_NUMBER(s.review_count) desc'}">
	                                  <span class="review_count"><i class="fa-regular fa-comment-dots"></i> ${dtos.getReview_count()}</span>
                                  </c:if>
                               </c:otherwise>
                            </c:choose>
                        </div>
                        <p>${dtos.getS_address()}</p>
                        <c:if test="${sessionLevel_code ne 'admin' and sessionLevel_code ne 'business'}">
                        <div class="list_btn disFlex align-center">
	                        <c:set var="yn" value="no"/>
	                        <c:forEach items="${f_dto}" var="f">                       
		                        <c:if test="${dtos.getS_no() eq f.getS_no() && sessionId eq f.getId()}">
		                        	<c:set var="yn" value="yes"/>
		                        	<i class="fa-solid fa-heart fa-2x ${dtos.getS_no()}" onclick="ajaxFavorite('${dtos.getS_no()}')"></i>
		                        </c:if>
	                        </c:forEach>
	                        <c:if test="${yn eq 'no'}">
	                        	<i class="fa-regular fa-heart fa-2x ${dtos.getS_no()}" onclick="ajaxFavorite('${dtos.getS_no()}')"></i>
	                        </c:if>
	                        <p>관심 가게</p>
                        </div>
                        </c:if>
                        <p>${dtos.getS_content()}</p>
                        <span>#${dtos.getTheme_name_1()}</span><span>#${dtos.getTheme_name_2()}</span><span>#${dtos.getTheme_name_3()}</span>
                        <a href="javascript:goStoreView('${dtos.getS_no()}')">자세히 보기</a>
                    </div>
                </div>
               </c:forEach>
             
                          
            </div>
            
            <c:if test="${not empty dtos}">
	            <div id="LoddingAni">
		             <img alt="로딩중..." src="../images/loading.jpg">
	            </div> 
	            <div class="more_btn">
	                <a href="javascript:moreList()" class="button" id="moreBtn"><i class="fa-solid fa-angle-down"></i> 더보기</a>
	            </div>
            </c:if>
            <c:if test="${empty dtos}">
            	<div class="no_result">
            	<p>검색결과가 없습니다.</p>
            	<p>새로운 검색어를 입력해주세요!</p>
            	</div>
            </c:if>
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
    </script>
	<script>
	/*
	   	$(function(){
			$('.favoriteBtn').click(function(){
				
				alert("000000");
				
			    if($(this).hasClass('fa-regular')){
			    	alert("111111");
			        $(this).addClass('fa-solid');
			        $(this).removeClass('fa-regular');
			        
			    }else{
			    	alert("222222")
			        $(this).addClass('fa-regular');
			        $(this).removeClass('fa-solid');
			    }
			});
	   	})*/
	</script>
    <%@ include file="/common_footer.jsp" %>
</body>
</html>