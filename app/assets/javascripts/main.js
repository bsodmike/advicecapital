(function ($) {
  $(function () {

    function fixHeight() {
      var height = $(window).height();
      var setHeight;
      var wrapper = $('#wrapper');
      var mainContent = $('#main_content');
      var minHeight = 'min-height';

      if (height < 900 || height == 900) {
        wrapper.css(minHeight, 800);
        console.log('height: ' + height + 'px');
      }
      else if (height > 900 && height < 1000) {
        wrapper.css(minHeight, 800);
        console.log('height: ' + height + 'px');
      }
      else if (height > 1000 && height < 1200) { // OPTIMIZED FOR 1600x1200 SCREEN
        wrapper.css(minHeight, 940);
        mainContent.css(minHeight, 840);
        console.log('height: ' + height + 'px - ' + 'wrapper: ' + wrapper + "px - " + "mainContent: " + mainContent + "px");
      }
      else if (height > 1200 && height < 1400) {
        wrapper.css(minHeight, 1000);
        console.log('height: ' + height + 'px');
      }
      else if (height > 1400 && height < 1600) {
        wrapper.css(minHeight, 1000);
        console.log('height: ' + height + 'px');
      }
    }
    function fixHeaderElementPosition() {
      var logo = $('#logo');
      var logoText = $('#logo_text');
      var genericMenu = $('ul#generic');
      var adminMenu = $('.admin_box');

      var width = $(window).width();

      if (width <= 1280) {
        genericMenu.css('right', '300px');

        adminMenu.css({
          "width" : "60px",
          "height" : "auto",
          "margin" : "10px 0 10px 5px",
          "padding" : "4px 0 4px 4px",
          "top" : "140px",
          "font-size" : "10px"
        });
        adminMenu.find("ul")
          .css({
            "margin" : "0",
            "padding" : "0"
          });
        adminMenu.find("div:nth-child(2)")
          .css({
            "float" : "left",
            "margin" : "0",
            "padding" : "0"
          });
        adminMenu.find("a")
          .css("color", "#000");

        console.log('width: ' + width + 'px' + adminMenu);
      }  
    }

    fixHeight();
    fixHeaderElementPosition();

    $('nav ul li a').mouseover(function () {
      $(this).siblings('li ul').addClass('hover');

      $(this).parent().hover(function () {
        $(this).children('ul').removeClass('hover');
      });
    });

    $('#flash').delay(500).fadeIn('normal', function() {
      $(this).delay(2500).fadeOut();
    });

    $('.date_select').datepicker();

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

    $("a[rel=fancybox]").fancybox({
      overlayShow: true,
      frameWidth:640,
      frameHeight:360
    });

    $("a.employee_image_popup").fancybox();
    
    $(".slider_custom").jCarouselLite({
      auto: 1,
      speed: 3000,
      visible: 6
    });

    $("#stocks").jCarouselLite({
      auto: 1,
      speed: 2000
    });

    $("#news_feed").jCarouselLite({
      vertical: true,
      auto: 1,
      visible: 3,
      start: 0,
      speed: 5000,
      beforeStart: function(a) {
        $(a).parent().fadeTo(800, 0);
      },
      afterEnd: function(a) {
        $(a).parent().fadeTo(800, 1);
      }
    });

    $("#employees_slider ul").roundabout({
      autoplay: true,
      autoplayDuration: 3000,
      autoplayPauseOnHover: true
    });

    $("#employees_slider ul#employee_images li img").hover(function() {
      $(".employees_info").show();
    }, function () {
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

  
