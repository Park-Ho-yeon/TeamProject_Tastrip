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
    <title>테이스트립 :: 마이페이지</title>
	<script type="text/javascript">
			function memberForm(){
				member.method="post";
				member.action="/Member";
				member.submit();
			}
		    function goMemberPage(gubun){
		    	review.t_gubun.value=gubun;
		    	review.method="post";
		    	review.action="/Member";
		    	review.submit();
			}
		    function reviewView(r_no){
		    	review.t_gubun.value="reviewView";
		    	review.t_r_no.value=r_no;
		    	review.target="_blank";
		    	review.method="post";
		    	review.action="/Review";
		    	review.submit();
		    }
			function gosearch(gubun){
				member.t_gubun.value=gubun;
				memberForm();
				
			}	
			 function goPage(pageNum){
				 page.t_nowPage.value=pageNum;
				 page.t_gubun.value="review";
				 page.method="post";
				 page.action="/Member";
				 page.submit();
				}
		    
	    </script>
</head>
<body>
<form name="page">
	<input type="hidden" name="t_gubun">
	<input type="hidden" name="t_nowPage"> 
</form>
		
	<form name="review">
		<input type="hidden" name="t_gubun">
		<input type="hidden" name="t_r_no">
	</form>
    <%@ include file="/common_loginHeader.jsp" %>
    <div id="member_list">
        <div class="top_header">
            <h1><b>마이 페이지</b><br><span>[</span> 작성한 리뷰 <span>]</span></h1>
        </div>
        <div class="mypage_wrap">
            <%@ include file = "/common_Memberpage_menu.jsp" %>
            <form name="member">
            <input type="hidden" name="t_gubun">
            <div id="store_review">
                <div class="sort_box disFlex">
                    <div>
                        <span class="store_count">총 ${total_count} 건</span> 
                         <select name="t_list_count" onchange="gosearch('review')">
                            <option value="5" <c:if test="${listCount eq '5'}">selected</c:if>>5개씩 보기</option>
                            <option value="10" <c:if test="${listCount eq '10'}">selected</c:if>>10개씩 보기</option>
                            <option value="15" <c:if test="${listCount eq '15'}">selected</c:if>>15개씩 보기</option>
                        </select>
                        <select name="sequence" onchange="gosearch('review')">
                            <option value="reg_date desc"<c:if test="${sequence eq 'reg_date desc'}">selected</c:if>>최신 등록 순</option>
                            <option value="r.star desc" <c:if test="${sequence eq 'r.star desc'}">selected</c:if>>별점 높은 순</option>
                            <option value="r.star asc" <c:if test="${sequence eq 'r.star asc'}">selected</c:if>>별점 낮은 순</option>
                        </select>
                    </div>
                    <div class="search_box" >
                        <select name="t_select">
                            <option value="s.s_name" <c:if test="${select eq 's.s_name'}">selected</c:if> >가게 이름</option>
                            <option value="s.s_address" <c:if test="${select eq 's.s_address'}">selected</c:if> >주소</option>
                        </select>
                        <input type="text" name="t_search" value="${search}">
                        <button onclick="gosearch('review')"><i class="fa-solid fa-magnifying-glass" ></i></button>
                    </div>
                </div>
                <c:if test="${empty t_dtos}">
                	<div class="no_result">검색 결과가 없습니다.</div>
                </c:if>
                <c:forEach items="${t_dtos}" var="t_dtos">
                <a href="javascript:reviewView('${t_dtos.getR_no()}')">
                    <div class="disFlex">
                        <div class="bubble">
                            <div class="s_name disFlex justify-space-between">
                                <p>${t_dtos.getS_name()}</p>
                                <span><i class="fa-solid fa-pen-to-square"></i>${t_dtos.getReg_date()}</span>
                            </div>
                            <div class="disFlex justify-space-between">
                                <span>${t_dtos.getS_address()}</span>
                                <div class="star disFlex align-center" >
                                <span class="star">
		                          <c:set var="num" value="${t_dtos.getStar_end()}"/>
		                             <c:forEach begin="1" end="${t_dtos.getStar_front()}">
		                                 <i class="fa-solid fa-star"></i>                                                
		                             </c:forEach>
		                             <c:if test="${num eq 5}">
		                                 <i class="fa-regular fa-star-half-stroke"></i>
		                                 <c:forEach begin="2" end="${t_dtos.getStar_empty()}">
		                                    <i class="fa-regular fa-star"></i>
		                                 </c:forEach>
		                             </c:if>
		                             <c:if test="${num eq 0}">
	                                     <c:forEach begin="1" end="${t_dtos.getStar_empty()}">
	                                        <i class="fa-regular fa-star"></i>
	                                     </c:forEach>
									 </c:if>
	                           	</span>
                                </div>
                            </div>
                            <p>
                                ${t_dtos.getContent()}
                                <span>더보기</span>
                            </p>
                            <c:if test="${not empty t_dtos.getAttach_1()}">
                            <div class="review_photo">
	                            <img src="../attach/review/${t_dtos.getAttach_1()}">
	                            <c:if test="${not empty t_dtos.getAttach_2()}">
	                                <img src="../attach/review/${t_dtos.getAttach_2()}">
	                            </c:if>
	                            <c:if test="${not empty t_dtos.getAttach_3()}">
	                                <img src="../attach/review/${t_dtos.getAttach_3()}">
	                            </c:if>
	                            <c:if test="${not empty t_dtos.getAttach_4()}">
	                                <img src="../attach/review/${t_dtos.getAttach_4()}">
	                            </c:if>
	                            <c:if test="${not empty t_dtos.getAttach_5()}">
	                                <img src="../attach/review/${t_dtos.getAttach_5()}">
	                            </c:if>
                            </div>
                            </c:if>
                        </div>
                    </div>
                </a>
                
              </c:forEach>
             
            </div>
            </form>
            
            
            <div class="page"> 
              ${pageDisplay}
              
              
              <!--  
                <a href=""><i class="fa-solid fa-angle-left"></i></a>
               <a href="" class="choice">1</a>
                <a href="">2</a>
                <a href="">3</a>
                <a href="">4</a>
                <a href="">5</a> 
                
                <a href=""><i class="fa-solid fa-angle-right"></i></a>
                 -->
            </div>
        </div>
    </div>
    <script>
        $(function(){
             //관심가게 하트
            $('.fa-heart').click(function(){
                if(confirm('해당 가게를 관심 목록에서 지우시겠습니까?')){
                    $(this).addClass('fa-regular');
                    $(this).removeClass('fa-solid');
                }
            });
        })
    </script>
    <!-- FOOTER -->
    <%@ include file="/common_footer.jsp" %>
</body>
</html>