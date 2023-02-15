<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

