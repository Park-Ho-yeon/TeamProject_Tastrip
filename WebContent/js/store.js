$(document).ready(function(){
    //스토어 탭메뉴
    $('.tab_wrap>li').click(function(){
        $('.tab_wrap>li').removeClass('tab_on');
        $(this).addClass('tab_on');
    });
/*
    //관심가게 하트
    $('.fa-heart').not('.no_click').click(function(){
        if($(this).hasClass('fa-regular')){
            $(this).addClass('fa-solid');
            $(this).removeClass('fa-regular');
        }else{
            $(this).addClass('fa-regular');
            $(this).removeClass('fa-solid');
        }
    });
*/
    // 아코디언 메뉴
    $('.left_menu>li>p').click(function(){
        $(this).siblings('.submenu').stop().slideToggle(600);
        $(this).find('.i_arrow').toggleClass('fa-chevron-down');
        $(this).find('.i_arrow').toggleClass('fa-chevron-up');
    });

});