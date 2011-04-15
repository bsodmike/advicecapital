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
		})
	});
  $(".carousel").jCarouselLite({
      auto: 1,
      visible: 5,
      btnNext: "#arrow_right",
      btnPrev: "#arrow_left"
  });
})(jQuery);

  
