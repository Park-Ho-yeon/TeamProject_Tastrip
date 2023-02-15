<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <script>
	    
		//가게 상세보기
		function goStoreView(){
			review.t_gubun.value="storeView";
			review.method="post";
			review.action="/Store";
			review.submit();		
		}
    
        function goReviewUpdates(){
        	if(review.t_star.value==""){
        		alert('별점을 체크해주세요!');
        		return;
        	}
        	if(review.t_star.value=='0'){
        		alert('최소 별점은 0.5점 입니다!');
        		return;
        	}
        	if(review.t_content.value==''){
        		alert('리뷰 내용을 작성해주세요.');
        		review.t_content.focus();
        		return;
        	}
        	
        	if(confirm('리뷰를 수정하시겠습니까?')){
	        	review.t_gubun.value="reviewUpdate";
	        	review.method="post";
	        	review.action="/Review?t_gubun=reviewUpdate";
	        	review.submit();
        	}
        }
        
        //기존사진 미리보기 삭제
        function delImage(e){
        	var delValue = e.nextElementSibling;
        	var delInput = delValue.cloneNode();
        	delInput.setAttribute('name','t_del_attach');
        	review.append(delInput);
        	e.parentElement.remove();
        }
        
    </script>
    <title>테이스트립 : 리뷰 수정</title>
</head>
<body>
    <%@ include file = "/common_loginHeader.jsp" %>
    
    <form name="review" enctype="multipart/form-data">
	    <input type="hidden" name="t_gubun">
	    <input type="hidden" name="t_r_no" value="${r_no}">
	    <input type="hidden" name="t_s_no" value="${t_s_no}">
	    <input type="hidden" name="t_ori_star" value="${u_dto.getStar()}">

    
        <div class="content">
            <div class="disFlex profile">
               	<c:if test="${sessionApi ne 'N'}">
	            	<div class="member_profile">
	                    <img src="../attach/member/profile/${sessionProfile}">
	                </div>
            	</c:if>
            	<c:if test="${sessionApi eq 'N'}">
					<div class="member_profile">
	                    <img src="${sessionProfile}">
	                </div>        	
            	</c:if>
                <p class="nickname">${sessionNickname}</p>
                <p class="reg_date">${u_dto.getReg_date()}<i class="fa-solid fa-pencil"></i></p>
            </div> 
            <div class="text_area">
                <div class="star_num disFlex">
                    <p>별점 : </p>
                    <input type="hidden" name="t_star" value="${u_dto.getStar()}">
                    <div>
                    <span class="star star-font">
                        ★★★★★
                        <span class="star-font">★★★★★</span>
                        <input type="range" oninput="drawStar(this)" id="starRange" value="${starRange}" step="1" min="0" max="10">
                    </span>
                </div>
                <span class="star_num_view"></span>
                </div>
                    <a class="write_store" href="javascript:goStoreView()">@${u_dto.getS_name()} - <span>${u_dto.getCity_name()} ${u_dto.getLocal_name()}</span></a>
                    <textarea placeholder="리뷰 내용을 작성해주세요" name="t_content">${u_dto.getContent()}</textarea>
                    <div id='image_preview'>
                        <label for="btnAtt">
                            <div class="btn-upload">사진 선택</div>
                        </label>
                        <input type="file" name="t_photo" id="btnAtt" multiple>
                        <div id='att_zone' data-placeholder='원하시는 이미지를 드래그 또는 추가해주세요(최대 5개)'>
                        	<c:forEach items="${r_imgs}" var="img">
								<div>
									<img src="attach/review/${img}">
									<input type="button" value="X" onclick="delImage(this)">
									<input type="hidden" value="${img}" name="t_not_delete">
								</div>
                        	</c:forEach>
                        </div>
                    </div>
            </div>
        </div>
        <div class="review_button disFlex">
            <input type="button" value="등록" onclick="goReviewUpdates()">
            <input type="button" value="취소" onclick="window.close()">
        </div>
            
    </form>
</body>
<script>
    
    
    
    ( /* att_zone : 이미지들이 들어갈 위치 id, btn : file tag id */
        
        imageView = function imageView(att_zone, btn){

            var attZone = document.getElementById(att_zone);
            var btnAtt = document.getElementById(btn)
            var sel_files = [];       
            
            btnAtt.onchange = function(e){
	            var files = e.target.files;
	            var fileArr = Array.prototype.slice.call(files)
	            for(f of fileArr){
	                imageLoader(f);
	           	}
            };
            
            // 탐색기에서 드래그앤 드롭 사용
            attZone.addEventListener('dragenter', function(e){
	            e.preventDefault();
	            e.stopPropagation();
            }, false)
            
            attZone.addEventListener('dragover', function(e){
	            e.preventDefault();
	            e.stopPropagation();
            
            }, false)
        
            attZone.addEventListener('drop', function(e){
	            var files = {};
	            e.preventDefault();
	            e.stopPropagation();
	            var dt = e.dataTransfer;
	            files = dt.files;
	            for(f of files){
	                imageLoader(f);
	            }
            }, false)
            
            
            /*첨부된 이미지를 배열에 넣고 미리보기 */
            imageLoader = function(file){
            sel_files.push(file);
            var reader = new FileReader();
            reader.onload = function(ee){
                let img = document.createElement('img')
                img.src = ee.target.result;
                attZone.appendChild(makeDiv(img, file));
            }
            
            reader.readAsDataURL(file);
            }
            
            /*첨부된 파일이 있는 경우 checkbox와 함께 attZone에 추가할 div를 만들어 반환 */
            makeDiv = function(img, file){
	            var div = document.createElement('div')
	            var btn = document.createElement('input')
	            btn.setAttribute('type', 'button')
	            btn.setAttribute('value', 'X')
	            btn.setAttribute('delFile', file.name);
	            btn.onclick = function(ev){
	                var ele = ev.srcElement;
	                var delFile = ele.getAttribute('delFile');
	                for(var i=0 ;i<sel_files.length; i++){
		                if(delFile== sel_files[i].name){
		                    sel_files.splice(i, 1);      
		                }
	                }
	                
	                dt = new DataTransfer();
	                for(f in sel_files) {
	                var file = sel_files[f];
	                dt.items.add(file);
	                }
	                btnAtt.files = dt.files;
	                var p = ele.parentNode;
	                attZone.removeChild(p)
	            }
		            div.appendChild(img)
		            div.appendChild(btn)
		            return div;
            }
        }
    
    )('att_zone', 'btnAtt')

</script>
<script type="text/javascript">
	var starVal = document.getElementById('starRange');
	document.querySelector('.star span').style.width = starVal.value*10+'%';
	document.querySelector('.star_num_view').innerHTML= "("+starVal.value / 2+")";
	
	function drawStar(target){
	    var tv = target.value;
	    var star_span = document.querySelector('.star span').style.width = tv * 10+'%';
	    console.log(star_span);
	    var star_score = document.getElementsByName('star_score').value = target.value / 2;
	    review.t_star.value = star_score;
	    
	    document.querySelector('.star_num_view').innerHTML="("+star_score+")";
	}
</script>
</html>