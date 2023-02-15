$( document ).ready( function() {
    // 사이드 리모콘 메뉴
    var sideBottom = $(window).height()-$("#right_wrap").offset().top+ $("#right_wrap").outerHeight();
    var leftBottom = $(window).height()-$("#left_wrap").offset().top+ $("#left_wrap").outerHeight();
    var sideOffset = $( '#right_wrap' ).offset();
    $( window ).scroll( function() {
        SideScroll();
    });

    if($(window).resize(function(){
        sideOffset = $( '#right_wrap' ).offset();
        leftBottom = $(window).height()-$("#left_wrap").offset().top+ $("#left_wrap").outerHeight();
        sideBottom = $(window).height()-$("#right_wrap").offset().top+ $("#right_wrap").outerHeight();
        SideScroll();
    }));
    
    function SideScroll(){
        var scrollBottom = $(document).height() - $(window).height() - $(window).scrollTop();
        if ( $( document ).scrollTop() > sideOffset.top-30) {
          $( '#right_wrap' ).addClass( 'side_fixed' );
          $( '.side_fixed' ).css('left',sideOffset.left);
          $( '#right_wrap' ).css('top','');
          if(leftBottom>scrollBottom+sideBottom+40){
              $( '#right_wrap' ).removeClass( 'side_fixed' );
              $( '#right_wrap' ).css('top',$('#left_wrap').outerHeight()-$('#right_wrap').outerHeight());
              $( '#right_wrap' ).css('left','');
          }else{
              $( '#right_wrap' ).addClass( 'side_fixed' );
              $( '.side_fixed' ).css('left',sideOffset.left);
              $( '#right_wrap' ).css('top','');
          }
      }else {
          $( '#right_wrap' ).removeClass( 'side_fixed' );
          $( '#right_wrap' ).css('left','');
      }
     
    }

    //체크박스 슬라이드
    $(document).click(function(e){
        if($(e.target).hasClass('search_3')){
            $('.theme_box').slideDown(600);
        }else if(!$(e.target).parents().hasClass('search_li')){
            $('.theme_box').slideUp(600);
        }
    })

/*
    //체크박스 갯수 제한
    $("input[type='checkbox']").on("click",function(){
        let count = $("input:checked[type='checkbox']").length;

        if(count>3){
            $(this).prop("checked",false);
            alert('키워드는 최대 3개까지 선택 가능합니다.');
        }
    });
*/

    // 스크롤 TOP 버튼
    $( window ).scroll( function() {
        if ( $( this ).scrollTop() > 200 ) {
            $( '.top' ).fadeIn();
        } else {
            $( '.top' ).fadeOut();
        }
    });

    $( '.top' ).click( function() {
        $( 'html, body' ).animate( { scrollTop : 0 }, 400 );
        return false;
    });

   
});

