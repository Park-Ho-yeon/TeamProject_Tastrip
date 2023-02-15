<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
    <title>테이스트립 :: 회원가입</title>
    <script>

        function sectionChange(nowStep,goToStep){
            document.getElementById('step_'+nowStep).style.display='none';
            document.getElementById('step_'+goToStep).style.display='block';

            document.getElementById('step_top'+nowStep).classList.remove('step_on');
            document.getElementById('step_top'+goToStep).className='step_on';

            document.getElementById('now_step').value=goToStep;
            window.scrollTo(0,0);

            var backBtn = document.querySelector('.back_btn');
            if(goToStep=='1') {
                backBtn.style.display='none';
            }else{
                backBtn.style.display='block';
            }

            var NextBtn = document.querySelector('.next_btn');
            if(goToStep=='4'){
                NextBtn.innerHTML='회원 등록';
            }else{
                NextBtn.innerHTML='다음 단계로 <i class="fa-solid fa-angles-right"></i>';
            }

        }

        //다음단계로
        function goNextStep(nowStepValue){
            if(document.getElementById('okCheck_1').value=="no"){
                alert('[개인정보 수집 및 이용약관]에 동의해주세요.');
                return;
            }
            if(document.getElementById('okCheck_2').value=="no"){
                alert('[위치기반서비스 이용약관]에 동의해주세요.');
                return;
            }

            if(nowStepValue=='4'){
                alert('회원가입을 축하합니다!');
                return;
            }
            sectionChange(nowStepValue,Number(nowStepValue)+1);
            

    
        }

        //이전버튼
        function goBackStep(nowStepValue){
            sectionChange(nowStepValue,Number(nowStepValue)-1);
        }

    </script>
    <!-- 동의버튼 클릭 -->
    <script>
        $(document).ready(function(){
            $('.check_box').click(function(){
                $(this).find('.check_icon').toggleClass('fa-regular');
                $(this).find('.check_icon').toggleClass('fa-circle');
                $(this).find('.check_icon').toggleClass('fa-solid');
                $(this).find('.check_icon').toggleClass('fa-circle-check');

                if($('.check_icon').hasClass('fa-circle')){
                    $(this).find('.okCheck').val("no");
                };
                if($('.check_icon').hasClass('fa-circle-check')){
                    $(this).find('.okCheck').val("ok");
                };
            });
        });
    </script>
</head>
<body>
    <%@ include file="/common_loginHeader.jsp" %>
    <div id="jform_wrap">
        <div class="top_title">
            <h1><b>회원 가입</b><br><span>[</span> 사업자 회원 <span>]</span></h1>
            <div class="step_box disFlex align-center">
                <div id="step_top1" class="step_on">
                    <img src="../images/join/f_i1.png" alt="">
                    <p>STEP 1</p>
                    <p>개인정보 동의</p>
                </div>
                <p><i class="fa-solid fa-chevron-right fa-2x"></i></p>
                <div id="step_top2">
                    <img src="../images/join/f_i4.png" alt="">
                    <p>STEP 2</p>
                    <p>회원정보 입력</p>
                </div>
                <p><i class="fa-solid fa-chevron-right fa-2x"></i></p>
                <div id="step_top3">
                    <img src="../images/join/f_i6.png" alt="">
                    <p>STEP 3</p>
                    <p>가게정보 입력</p>
                </div>
                <p><i class="fa-solid fa-chevron-right fa-2x"></i></p>
                <div id="step_top4">
                    <img src="../images/join/f_i5.png" alt="">
                    <p>STEP 4</p>
                    <p>입력정보 확인</p>
                </div>
            </div>
        </div>
        <div id="stepChange_wrap">
            <!-- STEP_1 -->
            <div id="step_1" class="content_wrap_1">
                <div class="ta_1">
                    <div>
                        <h1>[ 개인정보 수집 및 이용 동의 ]</h1>
                        <textarea spellcheck="false" readonly>
        [1. 개인정보처리방침의 의의]
        테이스트립은 본 개인정보처리방침은 개인정보보호법 기준으로 작성하되, 테이스트립 내에서의 이용자 개인정보 처리 현황을 최대한 알기 쉽고 상세하게 설명하기 위해 노력하였습니다. 이는 쉬운 용어를 사용한 개인정보처리방침 작성 원칙인 ‘Plain Language Privacy Policy(쉬운 용어를 사용한 개인정보처리방침)’를 도입한 것입니다.
        
        개인정보처리방침은 다음과 같은 중요한 의미를 가지고 있습니다.
        테이스트립이 어떤 정보를 수집하고, 수집한 정보를 어떻게 사용하며, 필요에 따라 누구와 이를 공유(‘위탁 또는 제공’)하며, 이용목적을 달성한 정보를 언제・어떻게 파기하는지 등 ‘개인정보의 한살이’와 관련한 정보를 투명하게 제공합니다.
        정보주체로서 이용자는 자신의 개인정보에 대해 어떤 권리를 가지고 있으며, 이를 어떤 방법과 절차로 행사할 수 있는지를 알려드립니다. 또한, 법정대리인(부모 등)이 만14세 미만 아동의 개인정보 보호를 위해 어떤 권리를 행사할 수 있는지도 함께 안내합니다.
        개인정보 침해사고가 발생하는 경우, 추가적인 피해를 예방하고 이미 발생한 피해를 복구하기 위해 누구에게 연락하여 어떤 도움을 받을 수 있는지 알려드립니다.
        그 무엇보다도, 개인정보와 관련하여 테이스트립와 이용자간의 권리 및 의무 관계를 규정하여 이용자의 ‘개인정보자기결정권’을 보장하는 수단이 됩니다.
        
        [2. 수집하는 개인정보]
        이용자는 회원가입을 하지 않아도 정보 검색, 뉴스 보기 등 대부분의 테이스트립 서비스를 회원과 동일하게 이용할 수 있습니다. 이용자가 메일, 캘린더, 카페, 블로그 등과 같이 개인화 혹은 회원제 서비스를 이용하기 위해 회원가입을 할 경우, 테이스트립은 서비스 이용을 위해 필요한 최소한의 개인정보를 수집합니다.
        
        회원가입 시점에 테이스트립이 이용자로부터 수집하는 개인정보는 아래와 같습니다.
        회원 가입 시에 ‘아이디, 비밀번호, 이름, 생년월일, 성별, 휴대전화번호’를 필수항목으로 수집합니다. 만약 이용자가 입력하는 생년월일이 만14세 미만 아동일 경우에는 법정대리인 정보(법정대리인의 이름, 생년월일, 성별, 중복가입확인정보(DI), 휴대전화번호)를 추가로 수집합니다. 그리고 선택항목으로 이메일주소를 수집합니다.
        단체아이디로 회원가입 시 단체아이디, 비밀번호, 단체이름, 이메일주소, 휴대전화번호를 필수항목으로 수집합니다. 그리고 단체 대표자명을 선택항목으로 수집합니다.
        서비스 이용 과정에서 이용자로부터 수집하는 개인정보는 아래와 같습니다.
        회원정보 또는 개별 서비스에서 프로필 정보(별명, 프로필 사진)를 설정할 수 있습니다. 회원정보에 별명을 입력하지 않은 경우에는 마스킹 처리된 아이디가 별명으로 자동 입력됩니다.
        테이스트립 내의 개별 서비스 이용, 이벤트 응모 및 경품 신청 과정에서 해당 서비스의 이용자에 한해 추가 개인정보 수집이 발생할 수 있습니다. 추가로 개인정보를 수집할 경우에는 해당 개인정보 수집 시점에서 이용자에게 ‘수집하는 개인정보 항목, 개인정보의 수집 및 이용목적, 개인정보의 보관기간’에 대해 안내 드리고 동의를 받습니다.
        이용자 동의 후 개인정보를 추가 수집하는 경우
        
        '개인정보 이용내역(내정보)' 확인하기
        
        서비스 이용 과정에서 IP 주소, 쿠키, 서비스 이용 기록, 기기정보, 위치정보가 생성되어 수집될 수 있습니다.
        또한 이미지 및 음성을 이용한 검색 서비스 등에서 이미지나 음성이 수집될 수 있습니다.
        구체적으로 1) 서비스 이용 과정에서 이용자에 관한 정보를 자동화된 방법으로 생성하여 이를 저장(수집)하거나, 2) 이용자 기기의 고유한 정보를 원래의 값을 확인하지 못 하도록 안전하게 변환하여 수집합니다. 서비스 이용 과정에서 위치정보가 수집될 수 있으며, 테이스트립에서 제공하는 위치기반 서비스에 대해서는 '테이스트립 위치정보 이용약관'에서 자세하게 규정하고 있습니다.
        이와 같이 수집된 정보는 개인정보와의 연계 여부 등에 따라 개인정보에 해당할 수 있고, 개인정보에 해당하지 않을 수도 있습니다.
        
        테이스트립은 아래의 방법을 통해 개인정보를 수집합니다.
        회원가입 및 서비스 이용 과정에서 이용자가 개인정보 수집에 대해 동의를 하고 직접 정보를 입력하는 경우, 해당 개인정보를 수집합니다.
        고객센터를 통한 상담 과정에서 웹페이지, 메일, 팩스, 전화 등을 통해 이용자의 개인정보가 수집될 수 있습니다.
        오프라인에서 진행되는 이벤트, 세미나 등에서 서면을 통해 개인정보가 수집될 수 있습니다.
        테이스트립와 제휴한 외부 기업이나 단체로부터 개인정보를 제공받을 수 있으며, 이러한 경우에는 개인정보보호법에 따라 제휴사에서 이용자에게 개인정보 제공 동의 등을 받은 후에 테이스트립에 제공합니다.
        기기정보와 같은 생성정보는 PC웹, 모바일 웹/앱 이용 과정에서 자동으로 생성되어 수집될 수 있습니다.
        
        [3. 수집한 개인정보의 이용]
        테이스트립 및 테이스트립 관련 제반 서비스(모바일 웹/앱 포함)의 회원관리, 서비스 개발·제공 및 향상, 안전한 인터넷 이용환경 구축 등 아래의 목적으로만 개인정보를 이용합니다.
        회원 가입 의사의 확인, 연령 확인 및 법정대리인 동의 진행, 이용자 및 법정대리인의 본인 확인, 이용자 식별, 회원탈퇴 의사의 확인 등 회원관리를 위하여 개인정보를 이용합니다.
        콘텐츠 등 기존 서비스 제공(광고 포함)에 더하여, 인구통계학적 분석, 서비스 방문 및 이용기록의 분석, 개인정보 및 관심에 기반한 이용자간 관계의 형성, 지인 및 관심사 등에 기반한 맞춤형 서비스 제공 등 신규 서비스 요소의 발굴 및 기존 서비스 개선 등을 위하여 개인정보를 이용합니다.
        법령 및 테이스트립 이용약관을 위반하는 회원에 대한 이용 제한 조치, 부정 이용 행위를 포함하여 서비스의 원활한 운영에 지장을 주는 행위에 대한 방지 및 제재, 계정도용 및 부정거래 방지, 약관 개정 등의 고지사항 전달, 분쟁조정을 위한 기록 보존, 민원처리 등 이용자 보호 및 서비스 운영을 위하여 개인정보를 이용합니다.
        유료 서비스 제공에 따르는 본인인증, 구매 및 요금 결제, 상품 및 서비스의 배송을 위하여 개인정보를 이용합니다.
        이벤트 정보 및 참여기회 제공, 광고성 정보 제공 등 마케팅 및 프로모션 목적으로 개인정보를 이용합니다.
        서비스 이용기록과 접속 빈도 분석, 서비스 이용에 대한 통계, 서비스 분석 및 통계에 따른 맞춤 서비스 제공 및 광고 게재 등에 개인정보를 이용합니다.
        보안, 프라이버시, 안전 측면에서 이용자가 안심하고 이용할 수 있는 서비스 이용환경 구축을 위해 개인정보를 이용합니다.
        
        [4. 개인정보의 제공 및 위탁]
        테이스트립은 원칙적으로 이용자 동의 없이 개인정보를 외부에 제공하지 않습니다.
        테이스트립은 이용자의 사전 동의 없이 개인정보를 외부에 제공하지 않습니다. 단, 이용자가 외부 제휴사의 서비스를 이용하기 위하여 개인정보 제공에 직접 동의를 한 경우, 그리고 관련 법령에 의거해 테이스트립에 개인정보 제출 의무가 발생한 경우, 이용자의 생명이나 안전에 급박한 위험이 확인되어 이를 해소하기 위한 경우에 한하여 개인정보를 제공하고 있습니다.
    
        개인정보보호법에 따라 테이스트립에 회원가입 신청하시는 분께 수집하는 개인정보의 항목, 개인정보의 수집 및 이용목적, 개인정보의 보유 및 이용기간, 동의 거부권 및 동의 거부 시 불이익에 관한 사항을 안내 드리오니 자세히 읽은 후 동의하여 주시기 바랍니다.
    
        [5. 수집하는 개인정보]
        이용자는 회원가입을 하지 않아도 정보 검색, 뉴스 보기 등 대부분의 테이스트립 서비스를 회원과 동일하게 이용할 수 있습니다. 이용자가 메일, 캘린더, 카페, 블로그 등과 같이 개인화 혹은 회원제 서비스를 이용하기 위해 회원가입을 할 경우, 테이스트립은 서비스 이용을 위해 필요한 최소한의 개인정보를 수집합니다.
    
        회원가입 시점에 테이스트립이 이용자로부터 수집하는 개인정보는 아래와 같습니다.
        - 회원 가입 시에 ‘아이디, 비밀번호, 이름, 생년월일, 성별, 휴대전화번호’를 필수항목으로 수집합니다. 만약 이용자가 입력하는 생년월일이 만14세 미만 아동일 경우에는 법정대리인 정보(법정대리인의 이름, 생년월일, 성별, 중복가입확인정보(DI), 휴대전화번호)를 추가로 수집합니다. 그리고 선택항목으로 이메일 주소를 수집합니다.
        - 단체아이디로 회원가입 시 단체아이디, 비밀번호, 단체이름, 이메일주소, 휴대전화번호를 필수항목으로 수집합니다. 그리고 단체 대표자명을 선택항목으로 수집합니다.
        서비스 이용 과정에서 이용자로부터 수집하는 개인정보는 아래와 같습니다.
        - 회원정보 또는 개별 서비스에서 프로필 정보(별명, 프로필 사진)를 설정할 수 있습니다. 회원정보에 별명을 입력하지 않은 경우에는 마스킹 처리된 아이디가 별명으로 자동 입력됩니다.
    
        - 테이스트립 내의 개별 서비스 이용, 이벤트 응모 및 경품 신청 과정에서 해당 서비스의 이용자에 한해 추가 개인정보 수집이 발생할 수 있습니다. 추가로 개인정보를 수집할 경우에는 해당 개인정보 수집 시점에서 이용자에게 ‘수집하는 개인정보 항목, 개인정보의 수집 및 이용목적, 개인정보의 보관기간’에 대해 안내 드리고 동의를 받습니다.
    
        서비스 이용 과정에서 IP 주소, 쿠키, 서비스 이용 기록, 기기정보, 위치정보가 생성되어 수집될 수 있습니다. 또한 이미지 및 음성을 이용한 검색 서비스 등에서 이미지나 음성이 수집될 수 있습니다.
        구체적으로 1) 서비스 이용 과정에서 이용자에 관한 정보를 자동화된 방법으로 생성하여 이를 저장(수집)하거나,
        2) 이용자 기기의 고유한 정보를 원래의 값을 확인하지 못 하도록 안전하게 변환하여 수집합니다. 서비스 이용 과정에서 위치정보가 수집될 수 있으며,
        테이스트립에서 제공하는 위치기반 서비스에 대해서는 '테이스트립 위치기반서비스 이용약관'에서 자세하게 규정하고 있습니다.
        이와 같이 수집된 정보는 개인정보와의 연계 여부 등에 따라 개인정보에 해당할 수 있고, 개인정보에 해당하지 않을 수도 있습니다.
    
        [6. 수집한 개인정보의 이용]
        테이스트립 및 테이스트립 관련 제반 서비스(모바일 웹/앱 포함)의 회원관리, 서비스 개발・제공 및 향상, 안전한 인터넷 이용환경 구축 등 아래의 목적으로만 개인정보를 이용합니다.
    
        - 회원 가입 의사의 확인, 연령 확인 및 법정대리인 동의 진행, 이용자 및 법정대리인의 본인 확인, 이용자 식별, 회원탈퇴 의사의 확인 등 회원관리를 위하여 개인정보를 이용합니다.
        - 콘텐츠 등 기존 서비스 제공(광고 포함)에 더하여, 인구통계학적 분석, 서비스 방문 및 이용기록의 분석, 개인정보 및 관심에 기반한 이용자간 관계의 형성, 지인 및 관심사 등에 기반한 맞춤형 서비스 제공 등 신규 서비스 요소의 발굴 및 기존 서비스 개선 등을 위하여 개인정보를 이용합니다.
        - 법령 및 테이스트립 이용약관을 위반하는 회원에 대한 이용 제한 조치, 부정 이용 행위를 포함하여 서비스의 원활한 운영에 지장을 주는 행위에 대한 방지 및 제재, 계정도용 및 부정거래 방지, 약관 개정 등의 고지사항 전달, 분쟁조정을 위한 기록 보존, 민원처리 등 이용자 보호 및 서비스 운영을 위하여 개인정보를 이용합니다.
        - 유료 서비스 제공에 따르는 본인인증, 구매 및 요금 결제, 상품 및 서비스의 배송을 위하여 개인정보를 이용합니다.
        - 이벤트 정보 및 참여기회 제공, 광고성 정보 제공 등 마케팅 및 프로모션 목적으로 개인정보를 이용합니다.
        - 서비스 이용기록과 접속 빈도 분석, 서비스 이용에 대한 통계, 서비스 분석 및 통계에 따른 맞춤 서비스 제공 및 광고 게재 등에 개인정보를 이용합니다.
        - 보안, 프라이버시, 안전 측면에서 이용자가 안심하고 이용할 수 있는 서비스 이용환경 구축을 위해 개인정보를 이용합니다.
        3. 개인정보의 보관기간
        회사는 원칙적으로 이용자의 개인정보를 회원 탈퇴 시 지체없이 파기하고 있습니다.
        단, 이용자에게 개인정보 보관기간에 대해 별도의 동의를 얻은 경우, 또는 법령에서 일정 기간 정보보관 의무를 부과하는 경우에는 해당 기간 동안 개인정보를 안전하게 보관합니다.
    
        이용자에게 개인정보 보관기간에 대해 회원가입 시 또는 서비스 가입 시 동의를 얻은 경우는 아래와 같습니다.
        - 부정 가입 및 이용 방지
        부정 이용자의 가입인증 휴대전화번호 또는 DI (만14세 미만의 경우 법정대리인DI) : 탈퇴일로부터 6개월 보관
        탈퇴한 이용자의 휴대전화번호(복호화가 불가능한 일방향 암호화(해시처리)) : 탈퇴일로부터 6개월 보관
        - QR코드 복구 요청 대응
        QR코드 등록 정보:삭제 시점으로부터6개월 보관
        - 스마트플레이스 분쟁 조정 및 고객문의 대응
        휴대전화번호:등록/수정/삭제 요청 시로부터 최대1년
        - 테이스트립 플러스 멤버십 서비스 혜택 중복 제공 방지
        암호화처리(해시처리)한DI :혜택 제공 종료일로부터6개월 보관
        - 지식iN eXpert 재가입 신청 및 부정 이용 방지
        eXpert 서비스 및 eXpert 센터 가입 등록정보 : 신청일로부터 6개월(등록 거절 시, 거절 의사 표시한 날로부터 30일) 보관
        전자상거래 등에서의 소비자 보호에 관한 법률, 전자문서 및 전자거래 기본법, 통신비밀보호법 등 법령에서 일정기간 정보의 보관을 규정하는 경우는 아래와 같습니다. 테이스트립은 이 기간 동안 법령의 규정에 따라 개인정보를 보관하며, 본 정보를 다른 목적으로는 절대 이용하지 않습니다.
        - 전자상거래 등에서 소비자 보호에 관한 법률
        계약 또는 청약철회 등에 관한 기록: 5년 보관
        대금결제 및 재화 등의 공급에 관한 기록: 5년 보관
        소비자의 불만 또는 분쟁처리에 관한 기록: 3년 보관
        - 전자문서 및 전자거래 기본법
        공인전자주소를 통한 전자문서 유통에 관한 기록 : 10년 보관
        - 전자서명 인증 업무
        인증서와 인증 업무에 관한 기록: 인증서 효력 상실일로부터 10년 보관
        - 통신비밀보호법
        로그인 기록: 3개월
    
        참고로 테이스트립은 ‘개인정보 유효기간제’에 따라 1년간 서비스를 이용하지 않은 회원의 개인정보를 별도로 분리 보관하여 관리하고 있습니다.
    
        [7. 개인정보 수집 및 이용 동의를 거부할 권리]
        이용자는 개인정보의 수집 및 이용 동의를 거부할 권리가 있습니다. 회원가입 시 수집하는 최소한의 개인정보, 즉, 필수 항목에 대한 수집 및 이용 동의를 거부하실 경우, 회원가입이 어려울 수 있습니다.
                        </textarea>
                    </div>
                    <div class="check_box disFlex align-center">
                        <i class="check_icon fa-regular fa-circle fa-2x"></i>
                        <span>동의</span>
                        <input type="hidden" id="okCheck_1" class="okCheck" value="no">
                    </div>
                </div>
                <div class="ta_2">
                    <div>
                        <h1>[ 위치기반서비스 이용약관 동의  ]</h1>
                        <textarea spellcheck="false" readonly>
        위치기반서비스 이용약관에 동의하시면, 위치를 활용한 광고 정보 수신 등을 포함하는 네이버 위치기반 서비스를 이용할 수 있습니다.
    
        제 1 조 (목적)
        이 약관은 네이버 주식회사 (이하 “회사”)가 제공하는 위치기반서비스와 관련하여 회사와 개인위치정보주체와의 권리, 의무 및 책임사항, 기타 필요한 사항을 규정함을 목적으로 합니다.
        
        제 2 조 (약관 외 준칙)
        이 약관에 명시되지 않은 사항은 위치정보의 보호 및 이용 등에 관한 법률, 개인정보보호법, 정보통신망 이용촉진 및 정보보호 등에 관한 법률, 전기통신기본법, 전기통신사업법 등 관계법령과 회사의 이용약관 및 개인정보처리방침, 회사가 별도로 정한 지침 등에 의합니다.
        
        제 3 조 (서비스 내용 및 요금)
        ① 회사는 위치정보사업자로부터 위치정보를 전달받아 아래와 같은 위치기반서비스를 제공합니다.
        
        1. GeoTagging 서비스: 게시물 또는 이용자가 저장하는 콘텐츠에 포함된 개인위치정보주체 또는 이동성 있는 기기의 위치정보가 게시물과 함께 저장됩니다. 저장된 위치정보는 별도의 활용없이 보관되거나, 또는 장소를 기반으로 콘텐츠를 분류하거나 검색할 수 있는 기능이 제공될 수도 있습니다.
        2. 위치정보를 활용한 검색결과 및 콘텐츠 제공 : 정보 검색을 요청하거나 개인위치정보주체 또는 이동성 있는 기기의 위치정보를 제공 시 본 위치정보를 이용한 검색결과, 주변결과(맛집, 주변업체, 교통수단 등), 번역결과를 제시합니다.
        3. 이용자 위치를 활용한 광고정보 제공: 검색결과 또는 기타 서비스 이용 과정에서 개인위치정보주체 또는 이동성 있는 기기의 위치를 이용하여 광고소재를 제시합니다.
        4. 이용자 보호 및 부정 이용 방지: 개인위치정보주체 또는 이동성 있는 기기의 위치를 이용하여 권한없는 자의 비정상적인 서비스 이용 시도 등을 차단합니다.
        5. 길 안내 등 생활편의 서비스 제공: 교통정보와 길 안내 등 최적의 경로를 지도로 제공하며, 주변 시설물 찾기, 뉴스/날씨 등 생활정보, 긴급구조 서비스, 주소 자동 입력 등 다양한 운전 및 생활 편의 서비스를 제공합니다.
        ② 제1항 위치기반서비스의 이용요금은 무료입니다.
        제 4 조 (개인위치정보주체의 권리)
        ① 개인위치정보주체는 개인위치정보 수집 범위 및 이용약관의 내용 중 일부 또는 개인위치정보의 이용ㆍ제공 목적, 제공받는 자의 범위 및 위치기반서비스의 일부에 대하여 동의를 유보할 수 있습니다.
        ② 개인위치정보주체는 개인위치정보의 수집ㆍ이용ㆍ제공에 대한 동의의 전부 또는 일부를 철회할 수 있습니다.
        ③ 개인위치정보주체는 언제든지 개인위치정보의 수집ㆍ이용ㆍ제공의 일시적인 중지를 요구할 수 있습니다. 이 경우 회사는 요구를 거절하지 아니하며, 이를 위한 기술적 수단을 갖추고 있습니다
        ④ 개인위치정보주체는 회사에 대하여 아래 자료의 열람 또는 고지를 요구할 수 있고, 당해 자료에 오류가 있는 경우에는 그 정정을 요구할 수 있습니다. 이 경우 회사는 정당한 이유 없이 요구를 거절하지 아니합니다.
        
        1. 개인위치정보주체에 대한 위치정보 수집ㆍ이용ㆍ제공사실 확인자료
        2. 개인위치정보주체의 개인위치정보가 위치정보의 보호 및 이용 등에 관한 법률 또는 다른 법령의 규정에 의하여 제3자에게 제공된 이유 및 내용
        ⑤ 회사는 개인위치정보주체가 동의의 전부 또는 일부를 철회한 경우에는 지체 없이 수집된 개인위치정보 및 위치정보 수집ㆍ이용ㆍ제공사실 확인자료를 파기합니다.단, 동의의 일부를 철회하는 경우에는 철회하는 부분의 개인위치정보 및 위치정보 수집ㆍ이용ㆍ제공사실 확인자료에 한합니다.
        ⑥ 개인위치정보주체는 제1항 내지 제4항의 권리행사를 위하여 이 약관 제13조의 연락처를 이용하여 회사에 요구할 수 있습니다.
        제 5 조 (법정대리인의 권리)
        ① 회사는 만14세 미만 아동으로부터 개인위치정보를 수집ㆍ이용 또는 제공하고자 하는 경우에는 만14세 미만 아동과 그 법정대리인의 동의를 받아야 합니다.
        ② 법정대리인은 만14세 미만 아동의 개인위치정보를 수집ㆍ이용ㆍ제공에 동의하는 경우 동의유보권, 동의철회권 및 일시중지권, 열람ㆍ고지요구권을 행사할 수 있습니다.
        제 6 조 (위치정보 이용·제공사실 확인자료 보유근거 및 보유기간)
        회사는 위치정보의 보호 및 이용 등에 관한 법률 제16조 제2항에 근거하여 개인위치정보주체에 대한 위치정보 수집·이용·제공사실 확인자료를 위치정보시스템에 자동으로 기록하며, 6개월 이상 보관합니다.
        제 7 조 (서비스의 변경 및 중지)
        ① 회사는 위치기반서비스사업자의 정책변경 등과 같이 회사의 제반 사정 또는 법률상의 장애 등으로 서비스를 유지할 수 없는 경우, 서비스의 전부 또는 일부를 제한, 변경하거나 중지할 수 있습니다.
        ② 제1항에 의한 서비스 중단의 경우에는 회사는 사전에 인터넷 등에 공지하거나 개인위치정보주체에게 통지합니다.
        제 8 조 (개인위치정보 제3자 제공 시 즉시 통보)
        ① 회사는 개인위치정보주체의 동의 없이 당해 개인위치정보주체의 개인위치정보를 제3자에게 제공하지 아니하며, 제3자 제공 서비스를 제공하는 경우에는 제공받는 자 및 제공목적을 사전에 개인위치정보주체에게 고지하고 동의를 받습니다.
        ② 회사는 개인위치정보를 개인위치정보주체가 지정하는 제3자에게 제공하는 경우에는 개인위치정보를 수집한 당해 통신단말장치로 매회 개인위치정보주체에게 제공받는 자, 제공일시 및 제공목적을 즉시 통보합니다.
        ③ 다만, 아래에 해당하는 경우에는 개인위치정보주체가 미리 특정하여 지정한 통신단말장치 또는 전자우편주소 등으로 통보합니다.
        
        1.개인위치정보를 수집한 당해 통신단말장치가 문자, 음성 또는 영상의 수신기능을 갖추지 아니한 경우
        2.개인위치정보주체가 개인위치정보를 수집한 당해 통신단말장치 외의 통신단말장치 또는 전자우편주소 등으로 통보할 것을 미리 요청한 경우
        제 9 조 (8세 이하의 아동 등의 보호의무자의 권리)
        ① 회사는 아래의 경우에 해당하는 자(이하 “8세 이하의 아동 등"이라 함)의 보호의무자가 8세 이하의 아동 등의 생명 또는 신체보호를 위하여 개인위치정보의 이용 또는 제공에 동의하는 경우에는 본인의 동의가 있는 것으로 봅니다.
        
        1. 8세 이하의 아동
        2. 피성년후견인
        3. 장애인복지법 제2조제2항제2호의 규정에 의한 정신적 장애를 가진 자로서 장애인고용촉진 및 직업재활법 제2조제2호의 규정에 의한 중증장애인에 해당하는 자(장애인복지법 제32조의 규정에 의하여 장애인등록을 한 자에 한정)
        ② 8세 이하의 아동 등의 생명 또는 신체의 보호를 위하여 개인위치정보의 이용 또는 제공에 동의를 하고자 하는 보호의무자는 서면동의서에 보호의무자임을 증명하는 서면을 첨부하여 회사에 제출하여야 합니다.
        ③ 보호의무자는 8세 이하의 아동 등의 개인위치정보 이용 또는 제공에 동의하는 경우 개인위치정보주체 권리의 전부를 행사할 수 있습니다
        제 10 조 (개인위치정보의 보유목적 및 이용기간)
        ① 회사는 위치기반서비스를 제공하기 위해 필요한 최소한의 기간 동안 개인위치정보를 보유 및 이용합니다.
        ② 회사는 대부분의 위치기반서비스에서 개인위치정보를 일회성 또는 임시로 이용 후 지체없이 파기합니다. 단, ‘GeoTagging’ 서비스와 같이 이용자가 게시물, 콘텐츠와 함께 개인위치정보를 네이버 서비스에 게시 또는 보관하는 경우, 해당 게시물, 콘텐츠의 보관기간 동안 개인위치정보가 함께 보관됩니다.
        제 11 조 (손해배상)
        개인위치정보주체는 회사의 위치정보의 보호 및 이용 등에 관한 법률 제15조 내지 26조의 규정을 위반한 행위로 손해를 입은 경우에 회사에 대하여 손해배상을 청구할 수 있습니다. 이 경우 회사는 고의 또는 과실이 없음을 입증하지 아니하면 책임을 면할 수 없습니다.
        제 12 조 (분쟁의 조정)
        ① 회사는 위치정보와 관련된 분쟁에 대하여 개인위치정보주체와 협의가 이루어지지 아니하거나 협의를 할 수 없는 경우에는 방송통신위원회에 재정을 신청할 수 있습니다.
        ② 회사 또는 개인위치정보주체는 위치정보와 관련된 분쟁에 대해 당사자간 협의가 이루어지지 아니하거나 협의를 할 수 없는 경우에는 개인정보보호법에 따라 개인정보분쟁조정위원회에 조정을 신청할 수 있습니다.
        제 13 조 (사업자 정보 및 위치정보 관리책임자)
        ① 회사의 상호, 주소 및 연락처는 다음과 같습니다.
        
        - 상호: 네이버주식회사
        - 주소: 경기도 성남시 분당구 정자일로 95, NAVER 1784 (우)13561
        - 전화번호: 1588-3820
        ② 회사는 다음과 같이 위치정보 관리책임자를 지정하여 이용자들이 서비스 이용과정에서 발생한 민원사항 처리를 비롯하여 개인위치정보주체의 권리 보호를 위해 힘쓰고 있습니다.
        
        - 위치정보 관리책임자 : 이진규 CPO / DPO (개인정보 보호책임자 겸직)
        - 메일 : 문의하기
        부칙
        제1조 시행일
        2022년 4월 27일부터 시행되던 종전의 약관은 본 약관으로 대체하며, 본 약관은 2022년 5월 18일부터 적용됩니다.
                        </textarea>
                    </div>
                    <div class="check_box disFlex align-center">
                        <i class="check_icon fa-regular fa-circle fa-2x"></i>
                        <span>동의</span>
                        <input type="hidden" id="okCheck_2" class="okCheck" value="no">
                    </div>
                </div>
            </div>
            <!-- STEP_2 -->
            <div id="step_2" class="content_wrap_2">
                <h1>[ 회원 정보 입력 ]</h1>
                <table>
                    <tr>
                        <th>사업자등록번호</th>
                        <td>
                            <input type="text" class="input80" placeholder="000" maxlength="3"> -
                            <input type="text" class="input80" placeholder="00"  maxlength="2"> -
                            <input type="text" class="input100" placeholder="00000"  maxlength="5">
                        </td>
                    </tr>
                    <tr>
                        <th>아이디</th>
                        <td>
                            <input type="text" name="t_id" class="input200">
                            <span></span>
                        </td>
                    </tr>
                    <tr>
                        <th>비밀번호</th>
                        <td><input type="password" name="t_password" class="input300"></td>
                    </tr>
                    <tr>
                        <th>비밀번호 확인</th>
                        <td><input type="password" name="t_password_confirm" class="input300"></td>
                    </tr>
                    <tr class="ma-t">
                        <th>이름</th>
                        <td>
                            <input type="text" name="t_name" class="input200">
                        </td>
                    </tr>
                    <tr>
                        <th>생년월일</th>
                        <td>
                            <input type="text" name="" class="input100" placeholder="년(4자)">
                             <select name="" class="input80">
                                <option value="">월</option>
                             	<%for (int k=1; k<13; k++){ %> 
                             	   <option value="<%=k%>"><%=k %></option>
                                <%}%>
                            </select>
                            <select name="" class="input80">
                                <option value="">월</option>
                                <%for (int k=1; k<32; k++){ %> 
                             	   <option value="<%=k%>"><%=k %></option>
                                <%}%>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <th>성별</th>
                        <td class="gender">
                            <input type="radio" name="t_gender" id="genderM" value="m">
                            <label for="genderM">남자</label>
                            <input type="radio" name="t_gender" id="genderF" value="f">
                            <label for="genderF">여자</label>
                        </td>
                    </tr>
                    <tr>
                        <th>지역</th>
                        <td>
                            <select name="" class="input100">
                                <option value="">=선택=</option>
	                             <c:forEach items="${t_cityDto}" var="dto">
	                             	<option value="${dto.getCommon_code()}">${dto.getCommon_name()}</option>
	                             </c:forEach>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <th>이메일</th>
                        <td>
                            <input type="text" name="t_email" class="input160"> @
                            <select name="" class="input120">
                                <option value="">메일주소</option>
                                <option value="">gmail.com</option>
                                <option value="">naver.com</option>
                                <option value="">daum.net</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <th>휴대전화</th>
                        <td>
                            <input type="text" name="t_tel1" class="input80" value="010"> -
                            <input type="text" name="t_tel2" class="input80"> -
                            <input type="text" name="t_tel3" class="input80">
                        </td>
                    </tr>
                </table>
            </div>
            <!-- STEP_3 -->
            <div id="step_3" class="content_wrap_2 store_info">
                <h1>[ 가게 정보 입력 ]</h1>
                <table>
                    <tr>
                        <th>가게 이름</th>
                        <td>
                            <input type="text" name="t_s_name" class="input300">
                            <span></span>
                        </td>
                    </tr>
                   
                    <tr>
                        <th>가게 주소</th>
                        <td>
                            <select name="" class="city_select">
                               <option value="">=선택=</option>
	                             <c:forEach items="${t_cityDto}" var="dto">
	                             	<option value="${dto.getCommon_code()}">${dto.getCommon_name()}</option>
	                             </c:forEach>
                            </select>
                            <select name="" class="local_select">
                               <option value="">=선택=</option>
	                             <c:forEach items="${t_localDto}" var="dto">
	                             	<option value="${dto.getCommon_code()}">${dto.getCommon_name()}</option>
	                             </c:forEach>
                            </select>
                            <input type="text" name="" class="input300 adr" placeholder="상세주소">
                        </td>
                    </tr>
                    <tr>
                        <th>위치</th>
                        <td>
                            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2272.929423773972!2d127.40670558606149!3d36.326669657773834!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x356549343c3c3cf1%3A0x9d6af658336f953a!2z7KCc7J207JeQ7Iqk7JeY7J247J6s6rCc67Cc7JuQKOyjvCk!5e0!3m2!1sko!2skr!4v1663848169026!5m2!1sko!2skr" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                        </td>
                        
                    </tr>
                    <tr>
                        <th>영업시간</th>
                        <td>
                            <input type="text" class="timepicker input120" placeholder="00:00">
                            ~
                            <input type="text" class="timepicker input120" placeholder="00:00">
                        </td>
                    </tr>
                    <tr>
                        <th>가게 연락처</th>
                        <td>
                            <input type="text" name="" class="input100"> -
                            <input type="text" name="" class="input100"> -
                            <input type="text" name="" class="input100">
                        </td>
                    </tr>
                    <tr>
                        <th>가게 사진</th>
                        <td>
                            <div id='image_preview'>
                                <input type='file' id='btnAtt' multiple='multiple' />
                                <div id='att_zone' data-placeholder='원하시는 이미지를 드래그 또는 추가해주세요.(최대 5개)'></div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th>가게 설명</th>
                        <td>
                            <textarea name="" id="" placeholder="최대1000자"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <th>메뉴 종류</th>
                        <td>
                            <select name="">
                                <option value="">= 선택 =</option>
                                <option value="">보쌈/족발</option>
                                <option value="">한식</option>
                                <option value="">양식</option>
                                <option value="">일식</option>
                                <option value="">국수/면</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <th>대표 메뉴</th>
                        <td>
                            <ul class="menu_write">
                                <li>
                                    <input type="text" placeholder="1. 메뉴명(최소 한개)">
                                    <input type="text" placeholder="가격">
                                </li>
                                <li>
                                    <input type="text" placeholder="2. 메뉴명">
                                    <input type="text" placeholder="가격">
                                </li>
                                <li>
                                    <input type="text" placeholder="3. 메뉴명">
                                    <input type="text" placeholder="가격">
                                </li>
                                <li>
                                    <input type="text" placeholder="4. 메뉴명">
                                    <input type="text" placeholder="가격">
                                </li>
                                <li>
                                    <input type="text" placeholder="5. 메뉴명">
                                    <input type="text" placeholder="가격">
                                </li>
                            </ul>
                        </td>
                    </tr>
                    <tr>
                        <th>상세조건</th>
                        <td>
                            <div class="theme_box">
                                <ul class="control-group">
                                    <li>
                                        <label class="control control-checkbox">
                                            혼밥
                                            <input type="checkbox" name="theme" value="">
                                            <div class="control_indicator"></div>
                                        </label>
                                    </li>
                                    <li>
                                        <label class="control control-checkbox">
                                            인스타감성
                                            <input type="checkbox" name="theme" value="">
                                            <div class="control_indicator"></div>
                                        </label>
                                    </li>
                                    <li>
                                        <label class="control control-checkbox">
                                            튀김
                                            <input type="checkbox" name="theme" value="">
                                            <div class="control_indicator"></div>
                                        </label>
                                    </li>
                                    <li>
                                        <label class="control control-checkbox">
                                            국수/면
                                            <input type="checkbox" name="theme" value="">
                                            <div class="control_indicator"></div>
                                        </label>
                                    </li>
                                    <li>
                                        <label class="control control-checkbox">
                                            비 오는 날
                                            <input type="checkbox" name="theme" value="">
                                            <div class="control_indicator"></div>
                                        </label>
                                    </li>
                                    <li>
                                        <label class="control control-checkbox">
                                            든든한 한끼
                                            <input type="checkbox" name="theme" value="">
                                            <div class="control_indicator"></div>
                                        </label>
                                    </li>
                                    <li>
                                        <label class="control control-checkbox">
                                            매운
                                            <input type="checkbox" name="theme" value="">
                                            <div class="control_indicator"></div>
                                        </label>
                                    </li>
                                    <li>
                                        <label class="control control-checkbox">
                                            브런치
                                            <input type="checkbox" name="theme" value="">
                                            <div class="control_indicator"></div>
                                        </label>
                                    </li>
                                    <li>
                                        <label class="control control-checkbox">
                                            다이어트
                                            <input type="checkbox" name="theme" value="">
                                            <div class="control_indicator"></div>
                                        </label>
                                    </li>
                                    <li>
                                        <label class="control control-checkbox">
                                            데이트
                                            <input type="checkbox" name="theme" value="">
                                            <div class="control_indicator"></div>
                                        </label>
                                    </li>
                                    <li>
                                        <label class="control control-checkbox">
                                            해물요리
                                            <input type="checkbox" name="theme" value="">
                                            <div class="control_indicator"></div>
                                        </label>
                                    </li>
                                    <li>
                                        <label class="control control-checkbox">
                                            달콤
                                            <input type="checkbox" name="theme" value="">
                                            <div class="control_indicator"></div>
                                        </label>
                                    </li>
                                    <li>
                                        <label class="control control-checkbox">
                                            프레쉬
                                            <input type="checkbox" name="theme" value="">
                                            <div class="control_indicator"></div>
                                        </label>
                                    </li>
                                    <li>
                                        <label class="control control-checkbox">
                                            볶음
                                            <input type="checkbox" name="theme" value="">
                                            <div class="control_indicator"></div>
                                        </label>
                                    </li>
                                    <li>
                                        <label class="control control-checkbox">
                                            밥도둑
                                            <input type="checkbox" name="theme" value="">
                                            <div class="control_indicator"></div>
                                        </label>
                                    </li>
                                    <li>
                                        <label class="control control-checkbox">
                                            해장
                                            <input type="checkbox" name="theme" value="">
                                            <div class="control_indicator"></div>
                                        </label>
                                    </li>
                                    <li>
                                        <label class="control control-checkbox">
                                            아이동반
                                            <input type="checkbox" name="theme" value="">
                                            <div class="control_indicator"></div>
                                        </label>
                                    </li>
                                    <li>
                                        <label class="control control-checkbox">
                                            오마카세
                                            <input type="checkbox" name="theme" value="">
                                            <div class="control_indicator"></div>
                                        </label>
                                    </li>
                                    <li>
                                        <label class="control control-checkbox">
                                            제철
                                            <input type="checkbox" name="theme" value="">
                                            <div class="control_indicator"></div>
                                        </label>
                                    </li>
                                    <li>
                                        <label class="control control-checkbox">
                                            이열치열
                                            <input type="checkbox" name="theme" value="">
                                            <div class="control_indicator"></div>
                                        </label>
                                    </li>
                                    <li>
                                        <label class="control control-checkbox">
                                            집밥
                                            <input type="checkbox" name="theme" value="">
                                            <div class="control_indicator"></div>
                                        </label>
                                    </li>
                                    <li>
                                        <label class="control control-checkbox">
                                            회식
                                            <input type="checkbox" name="theme" value="">
                                            <div class="control_indicator"></div>
                                        </label>
                                    </li>
                                    <li>
                                        <label class="control control-checkbox">
                                            무한리필
                                            <input type="checkbox" name="theme" value="">
                                            <div class="control_indicator"></div>
                                        </label>
                                    </li>
                                    <li>
                                        <label class="control control-checkbox">
                                            단체예약가능
                                            <input type="checkbox" name="theme" value="">
                                            <div class="control_indicator"></div>
                                        </label>
                                    </li>
                                    <li>
                                        <label class="control control-checkbox">
                                            몸보신
                                            <input type="checkbox" name="theme" value="">
                                            <div class="control_indicator"></div>
                                        </label>
                                    </li>
                                    <li>
                                        <label class="control control-checkbox">
                                            선술집
                                            <input type="checkbox" name="theme" value="">
                                            <div class="control_indicator"></div>
                                        </label>
                                    </li>
                                    <li>
                                        <label class="control control-checkbox">
                                            노키즈존
                                            <input type="checkbox" name="theme" value="">
                                            <div class="control_indicator"></div>
                                        </label>
                                    </li>
                                </ul>
                            </div>
                        </td>
                    </tr>    
                </table>
            </div>
            <script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
            <script>
                $('.timepicker').timepicker({
                    timeFormat: 'HH:mm',
                    interval: 30,
                    startTime: '00:00',
                    dynamic: false,
                    dropdown: true,
                    scrollbar: true
                });
            </script>
            <!-- STEP_4 -->
            <div id="step_4" class="store_info">
                <h1>[ 입력 정보 확인 ]</h1>
                <table>
                    <tr>
                        <th>아이디</th>
                        <td>
                            aaa1234
                        </td>
                    </tr>
                    <tr class="ma-t">
                        <th>이름</th>
                        <td>
                            이지환
                        </td>
                    </tr>
                    <tr>
                        <th>생년월일</th>
                        <td>
                            1997-01-01
                        </td>
                    </tr>
                    <tr>
                        <th>성별</th>
                        <td class="gender">
                            남자
                        </td>
                    </tr>
                    <tr>
                        <th>지역</th>
                        <td>대전</td>
                    </tr>
                    <tr>
                        <th>이메일</th>
                        <td>
                            aaa1234@gmail.com
                        </td>
                    </tr>
                    <tr>
                        <th>휴대전화</th>
                        <td>
                            010 - 1234 - 1455
                        </td>
                    </tr>
                </table>
                <table class="step_4_store_tbl">
                    <tr>
                        <th>가게 이름</th>
                        <td>
                            공주칼국수
                        </td>
                    </tr>
                   
                    <tr>
                        <th>가게 주소</th>
                        <td>
                            대전 서구 괴정동 48-16
                        </td>
                    </tr>
                    <tr>
                        <th>영업시간</th>
                        <td>
                            10:30 ~ 23:00
                        </td>
                    </tr>
                    <tr>
                        <th>가게 연락처</th>
                        <td>
                            042-527-9401
                        </td>
                    </tr>
                    <tr>
                        <th>대표 메뉴</th>
                        <td>
                            <ul class="menu_write">
                                <li>
                                    얼큰이칼국수
                                    <span>7,000원</span>
                                </li>
                                <li>
                                    쭈꾸미 2인분
                                    <span>16,000원</span>
                                </li>
                                <li>
                                    쭈꾸미 3인분
                                    <span>32,000원</span>
                                </li>
                                <li>
                                    바지락칼국수
                                    <span>7,000원</span>
                                </li>
                                <li>
                                    두부두루치기
                                    <span>12,000원</span>
                                </li>
                            </ul>
                        </td>
                    </tr>
                    <tr>
                        <th>가게 사진</th>
                        <td>
                            <div id='image_preview_step4'>
                                <img src="../images/post/review/buchimgae.jpg" alt="">
                                <img src="../images/post/review/r2.jpg" alt="">
                                <img src="../images/sec_2/bab.jpg" alt="">
                                <img src="../images/list/list_1.png" alt="">
                                <img src="../images/post/review/buchimgae.jpg" alt="">
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th>가게 설명</th>
                        <td class="s_content_text">
                            세트 메뉴 주문 시 소주 한병 지급 행사중!!
                            @맛있는 고기집 잘 찾았다! 칭찬 받는@숙성고기 전문점 대전맛집 입니다
                            좋은 고기를 숙성하여 고기 맛이 깊어지는 맛! 부위별 다른 식감을 즐기는 재미
                            (막창, 맛고기,삼겹살,오겹살,갈매기살,항정살,제주고기,소고기)
                            대전 맛집만의 고기맛과 식감을 함께 느껴보세요
                            단체를 위한 14개 테이블에 50명 이상 충분히 수용 가능합니다. 후회 없는 선택 대전맛집 입니다^^
                        </td>
                    </tr>
                    <tr>
                        <th>메뉴 종류</th>
                        <td>
                            한식
                        </td>
                    </tr>
                    <tr>
                        <th>상세조건</th>
                        <td>
                            <div class="theme_box">
                                <ul class="control-group">
                                    <li>
                                        <label class="control control-checkbox">
                                            혼밥
                                            <input type="checkbox" name="theme" value="" checked>
                                            <div class="control_indicator"></div>
                                        </label>
                                    </li>
                                    <li>
                                        <label class="control control-checkbox">
                                            인스타감성
                                            <input type="checkbox" name="theme" value="" checked>
                                            <div class="control_indicator"></div>
                                        </label>
                                    </li>
                                    <li>
                                        <label class="control control-checkbox">
                                            튀김
                                            <input type="checkbox" name="theme" value="" checked>
                                            <div class="control_indicator"></div>
                                        </label>
                                    </li>
                                </ul>
                            </div>
                        </td>
                    </tr>    
                    <tr class="step_4_map">
                        <td>
                            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2272.929423773972!2d127.40670558606149!3d36.326669657773834!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x356549343c3c3cf1%3A0x9d6af658336f953a!2z7KCc7J207JeQ7Iqk7JeY7J247J6s6rCc67Cc7JuQKOyjvCk!5e0!3m2!1sko!2skr!4v1663848169026!5m2!1sko!2skr" width="400" height="300" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="btn_box disFlex align-center">
                <button class="back_btn" onclick="goBackStep(document.getElementById('now_step').value)">이전</button>
                <button class="next_btn" onclick="goNextStep(document.getElementById('now_step').value)">다음 단계로 <i class="fa-solid fa-angles-right"></i></button>
                <input type="hidden" id="now_step" value="1">
            </div>
        </div>
    </div>
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
            }  
            
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
            return div
            }
          }
         )('att_zone', 'btnAtt')
    </script>
   <!-- FOOTER -->
   <%@ include file="/common_footer.jsp" %>
    <!-- /FOOTER END -->
</body>
</html>