<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/common.css">
    <link rel="stylesheet" href="css/font.css">
    <link rel="stylesheet" href="css/main.css">
    <script src="https://kit.fontawesome.com/17da812ad5.js" crossorigin="anonymous"></script>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <link 
    rel="stylesheet"
    href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css"
    />
    <script src="js/script.js"></script>
    <title>테이스트립 Tastrip :: 당신의 입맛 여행</title>
    
    <script type="text/javascript">
	    
	    /*가게 목록페이지 가기*/
		function goStoreList(){
			search.t_gubun.value="storeList";
	  		search.method="post";
			search.action="/Store";
			search.submit();
		}
		
		/*지역별 찾기*/
		function goCityList(city){
			search.t_city.value=city;
			goStoreList();
		}
		
		/*테그 검색*/
		function getTheme(theme){
			search.t_theme_1.value=theme;
			goStoreList();
		}
		
		/*테그,메뉴 검색*/
		function getThemeMenu(M,T){
			search.t_theme_1.value=T;
			search.t_menu_code.value=M;
			goStoreList();
		}
		
		/*메뉴 검색*/
		function goMenuList(menu){
			search.t_menu_code.value=menu;
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
		
		/*리뷰 상세*/
		function goReviewView(no){
			reviewView.target="_blank";
			reviewView.t_gubun.value="reviewView";
			reviewView.t_r_no.value=no;
			reviewView.method="post";
			reviewView.action="/Review";
			reviewView.submit();
		}
		
		/*멤버 컨트롤러*/
		function goMemberPage(gubun){
			member.t_gubun.value=gubun;
			member.method="post";
			member.action="/Member";
			member.submit();
		}
		
		/*로그인 화면 이동*/
		function goMemberJoin(){
			member.t_gubun.value="join";
			member.method="post";
			member.action="/Member";
			member.submit();
		}
	
		/*로그아웃*/
		function goLogout(){
			member.t_gubun.value="logout";
			member.method="post";
			member.action="/Member";
			member.submit();
		}
		
		/*관리자 컨트롤러*/
		function goAdminPage(gubun){
			member.t_gubun.value=gubun;
			member.method="post";
			member.action="/Admin";
			member.submit();
		}
		
		/*하단 배너 클릭시*/
		function goAlertMember(msg,action,gubun){
			alert(msg);
			member.t_gubun.value=gubun;
			member.method="post";
			member.action=action;
			member.submit();
		}
		
		function themeValueCheck(){
			const query = 'input[name="t_theme"]:checked';
		    const selectedEls =  document.querySelectorAll(query);
		    
		    // 선택된 목록에서 value 찾기
		    let result = '';
		    for(var i=0; i<selectedEls.length; i++){
		    	var el = selectedEls[i];
		    	var n_el = el.nextElementSibling;
		    	if(i>2){
	    	    	alert('키워드는 최대 3개까지 선택 가능합니다.');
		    		el.checked=false;
		    	}else{
		    		if(i==0){
		    			result = n_el.value;
		    		}else{
		    	    	result += ' / ' + n_el.value ;
		    		} 
		    	}
		    }
	
		    // 출력
		    search.theme.value=result;
		}
		
		function goSearch(){
			search.t_gubun.value="storeList";
			search.method="post";
			search.action="/Store";
			search.submit();
		}
</script>
    
</head>
<body>
<!-- member join  -->
<form name="member">
	<input type="hidden" name="t_gubun">
</form>
<form name="storeView">
	<input type="hidden" name="t_gubun">
	<input type="hidden" name="t_s_no">
</form>
<form name="reviewView">
	<input type="hidden" name="t_gubun">
	<input type="hidden" name="t_r_no">
</form>
<!-- Store List  -->
 <form name="search">
	<input type="hidden" name="t_gubun">
	<input type="hidden" name="t_theme_1" >
	<input type="hidden" name="t_theme_2" >
	<input type="hidden" name="t_theme_3" >
	<input type="hidden" name="t_local" >
	<input type="hidden" name="t_menu_code" >
	<input type="hidden" name="pageNum" value="10">
	
    <!-- HEADER -->
    <header>
        <div class="top_menu m_auto disFlex justify-space-between">
            <a href="" class="logo">
                <!-- <img src="images/logo.png" alt=""> -->
            </a>
            <ul class="disFlex">
            <!-- 
                <li><a href="member/member_login.html"><i class="fa-solid fa-user fa-lg"></i></i></a></li>
                <li><a href=""><i class="fa-solid fa-globe fa-lg"></i></a></li>
             -->
            </ul>
        </div>
        <div class="search_bar disFlex justify-space-between">
            <div>
                <p>원하는 조건으로 맛집 찾기!</p>
                <p>
                    <span>#데이트</span>
                    <span>#회식</span>
                    <span>#혼밥</span>
                    <span>#분위기좋은</span>
                </p>
            </div>
             <ul class="disFlex">
                <li><input type="text" class="search_1" name="t_city" placeholder="지역" onkeypress="if(event.keyCode==13){goStoreList()}"></li>
                <li><input type="text" class="search_2" name="t_keyword" placeholder="가게이름, 메뉴" onkeypress="if(event.keyCode==13){goStoreList()}"></li>
                <li class="search_li">
                    <input type="text" class="search_3" name="theme" placeholder="키워드 선택" readonly>
                    <div class="theme_box">
                        <ul class="control-group">
                        
                        <c:forEach items="${theme}" var="dto">
                            <li>
                                <label class="control control-checkbox">
                                    ${dto.getCommon_name()}
                                    <input type="checkbox" name="t_theme" value="${dto.getCommon_code()}" onclick="themeValueCheck()">
                                    <input type="hidden" name="theme_name" value="${dto.getCommon_name()}">
                                    <div class="control_indicator"></div>
                                </label>
                            </li>
                        </c:forEach>
                         
                        </ul>
                    </div>
                </li>
                <li><input type="button" value="검색" onclick="goStoreList()"></li>
            </ul>
        </div>
    </header>
    <!-- /HEADER END -->
</form>

    <!-- CONTENT -->
    <div id="content_wrap">
        <!-- RIGHT CONTENTS -->
        <div class="numbering disFlex justify-space-between">
            <ul>
                <li>등록된 가게</li>
                <li>870<span>개</span></li>
            </ul>
            <ul>
                <li>등록된 리뷰</li>
                <li>1.2천<span>개</span></li>
            </ul>
            <ul>
                <li>회원수</li>
                <li>3.2만<span>명</span></li>
            </ul>
        </div>
        <div id="right_wrap" class="side_absol">
        	
        	<c:if test="${empty sessionId}">
	            <div class="login_box">
	                <div>
	                    <h3>로그인/회원가입</h3>
	                    <p>
	                        로그인 하시면 관심있는 가게 즐겨찾기. 리뷰작성 등
	                        다양한 기능을 활용하실 수 있습니다!
	                    </p>
	                    <input type="button" value="로그인" onclick="location.href='/Member'">
	                    <input type="button" value="회원가입" onclick="goMemberPage('join')">
	                </div>
	            </div>
        	</c:if>
        	<c:if test="${not empty sessionId}">
        		<!-- 일반화원 -->
        		<c:if test="${sessionLevel_code eq 'member'}">
		            <div id="after_login" class="login_box">
		                <div>
		                    <div class="disFlex">
		                        <c:if test="${sessionApi ne 'N'}">
			                        <div class="member_profile">
			                            <img src="/attach/member/profile/${sessionProfile}">
			                        </div>
			                    </c:if>
			                    <c:if test="${sessionApi eq 'N'}">
			                        <div class="member_profile">
			                           <img alt="" src="${sessionProfile}">
			                        </div>
		                        </c:if>
		                        <div class="my_info">
		                            <p class="nickname">${sessionNickname}</p>
		                            <span>일반회원</span> · 
		                            <a href="javascript:goMemberPage('mypage')"><span>마이페이지</span></a>
		                        </div> 
		                    </div>
		                    <div>
		                        <ul>
		                            <li>
		                                <a href="javascript:goMemberPage('favorite')"><i class="fa-solid fa-heart"></i>관심 가게</a>
		                                <span>${f_count}개</span>
		                            </li>
		                            <li>
		                                <a href="javascript:goMemberPage('review')"><i class="fa-regular fa-comment-dots"></i>내가 쓴 리뷰</a>
		                                <span>${r_count}개</span>
		                            </li>
		                            <!-- 
			                            <li>
			                                <a href="javascript:alert('준비중입니다.');"> <i class="fa-solid fa-utensils"></i>예약 현황</a>
			                                <span>0개</span>
			                            </li>
		                             -->
		                        </ul>
		                    </div>
		                    <a class="log_out" href="javascript:goMemberPage('logout')">로그아웃</a>
		                </div>    
		            </div>
        		</c:if>
        		<!-- 사업자 로그인 후 -->
        		<c:if test="${sessionLevel_code eq 'business'}">
          		<div id="after_login" class="login_box">
	                <div>
	                    <div class="disFlex">
	                        <div class="my_info busi">
	                            <p class="nickname">${sessionName}<span>[ 사업자회원 ]</span></p>
	                            <a href="javascript:goMemberPage('b_mypage')">마이페이지</a>
	                            · 
	                            <a href="javascript:goMemberPage('b_mystore')">가게 관리</a>
	                        </div> 
	                    </div>
	                    <div>
	                        <ul>
	                            <li>
	                                <a href="javascript:goMemberPage('b_mystore')"><i class="fa-solid fa-store"></i>대표 가게</a>
	                                 <c:choose>
										<c:when test="${fn:length(bs_s_name)>10}">
			                                <span><a href="javascript:goMemberPage('b_mystore')">${fn:substring(bs_s_name,0,10)}...</a></span>
										</c:when>
										<c:otherwise>
			                                <span><a href="javascript:goMemberPage('b_mystore')">${bs_s_name}</a></span>
										</c:otherwise>
									</c:choose>
	                            </li>
	                            <li>
	                                <a href="javascript:goStoreView('${rep_no}')"><i class="fa-regular fa-comment-dots"></i>최근 등록된 리뷰</a>
	                                <span>${bs_r_count}개</span>
	                            </li>
	                            <!-- 
		                            <li>
		                                <a href="javascript:alert('준비중입니다.');"> <i class="fa-solid fa-utensils"></i>예약 문의</a>
		                                <span>2개</span>
		                            </li>
	                             -->
	                        </ul>
	                    </div>
	                    <a class="log_out"  href="javascript:goMemberPage('logout')">로그아웃</a>
	                </div>    
         	 	</div>
        		</c:if>
        		<!-- 관리자 로그인 -->
        		<c:if test="${sessionLevel_code eq 'admin'}">
	        		<div id="after_login" class="login_box">
	        			<div>
	        				<p class="nickname admin_n">[관리자 계정]</p> 
		                    <div id="admin">
		                        <a href="javascript:goAdminPage('memberList')"><i class="fa-solid fa-user-gear"></i> 회원 관리</a>
		                        <a href="javascript:goAdminPage('storeList')"><i class="fa-solid fa-shop"></i> 맛집 관리</a>
		                        <a href="javascript:goAdminPage('requestList')"><i class="fa-solid fa-check-to-slot"></i> 새로운 등록요청 (${t_admin_count})</a>
		                    </div>
		                    <a class="log_out" href="javascript:goMemberPage('logout')">로그아웃</a>
		                </div>    
		            </div>
        		</c:if>
        	</c:if>
       
            <div class="notice_box">
                <h2>공지사항</h2>
                <c:if test="${sessionLevel_code eq 'admin'}">
	                <a href="javascript:goAdminPage('noticeList')"><i class="fa-solid fa-gear"></i>관리메뉴</a>
                </c:if>
                <form name="notice">
                <input type="hidden" name="t_noticeNo">
                <input type="hidden" name="t_gubun">
                <div class="notice_list">
                    <c:forEach items="${t_notiDtos}" var="dto">
                    <a href="/notice/notice_window.jsp?n_no=${dto.getN_no()}" onclick="window.open(this.href, '_blank', 'width=600,height=700,toolbars=no,scrollbars=no'); return false;">
                        <p>${dto.getReg_date()}</p>
                        <c:choose>
							<c:when test="${fn:length(dto.getTitle())>20}">
								<p>${fn:substring(dto.getTitle(),0,20)}...</p>
							</c:when>
							<c:otherwise>
	                       		<p>${dto.getTitle()}</p>
							</c:otherwise>
						</c:choose>
                    </a>
                 </c:forEach>
                </div>
                </form>
            </div>
        </div>
        <!-- LEFT CONTENTS -->
        <div id="left_wrap">
            <!-- SECTION 1 지역별맛집 -->
            <div id="section_1">
                <h2 class="sub_title"><i class="fa-solid fa-angle-right"></i> 지역별 맛집</h2>
                <div class="disFlex justify-space-between align-center">
                    <a href="javascript:goCityList('서울');" class="s1_inner">
                        <img src="images/sec_1/seoul.png" alt="">
                        <div><p>서울</p></div>
                    </a>
                    <a href="javascript:alert('준비중입니다.');" class="s1_inner">
                        <img src="images/sec_1/busan.png" alt="">
                        <div><p>부산</p></div>
                    </a>
                    <a href="javascript:goCityList('대전')" class="s1_inner" >
                        <img src="images/sec_1/daejeon.png" alt="" >
                        <div><p>대전</p></div>
                    </a>
                    <a href="javascript:alert('준비중입니다.');" class="s1_inner">
                        <img src="images/sec_1/gwangju.png" alt="">
                        <div><p>광주</p></div>
                    </a>
                </div>
                <div class="disFlex justify-space-between align-center">
                    <a href="javascript:alert('준비중입니다.');" class="s1_inner">
                        <img src="images/sec_1/daegu.jpg" alt="">
                        <div><p>대구</p></div>
                    </a>
                    <a href="javascript:alert('준비중입니다.');" class="s1_inner">
                        <img src="images/sec_1/incheon.jpg" alt="">
                        <div><p>인천</p></div>
                    </a>
                    <a href="javascript:alert('준비중입니다.');" class="s1_inner">
                        <img src="images/sec_1/ulsan.jpg" alt="">
                        <div><p>울산</p></div>
                    </a>
                    <a href="javascript:alert('준비중입니다.');" class="s1_inner">
                        <img src="images/sec_1/jejuisland.jpg" alt="">
                        <div><p>제주</p></div>
                    </a>
                </div>
            </div>
            <!-- SECTION 2 테마별 맛집-->
            <div id="section_2">
                <h2 class="sub_title"><i class="fa-solid fa-angle-right"></i> 테마별로 찾기</h2>
                <div class="s2_slide_wrap">
                    <div class="swiper first-swiper">
                        <div class="swiper-wrapper">
                        
                        <div class="swiper-slide">
                            <a href="javascript:getThemeMenu('M10','T10')">
                                <img src="images/sec_2/cafe.jpg" alt="">
                                <div class="thema_text disFlex align-center">
                                    <p>데이트</p>
                                    <p>카페 & 브런치</p>
                                </div>
                            </a>
                          </div>
                          <div class="swiper-slide">
                            <a href="javascript:getThemeMenu('M04','T24')">
                                <img src="images/sec_2/bab.jpg" alt="">
                                <div class="thema_text disFlex align-center">
                                    <p>단체 예약  가능</p>
                                    <p>고기 & 구이</p>
                                </div>
                            </a>
                          </div>
                          <div class="swiper-slide">
                            <a href="javascript:getThemeMenu('M09','T28')">
                                <img src="images/sec_2/take.jpg" alt="">
                                <div class="thema_text disFlex align-center">
                                    <p>테이크아웃 맛집</p>
                                    <p>분식</p>
                                </div>
                            </a>
                          </div>
                         
                          <div class="swiper-slide">
                            <a href="javascript:getThemeMenu('M02','T06')">
                                <img src="images/sec_2/nunbab.jpg" alt="">
                                <div class="thema_text disFlex align-center">
                                    <p>든든한 한끼</p>
                                    <p>국밥</p>
                                </div>
                            </a>
                          </div>
                          
                          <div class="swiper-slide">
                            <a href="javascript:getThemeMenu('M06','T02')">
                                <img src="images/sec_2/kai.jpg" alt="">
                                <div class="thema_text disFlex align-center">
                                    <p>분위기 좋은</p>
                                    <p>양식 & 중식</p>
                                </div>
                            </a>
                          </div>
                          
                          <div class="swiper-slide">
                            <a href="javascript:getThemeMenu('M02','T05')">
                                <img src="images/sec_2/bi.png" alt="">
                                <div class="thema_text disFlex align-center">
                                    <p>비오는 날 </p>
                                    <p>한식</p>
                                </div>
                            </a>
                          </div>
                          
                        </div>
                        <div class="swiper-pagination"></div>
                    </div>
                    <div class="myBtn myBtn-next s2Next"><i class="fa-solid fa-chevron-right"></i></div>
                    <div class="myBtn myBtn-prev s2Prev"><i class="fa-solid fa-chevron-left"></i></div>
                </div>
                <div class="tag_wrap">
		               <c:forEach items="${theme}" var="theme">
		                  <a href="javascript:getTheme('${theme.getCommon_code()}')">${theme.getCommon_name()}</a>
		               </c:forEach>
                </div>
            </div>
            <!-- Swiper JS -->
            <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>

            <!-- Initialize Swiper -->
            <script>
                var swiper = new Swiper(".first-swiper", {
                    slidesPerView: 2,
                    spaceBetween: 30,
                    slidesPerGroup: 2,
                    loop: true,
                    loopFillGroupWithBlank: true,

                    navigation: {
                    nextEl: ".s2Next",
                    prevEl: ".s2Prev",
                    },
                });
            </script>

            <!-- SECTION 3 메뉴별 맛집-->
            <div id="section_3">
                <h2 class="sub_title"><i class="fa-solid fa-angle-right"></i> 메뉴별로 찾기</h2>
                <div class="s3_slide_wrap">
                    <div class="swiper second-swiper">
                        <div class="swiper-wrapper">
						<c:forEach items="${t_sdtos}" var="dto">
                            <div class="swiper-slide">
                                <a href="javascript:goMenuList('${dto.getCommon_code()}')">
                                    <img src="/images/sec_3/${dto.getCommon_code()}.png">
                                    <div><p>${dto.getCommon_name()}</p></div>
                                </a>					
                            </div>
                        </c:forEach>
                        </div>
                        <div class="swiper-pagination"></div>
                    </div>
                    <div class="myBtn myBtn-next s3Next"><i class="fa-solid fa-chevron-right"></i></div>
                    <div class="myBtn myBtn-prev s3Prev"><i class="fa-solid fa-chevron-left"></i></div>
                </div>
                <script>
                    var swiper = new Swiper(".second-swiper", {
                        slidesPerView: 5,
                        spaceBetween: 17,
                        slidesPerGroup: 1,
                        loop: true,
                        loopFillGroupWithBlank: true,
    
                        navigation: {
                        nextEl: ".s3Next",
                        prevEl: ".s3Prev",
                        },
                    });
                </script>
            </div>
            <!-- SECTION 4 리뷰 -->
            <div id="section_4">
                <h2 class="sub_title"><i class="fa-solid fa-angle-right"></i> 리뷰보고 찾아가는 맛집</h2>
                <div class="s4_review_wrap disFlex justify-space-between">
                    <c:forEach items="${t_rdtos}" var="dto" begin="0" end="5">
                    <div class="s4_review">
                        <a href="javascript:goStoreView('${dto.getS_no()}')" class="review_img">
                            <img src="/attach/review/${dto.getAttach_1()}" alt="">
                            <div class="disFlex">
                                <h4>${dto.getS_name()}</h4>
                                <p>${dto.getS_address()}</p>
                                <p> > 가게 정보 보기</p>
                            </div>
                        </a>
                        <a href="javascript:goReviewView('${dto.getR_no()}')" class="review_text">
                            <div class="review_profile disFlex justify-space-between">
                                <div>
                                <c:if test="${dto.getApi() ne 'N'}">
                               		<img src="/attach/member/profile/${dto.getProfile_photo()}" alt="">
                                </c:if>
                                <c:if test="${dto.getApi() eq 'N'}">
                               		<img src="${dto.getProfile_photo()}" alt="">
                                </c:if>
                                </div>
                                <p>${dto.getNickname()}</p>
                                <p>
		                          <span class="star">
		                          <c:set var="num" value="${dto.getStar_end()}"/>
		                             <c:forEach begin="1" end="${dto.getStar_front()}">
		                                 <i class="fa-solid fa-star"></i>                                                
		                             </c:forEach>
		                             <c:if test="${num eq 5}">
		                                 <i class="fa-regular fa-star-half-stroke"></i>
		                                 <c:forEach begin="2" end="${dto.getStar_empty()}">
		                                    <i class="fa-regular fa-star"></i>
		                                 </c:forEach>                                  
		                             </c:if>
		                             <c:if test="${num eq 0}"> 
	                                     <c:forEach begin="1" end="${dto.getStar_empty()}">
	                                        <i class="fa-regular fa-star"></i>
	                                     </c:forEach>
									 </c:if>
		                           	</span>
                                    <span>${dto.getReg_date()}</span>
                                </p>
                            </div>
                            <p>
								 <c:choose>
									<c:when test="${fn:length(dto.getContent())>120}">
										<p>${fn:substring(dto.getContent(),0,120)}...</p>
									</c:when>
									<c:otherwise>
			                       		<p>${dto.getContent()}</p>
									</c:otherwise>
								</c:choose>
                            </p>
                        </a>
                    </div>                  
					</c:forEach>
                </div>
            </div>
        </div>
        <!-- BOTTOM CONTENTS -->
        <div id="bottom_wrap">
            <!-- SECTION 5 맛집랭킹-->
            <div id="section_5">
                <h2 class="sub_title"><i class="fa-solid fa-angle-right"></i> 가장 많이 관심받는 맛집 BEST</h2>
                <div class="ranking_wrap disFlex justify-space-between">
                	<c:forEach items="${t_sdtos_2}" var="dto" begin="0" end="5">
                		<c:set var="i" value="${i+1}"/>
	                    <a href="javascript:goStoreView('${dto.getS_no()}')">
	                        <div>${i}</div>
	                        <div class="ranking_box disFlex">
	                            <div class="ranking_img"><img src="/attach/store/${dto.getS_name()}/${dto.getS_attach_1()}"></div>
	                            <div class="ranking_text disFlex">
	                                <h4>${dto.getS_name()}
	                                <span><i class="fa-regular fa-heart"></i>${dto.getFavCount()}</span>
	                                </h4>
	                                <p class="co-gray">${dto.getS_address()}</p>
	                                <p>
	                                 <c:choose>
									<c:when test="${fn:length(dto.getS_content())>66}">
										<p>${fn:substring(dto.getS_content(),0,66)}...</p>
									</c:when>
									<c:otherwise>
			                       		<p>${dto.getS_content()}</p>
									</c:otherwise>
								</c:choose>
	                                </p>
	                                <p class="co-gray">
	                                    <br>#${dto.getTheme_name_1()} #${dto.getTheme_name_2()} #${dto.getTheme_name_3()}
	                                </p>
	                            </div>
	                        </div>
	                    </a>
					</c:forEach>
                </div>
            </div>
            <!-- SECTION 6 방송에 나온 맛집-->
            <div id="section_6">
                <h2 class="sub_title"><i class="fa-solid fa-angle-right"></i> 유튜버가 다녀간 맛집</h2>
                    <div class="s6_wrap disFlex justify-space-between">
                        <div class="s6_box">
                            <div>
                                <a href="https://www.youtube.com/watch?v=CQpxJhN16pM" target='_blank'>
                                    <img src="images/sec_6/1500회전초밥_쯔양.png">
                                    <div class="hover_box">▷ 영상 보러가기</div>
                                </a>
                            </div>
                            <p>1500회전초밥_쯔양 2021.06.26 </p>
                        </div>
                        <div class="s6_box">
                            <div>
                                <a href="https://www.youtube.com/watch?v=RskLorPoYEY" target='_blank'>
                                    <img src="images/sec_6/왕순대_맛상무.png">
                                    <div class="hover_box">▷ 영상 보러가기</div>
                                </a>
                            </div>
                            <p>대전왕순대_맛상무 2019.12.13 </p>
                        </div>
                        <div class="s6_box">
                            <div>
                                <a href="https://www.youtube.com/watch?v=tFFtj7P3_fk" target='_blank'>
                                    <img src="images/sec_6/막장집.png">
                                    <div class="hover_box">▷ 영상 보러가기</div>
                                </a>
                            </div>
                            <p>대전막장집_쯔양 2021.05.12 </p>
                        </div>
                    </div>
                </div>
            <!-- SECTION 7-->
            <div id="section_7" class="disFlex justify-space-between">
                <div class="s7_box disFlex align-center">
                    <h4>
                        <span><i class="fa-solid fa-quote-left"></i></span>
                        <p>우리 가게도 소개하고싶다면?</p>
                        <span><i class="fa-solid fa-quote-right"></i></span>
                    </h4>
                    <p>우리 가게 정보를 등록하여 홍보하고 고객의 입맛을 사로잡아보세요!</p>
                    <c:if test="${not empty sessionId}">
                    	<c:if test="${sessionLevel_code eq 'business'}">
	                		<input type="button" name="t_store" onclick="" value="가게 정보 등록하기">
                    	</c:if>
	                	<c:if test="${sessionLevel_code ne 'business'}">
	                		<input type="button" name="t_store" onclick="alert('사업자 회원만 이용하실 수 있습니다.');return" value="가게 정보 등록하기">
	                	</c:if>
                	</c:if>
                	<c:if test="${empty sessionId}">
                  		<input type="button" name="t_store" onclick="goAlertMember('로그인 후 이용가능합니다','/Member','login')" value="가게 정보 등록하기">
                	</c:if>
                </div>
                <div class="s7_box disFlex align-center">
                    <h4>
                        <span><i class="fa-solid fa-quote-left"></i></span>
                        <p>나만의 리뷰를 작성하고싶다면?</p>
                        <span><i class="fa-solid fa-quote-right"></i></span>
                    </h4>
                    <p>내가 가본 맛집에 솔직리뷰를 달아 나만의 맛집 리스트를 만들어보세요!</p>
                    
                    
                    <c:if test="${not empty sessionId}">
                    	<c:if test="${sessionLevel_code eq 'member'}">
               		       <input type="button" name="t_review" onclick="register('goReview')" value="리뷰 등록하기">
                  		</c:if>
                  		<c:if test="${sessionLevel_code ne 'member'}">
               		       <input type="button" name="t_review" onclick="alert('일반 회원만 이용하실 수 있습니다.');return" value="리뷰 등록하기">
                  		</c:if>
                    </c:if>
                    
                    <c:if test="${empty sessionId}">
                		 <input type="button" name="t_review" onclick="goAlertMember('로그인 후 이용가능합니다.','/Member','login')"  value="리뷰 등록하기">
                	</c:if>
                </div>
            </div>
        </div>
    </div>
    <!-- modal -->
    
    <a href="#" class="top">TOP</a>
    <!-- /CONTENT END -->

    <!-- FOOTER -->
    <%@ include file="/common_footer.jsp" %>
    <!-- /FOOTER END -->
</body>
</html>