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
    
	    function goMemberPage(gubun){
			member.t_gubun.value=gubun;
			member.method="post";
			member.action="/Member";
			member.submit();
		}
	    
	    //페이지
	    function goPage(pageNum){
	    	sel.t_nowPage.value=pageNum;
	    	sel.t_gubun.value="favorite";
	    	sel.method="post";
	    	sel.action="/Member";
	    	sel.submit();
		}
	    
	    //검색바
	    function gosearch(gubun){
	    	sel.t_gubun.value=gubun;
	    	sel.method="post";
	    	sel.action="/Member";
	    	sel.submit();
	    }
	    
	    //가게상세뷰
	    function goStoreView(no){
	    	sel.t_s_no.value=no;
	    	sel.t_gubun.value="storeView";
	    	sel.method="post";
	    	sel.action="/Store";
	    	sel.submit();
	    }
	    
	    //관심가게 삭제
	    function delFavorite(s_no){	   
	    	if(confirm('관심 가게 목록에서 삭제하시겠습니까?')){
		    	$.ajax({
		    		type : "POST",
		    		url : "MemberSaveFavorite",
		    		data: "t_s_no="+s_no,
		    		dataType : "text",
		    		error : function(){
		    			alert('통신실패');
		    		},
		    		success : function(data){
		    		location.reload();
		    		}
		    	});
	    	}
	    }
    </script>
</head>
<body>
<form name="member">
	<input type="hidden" name="t_gubun">
</form>
    <%@ include file="/common_loginHeader.jsp" %>
    <div id="member_list">
        <div class="top_header">
            <h1><b>마이 페이지</b><br><span>[</span> 관심 가게 목록 <span>]</span></h1>
        </div>
        <div class="mypage_wrap">
           <%@ include file = "/common_Memberpage_menu.jsp" %>
            
            <form name="sel">
            <input type="hidden" name="t_gubun">
            <input type="hidden" name="t_s_no">
			<input type="hidden" name="t_nowPage" value="${t_nowPage}"> 
            <div class="list_wrap">
                <div class="sort_box disFlex">
                    <div>
                    	<span class="store_count">총 ${total_count} 건</span> 
                          <select name="t_list_count" onchange="gosearch('favorite')">
                            <option value="5" <c:if test="${listCount eq '5'}">selected</c:if>>5개씩 보기</option>
                            <option value="10" <c:if test="${listCount eq '10'}">selected</c:if>>10개씩 보기</option>
                            <option value="15" <c:if test="${listCount eq '15'}">selected</c:if>>15개씩 보기</option>
                        </select>
                        <select name="sequence" onchange="gosearch('favorite')">
                            <option value="f.f_date desc"<c:if test="${sequence eq 'f.f_date desc'}">selected</c:if>>최신 등록 순</option>
                            <option value="star desc" <c:if test="${sequence eq 'star desc'}">selected</c:if>>별점 높은 순</option>
                            <option value="star asc" <c:if test="${sequence eq 'star asc'}">selected</c:if>>별점 낮은 순</option>
                        </select>
                    </div>
                    <div class="search_box">
                        <select name="t_select">
                            <option value="s.s_name" <c:if test="${select eq 's.s_name'}">selected</c:if>>가게 이름</option>
                            <option value="s.s_address" <c:if test="${select eq 's.s_address'}">selected</c:if>>주소</option>
                        </select>
                        <input type="text" name="t_search" value="${search}">
                        <button onclick="gosearch('favorite')"><i class="fa-solid fa-magnifying-glass"></i></button>
                    </div> 
                </div>
                <c:if test="${empty dtos}">
                	<div class="no_result">검색 결과가 없습니다.</div>
                </c:if>
                <c:set var="number" value="${order}"></c:set>
                <c:forEach items ="${dtos}" var="dtos">
                <div class="list_box disFlex">
                    <div class="list_num">
                   	  ${number}
                       	 <c:set var="number" value="${number-1}"></c:set>
                    </div>
                    <a href="javascript:goStoreView('${dtos.getS_no()}')"><img src="../attach/store/${dtos.getS_name()}/${dtos.getS_attach_1()}" alt=""></a>
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
                                  <span>(${dtos.getStar()})</span>
                               </c:otherwise>
                            </c:choose>
                        </div>
                        <p>${dtos.getS_address()}</p>
                        <div class="list_btn disFlex align-center" onclick="javascript:delFavorite('${dtos.getS_no()}')">
                            <i class="fa-solid fa-heart fa-2x"></i>
                            <p>관심 가게</p>
                        </div>
                        <p>${dtos.getS_content()}</p>
                        <span>#${dtos.getTheme_name_1()}</span><span>#${dtos.getTheme_name_2()}</span><span>#${dtos.getTheme_name_3()}</span>
                        <a href="javascript:goStoreView('${dtos.getS_no()}')">자세히 보기</a>
                    </div>
                </div>
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
            $('.fa-heart').click(function(){
                if($(this).hasClass('fa-solid')){
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