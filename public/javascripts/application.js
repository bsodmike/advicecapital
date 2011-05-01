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
    $("#slider").jCarouselLite({
      auto: 1,
      speed: 1800,
      visible: 2,
      btnNext: ".arrow_right",
      btnPrev: ".arrow_left"
    });
	});
})(jQuery);

  
