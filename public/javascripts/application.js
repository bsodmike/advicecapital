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
})(jQuery);
