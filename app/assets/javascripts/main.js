(function ($) {
  $(function () {
    $('nav ul li a').mouseover(function () {
      $(this).siblings('li ul').addClass('hover');

      $(this).parent().hover(function () {
        $(this).children('ul').removeClass('hover');
      });
    });
    
    // $(".slider_custom").jCarouselLite({
    //   auto: 1,
    //   speed: 3000,
    //   visible: 6
    // });
    // 
    // $(".news_ticker").jCarouselLite({
    //   vertical: true,
    //   auto: 1,
    //   speed: 3000,
    //   visible: 10
    // });


    $("#stocks").jCarouselLite({
    auto: 1,
    speed: 2000
    });

    $("#slider").nivoSlider({
      effect: 'sliceUp',
      pauseOnHover: true,
      slices: 20,
      animSpeed: 300,
      pauseTime: 300,
      startSlide: 0,
      captionOpacity: 0.8,
      manualAdvance: false

    });

    // Organisation, employees slider
    $(".slider_custom ul.employees li img").hover(function() {
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
    
	  var getId = function (self) {
		return self.attr('id').replace(/(image|employee)_/, '');
	  };

    // Organisation Info
    $(".employee_names li, .employee_images li").hover(function () {
      var self = $(this);    
      var id = getId(self);
      
        $('#info_' + id).css({display: 'block'});
    }, function () {
      var self = $(this);
      var id = getId(self);

        $('#info_' + id).css({display: 'none'});
	});
  });
})(jQuery);

  
