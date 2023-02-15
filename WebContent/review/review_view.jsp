<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${empty v_dto}">
	<script type="text/javascript">
		alert("잘못된 접근입니다!");
		location.href="/Index";
	</script>
</c:if>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/common.css">
    <link rel="stylesheet" href="../css/font.css">
    <link rel="stylesheet" href="../css/review.css">
    <link
    rel="stylesheet"
    href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css"
    />
    <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="https://kit.fontawesome.com/17da812ad5.js" crossorigin="anonymous"></script>
    <title>테이스트립 :: 리뷰 -${v_dto.getS_name()}</title>
    
	<script type="text/javascript">
	
		//가게 상세보기
		function goStoreView(){
			rForm.t_gubun.value="storeView";
			rForm.method="post";
			rForm.action="/Store";
			rForm.submit();		
		}
		
		//리뷰 수정
		function goReviewUpdate(){
			rForm.t_gubun.value="reviewUpdateForm";
			rForm.method="post";
			rForm.action="/Review";
			rForm.submit();
		}
		
		//리뷰 삭제
		function goReviewDelete(){
			if(confirm('리뷰를 삭제하시겠습니까?')){
				rForm.t_gubun.value="reviewDelete";
				rForm.method="post";
				rForm.action="/Review";
				rForm.submit();
			}
		}
		
	</script>
</head>
<body>
    <header>
        <a href="/Index">
            <img src="../images/logo_design_4.png" alt="로고">
        </a>
    </header>
    <div class="content">
<form name="rForm">
	<input type="hidden" name="t_gubun">
	<input type="hidden" name="t_s_no" value="${v_dto.getS_no()}">
	<input type="hidden" name="t_r_no" value="${r_no}">
</form>
        <div>
            <div class="disFlex profile">
                <c:if test="${v_dto.getApi() ne 'N'}">
	            	<div class="member_profile">
	                    <img src="../attach/member/profile/${v_dto.getProfile_photo()}">
	                </div>
            	</c:if>
            	<c:if test="${v_dto.getApi() eq 'N'}">
					<div class="member_profile">
	                    <img src="${v_dto.getProfile_photo()}">
	                </div>        	
            	</c:if>
                <p class="nickname">${v_dto.getNickname()}</p>
                <p class="reg_date">${v_dto.getReg_date()}<i class="fa-solid fa-pencil"></i></p>
            </div>
            <div class="text_area">
            	<div>
	                <p>
	                    <c:choose>
	                        <c:when test="${v_dto.getStar_front() eq 0 and v_dto.getStar_end() eq 0}">
	                           &nbsp;&nbsp;<span class="gray_txt">리뷰없음</span>
	                        </c:when>
	                        <c:otherwise>
	                           <span class="star">
	                          <c:set var="num" value="${v_dto.getStar_end()}"/>
	                             <c:forEach begin="1" end="${v_dto.getStar_front()}">
	                                 <i class="fa-solid fa-star"></i>                                                
	                             </c:forEach>
	                             <c:if test="${num eq 5}">
	                                 <i class="fa-regular fa-star-half-stroke"></i>
	                                 <c:forEach begin="2" end="${v_dto.getStar_empty()}">
	                                    <i class="fa-regular fa-star"></i>
	                                 </c:forEach>                                  
	                             </c:if>
	                             <c:if test="${num eq 0}"> 
                                     <c:forEach begin="1" end="${v_dto.getStar_empty()}">
                                        <i class="fa-regular fa-star"></i>
                                     </c:forEach>
                                </c:if>
	                 			 (${v_dto.getStar()})
	                           </span>
	                        </c:otherwise>
	                    </c:choose>
	                </p>
	                <c:if test="${sessionId eq v_dto.getReg_id()}">
		                <a href="javascript:goReviewDelete()">삭제</a>
		                <a href="javascript:goReviewUpdate()">수정</a>
	                </c:if>
	            </div>
                <p>
                	${v_dto.getContent()}
                </p>
                <a href="javascript:goStoreView()">@${v_dto.getS_name()} - ${v_dto.getCity_name()} <span>${v_dto.getLocal_name()}</span></a>
                <c:if test="${not empty r_imgs}">
                <div class="review_photo">
                	<c:forEach items="${r_imgs}" var="img">
                    	<img src="../attach/review/${img}">
                	</c:forEach>
                </div>
                </c:if>
            </div> 
        </div>
    </div>
    <input type="button" value="닫기" class="closeBtn" onclick="window.close()">

    <div id="modal">
        <div>
            <span class="close">&times;</span>
            <div class="swiper_box">
                <div
                    style="--swiper-navigation-color: #fff; --swiper-pagination-color: #fff"
                    class="swiper mySwiper2"
                >
                    <div class="swiper-wrapper">
                    	<c:forEach items="${r_imgs}" var="img">
	                        <div class="swiper-slide">
	                    		<img src="../attach/review/${img}">
	                        </div>
                		</c:forEach>
                    </div>
                    <div class="swiper-button-next"></div>
                    <div class="swiper-button-prev"></div>
                </div>
                <div thumbsSlider="" class="swiper mySwiper">
                    <div class="swiper-wrapper">
                        <c:forEach items="${r_imgs}" var="img">
	                        <div class="swiper-slide">
	                    		<img src="../attach/review/${img}">
	                        </div>
                		</c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        var swiper = new Swiper(".mySwiper", {
          spaceBetween: 10,
          slidesPerView: 4,
          freeMode: true,
          watchSlidesProgress: true,
        });
        var swiper2 = new Swiper(".mySwiper2", {
          spaceBetween: 10,
          navigation: {
            nextEl: ".swiper-button-next",
            prevEl: ".swiper-button-prev",
          },
          thumbs: {
            swiper: swiper,
          },
        });
    </script>
    <script>
         // 리뷰 상세보기 사진 모달창
        $('#modal').hide();
        $('.review_photo img').click(function(){
            $('#modal').fadeIn();
        });
        $('.close').click(function(){
            $('#modal').fadeOut();
        });
    </script>
</body>
</html>