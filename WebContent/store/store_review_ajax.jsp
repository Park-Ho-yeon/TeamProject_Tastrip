<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
                         		<span> 자세히보기</span>
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