(function ($) {
  $(function () {
    $('nav ul li a').mouseover(function () {
      $(this).siblings('li ul').addClass('hover');

      $(this).parent().hover(
        function () {},
        function () {
          $(this).children('ul').removeClass('hover');
        })
      },
      function () {
      });
    
    $(".slider").jCarouselLite({
      auto: 1,
      speed: 1800,
      visible: 4,
      btnNext: ".arrow_right",
      btnPrev: ".arrow_left"
    });

    $(".news_ticker").jCarouselLite({
      vertical: true,
      auto: 1,
      speed: 1000,
      visible: 10
    });

    // Organisation, employees slider
    $(".slider ul.employees li img").hover(function() {
      $(".employees_info").show();
    }, function() {
      $(".employees_info").hide();
    });
    
    // Organisation_box
    $(".organisation_box ul li").hover(function() {
      $(".employees_info").show();
    }, function() {
      $(".employees_info").hide();
    });

  });
})(jQuery);

  
