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
    <script src="../js/common.js"></script>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="https://kit.fontawesome.com/17da812ad5.js" crossorigin="anonymous"></script>
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
            if(goToStep=='3'){
                NextBtn.innerHTML='회원 등록';
            }else{
                NextBtn.innerHTML='다음 단계로 <i class="fa-solid fa-angles-right"></i>';
            }

        }

        //다음단계로
        function goNextStep(nowStepValue){
            /*nowStepValue : 현재페이지*/
            
            if(nowStepValue=='1'){
                if(document.getElementById('okCheck').value=="no"){
                    alert('개인정보 이용약관에 동의해주세요.');
                    return;
                }
            }
            
            if(nowStepValue=='2'){
                if(memberjoin.t_id.value==''){
                    alert('아이디를 입력해주세요.');
                    memberjoin.t_id.focus();
                    return;
                }
            }

            if(nowStepValue=='3'){
                alert('회원가입되었습니다.');
                return;
            }

            sectionChange(nowStepValue,Number(nowStepValue)+1);
    
        }

        //이전버튼
        function goBackStep(nowStepValue){
            sectionChange(nowStepValue,Number(nowStepValue)-1);
        }

    </script>
</head>
<body>
    <%@ include file="/common_loginHeader.jsp" %>
    <div id="jform_wrap">
        <div class="top_title">
            <h1><b>회원 가입</b><br><span>[</span> 일반 회원 <span>]</span></h1>
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
                    <img src="../images/join/f_i5.png" alt="">
                    <p>STEP 3</p>
                    <p>입력정보 확인</p>
                </div>
            </div>
        </div>
        <div id="stepChange_wrap">
            <!-- STEP_1 -->
            <div id="step_1" class="content_wrap_1">
                <div class="ta_2">
                    <div>
                        <h1>[ 개인정보 수집 및 이용 ]</h1>
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
                        <input type="hidden" id="okCheck" name="okCheck" value="no">
                    </div>
                </div>
                <!-- 동의버튼 클릭 -->
                <script>
                    $(document).ready(function(){
                        $('.check_box').click(function(){
                            $('.check_icon').toggleClass('fa-regular');
                            $('.check_icon').toggleClass('fa-circle');
                            $('.check_icon').toggleClass('fa-solid');
                            $('.check_icon').toggleClass('fa-circle-check');
    
                            if($('.check_icon').hasClass('fa-circle')){
                                $('#okCheck').val("no");
                            };
                            if($('.check_icon').hasClass('fa-circle-check')){
                                $('#okCheck').val("ok");
                            };
                        });
                    });
                </script>
            </div>
            <!-- STEP_2 -->
            <form name="memberjoin">
            <div id="step_2" class="content_wrap_2">
                <h1>[ 회원 정보 입력 ]</h1>
                <table>
                    <tr>
                        <th>아이디</th>
                        <td>
                            <input type="text" name="t_id" class="input200" id="id2">
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
                                <option value="">1</option>
                                <option value="">2</option>
                                <option value="">3</option>
                                <option value="">4</option>
                                <option value="">5</option>
                                <option value="">6</option>
                                <option value="">7</option>
                                <option value="">8</option>
                                <option value="">9</option>
                                <option value="">10</option>
                                <option value="">11</option>
                                <option value="">12</option>
                            </select>
                            <select name="" class="input80">
                                <option value="">월</option>
                                <option value="">1</option>
                                <option value="">2</option>
                                <option value="">3</option>
                                <option value="">29</option>
                                <option value="">30</option>
                                <option value="">31</option>
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
                                <option value="">서울</option>
                                <option value="">부산</option>
                                <option value="">대전</option>
                                <option value="">제주</option>
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
                <table>
                    <tr>
                        <th>프로필사진</th>
                        <td>
                            <div class="pf_photo">
                                <img src="../images/post/review/default_profile.png" alt="" id="prvImage">
                            </div>
                            <label for="fileInput">
                                <div class="btn-upload">사진 선택</div>
                            </label>
                            <input type="file" name="t_photo" id="fileInput">
                        </td>
                    </tr>

                    <tr>
                        <th>닉네임</th>
                        <td><input type="text" name="t_nickname" class="input200"></td>
                    </tr>
                </table>
            </div>
            </form>
            <script type="text/javascript">
            	$(function(){
            		$()
            		
            	})
            </script>
            <!-- STEP_3 -->
            <div id="step_3" class="content_wrap_2">
                <h1>[ 입력 정보 확인 ]</h1>
                <table>
                    <tr>
                        <th colspan="2" style="text-align: center;" class="before_none">
                            <div class="pf_photo" style="margin: auto;">
                                <img src="../images/post/review/default_profile.png" alt="" id="prvImage">
                            </div>
                            <br>
                            <span  style="font-size: 20px;">푸드파이터</span>
                        </th>
                    </tr>
                </table>
                <br>
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

            </div>
        </div>
        <div class="btn_box disFlex align-center">
            <button class="back_btn" onclick="goBackStep(document.getElementById('now_step').value)">이전</button>
            <button class="next_btn" onclick="goNextStep(document.getElementById('now_step').value)">다음 단계로 <i class="fa-solid fa-angles-right"></i></button>
            <input type="hidden" id="now_step" value="1">
        </div>
    </div>
    <!-- 프로필사진 바로 보여주기 -->
    <script type="text/javascript">
        $(function(){               
            function readImage(input) {
                // 인풋 태그에 파일이 있는 경우
                if(input.files && input.files[0]) {
                    // FileReader 인스턴스 생성
                    const reader = new FileReader()
                    // 이미지가 로드가 된 경우
                    reader.onload = e => {
                        const previewImage = document.getElementById("prvImage");
                        previewImage.src = e.target.result;
                    }
                    // reader가 이미지 읽도록 하기
                    reader.readAsDataURL(input.files[0]);
                }
                else {
                    // 이미지 안올렸으면
                    $("#prvImage").attr('src','../images/post/review/default_profile.png');
                }
            }
            // input file에 change 이벤트 부여
            const inputImage = document.getElementById("fileInput");
            inputImage.addEventListener("change", e => {
                $("#prvImage").css("display","block");
                readImage(e.target)
            })   
        });   
    </script>
   <!-- FOOTER -->
   <footer>
    <div id="footer_inner" class="disFlex justify-space-between">
        <div class="logo"><img src="../images/logo_design_4.png" alt=""></div>
        <div>
            <ul class="footer_ul_2 disFlex">
                <li><a href="">개인정보이용약관</a></li>
                <li>|</li>
                <li><a href="">고객센터</a></li>
                <li>|</li>
                <li><a href="">1:1 문의</a></li>
                <li>|</li>
                <li><a href="">서비스 소개</a></li>
                <li>|</li>
                <li><a href="">광고 및 제휴</a></li>
            </ul>
            <p>
                ㈜ 테이스트립  대표이사: 문보미<br>
                서울특별시 강남구 봉은사로 479, 479타워 11층  사업자 등록번호: 742-86-00224<br>
                통신판매업 신고번호: 2017-서울강남-01779 고객센터 042-223-0830
            </p>
            <p>
                © 2022 Tastrip Co., Ltd. All rights reserved.
            </p>
        </div>
        <div class="sns">
            <i class="fa-brands fa-square-facebook fa-2x"></i>
            <i class="fa-brands fa-square-instagram fa-2x"></i>
            <i class="fa-brands fa-square-twitter fa-2x"></i>
        </div>
    </div>
</footer>
<!-- /FOOTER END -->
</body>
</html>