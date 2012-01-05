(function ($) {
  $(function () {
    $('nav ul li a').mouseover(function () {
      $(this).siblings('li ul').addClass('hover');

      $(this).parent().hover(function () {
        $(this).children('ul').removeClass('hover');
      });
    });

    $('#flash').delay(500).fadeIn('normal', function() {
      $(this).delay(2500).fadeOut();
    });

    $('#investor_entry_date').datepicker();

    tinyMCE.init({
        mode : "textareas",
        theme: "advanced",

        theme_advanced_buttons1 : "bold,italic,underline,|,justifyleft,justifycenter,justifyright,fontselect,fontsizeselect,formatselect",
        theme_advanced_buttons2 : "cut,copy,paste,|,bullist,numlist,|,outdent,indent,|,undo,redo,|,link,unlink,anchor,image,|,code,preview,|,forecolor,backcolor",
        theme_advanced_buttons3 : "insertdate,inserttime,|,removeformat,|,sub,sup",
        theme_advanced_toolbar_location : "top",
        theme_advanced_toolbar_align : "left",
        theme_advanced_statusbar_location : "bottom",
        theme_advanced_resizing : true,

        skin : "o2k7",
        skin_variant : "silver"
    });
    
    $(".slider_custom").jCarouselLite({
      auto: 1,
      speed: 3000,
      visible: 6
    });

    $("#stocks").jCarouselLite({
      auto: 1,
      speed: 2000
    });


    $("#slider").CloudCarousel({
      xPos: 128,
      yPos: 32,
      autoRotate: 'yes'
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

  
