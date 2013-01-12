(function ($) {
  $(function () {

    function fixElementPosition() {
      var logo = $('#logo');
      var logoText = $('#logo_text');
      var genericMenu = $('ul#generic');
      var adminMenu = $('.admin_box');
      var subPages = $('.sub_pages');
      var investorBox = $('.investor_box');
      var organisationBox = $('.organisation_box');

      var width = $(window).width();

      if (width <= 1366) {
        genericMenu.css('right', '380px');

        adminMenu.css({
          "width" : "130px",
          "height" : "auto",
          "margin" : "6px 0 10px 5px",
          "padding" : "4px",
          "font-size" : "10px"
        });
        adminMenu.find("ul")
          .css({
            "margin" : "0",
            "padding" : "0"
          });

        subPages.css({
          "width" : "140px",
          "margin" : "10px 0 10px 0"
        });
        subPages.find(".head")
          .css({
            "width" : "140px"
          });
        subPages.find(".head h3")
          .css({
            "font-size" : "14px",
            "margin" : "8px 0 0 0",
            "word-wrap" : "break-word",
            "word-break" : "normal",
            "white-space" : "normal"
          });
        subPages.find(".content div")
          .css({
            "width" : "130px"
          });
        subPages.find(".content a")
          .css({
            "font-size" : "10px",
            "word-wrap" : "break-word",
            "word-break" : "normal",
            "white-space" : "normal"
          });
        organisationBox.css({
          "width" : "100px",
          "margin" : "10px 0 10px 0"
        });
        organisationBox.find("ul li")
          .css({
            "font-size" : "12px"
          });
        //investorBox.find("ul li")
          //.css({
            //"font-size" : "8px"
         // });
      }

      if (width <= 1280) {
        genericMenu.css('right', '400px');

        adminMenu.css({
          "width" : "60px",
          "height" : "auto",
          "margin" : "10px 0 10px 5px",
          "padding" : "4px 0 0 4px",
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

        subPages.css({
          "width" : "100px",
          "margin" : "10px 0 10px 0"
        });
        subPages.find(".head")
          .css({
            "width" : "96px"
          });
        subPages.find(".head h3")
          .css({
            "font-size" : "12px",
            "margin" : "none",
            "word-wrap" : "break-word",
            "word-break" : "normal",
            "white-space" : "normal"
          });
        subPages.find(".content div")
          .css({
            "width" : "80px"
          });
        subPages.find(".content a")
          .css({
            "font-size" : "10px",
            "word-wrap" : "break-word",
            "word-break" : "normal",
            "white-space" : "normal"
          });
        organisationBox.css({
          "width" : "100px",
          "margin" : "10px 0 10px 0"
        });
        organisationBox.find("ul li")
          .css({
            "font-size" : "12px"
          });
        //investorBox.find("ul li")
          //.css({
            //"font-size" : "8px"
         // });

      }  
    }
    fixElementPosition();

    $('nav ul li a').mouseover(function () {
      $(this).siblings('li ul').addClass('hover');

      $(this).parent().hover(function () {
        $(this).children('ul').removeClass('hover');
      });
    });

    $('#flash').delay(500).fadeIn('normal', function() {
      $(this).delay(2500).fadeOut();
    });

    $('.date_select').datepicker({
      dateFormat: "dd-mm-yy"
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
      visible: 5,
      start: 0,
      speed: 5000,
      beforeStart: function(a) {
        $(a).parent().fadeTo(1000, 0);
      },
      afterEnd: function(a) {
        $(a).parent().fadeTo(1000, 1);
      }
    });
    
    $('#employees_slider').jCarouselLite({
      auto: 0,
      visible: 4,
      start: 0,
      speed: 2000,
      btnNext: ".right",
      btnPrev: ".left"
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
    $(".employee_names li").hover(function () {
      var self = $(this);
      var id = getId(self);
      
      $('#info_' + id).css({display: 'block'});

    }, function () {
      var self = $(this);
      var id = getId(self);

      $('#info_' + id).css({display: 'none'});
	  });

    $('.employee_image').click(function(e) {
      $.fancybox({
        'href' : e.target.src
      });
    });
    
    $('#event_calendar').fullCalendar({
      events: '/admin/events.json',
      timeFormat: 'H(:mm)',
      firstDay: 1,
      header: {
        left: 'prev,next today',
        center: 'title',
        right: 'year,month,agendaWeek,agendaDay'
      },
      editable: true,
      defaultView: 'year',

      viewDisplay: function() {
        var calendar = $(this);

        $('.fc-event').each(function(){
          // Grab event data
          var title = $(this).find('.fc-event-title').text(),
              data = calendar.data('fullCalendar').clientEvents(function(event){
                return event.title === title;
              })[0];

          $(this).qtip({
            content: "<strong>"+data.title+"</strong><br/><br/><i>"+data.date+"</i><br/><br/>"+data.content,
            position: {
              my: 'bottom center',
              at: 'top center'
            },
            show: 'mouseover',
            hide: 'mouseout',
            style: {
              tip: true
            }
          })
        })
      },
      //eventMouseover: function(event) {
//        $(this).qtip({
//          content: '<strong>' + event.title + '</strong><br/><br/>' + event.content.substring(0,150) + '<br/><br/>' + '<a href="/admin/events/' + event.id + '">Vis mere</a>',
//          position: {
//            my: 'bottom center',
//            at: 'top center'
//          }
//        });
        //var layer =	"<div id='events-layer' class='fc-transparent' style='position:absolute; width:100%; height:100%; top:-1px; text-align:right; z-index:100'></div>";
        //$(this).append(layer);
      //},
      //eventMouseout: function(event) {
        //$(this).find('div[id*=events-layer]').hide();
      //},
      eventClick: function(event) {
        window.location = "/admin/events/" + event.id;
      },
      /*dayClick: function(date, allDay, jsEvent, view) {
        window.location = "/admin/events/show_day?date=" + date;

        if (allDay) {

        }
        else {

        }
      },*/
      monthNames: [
        'Januar',
        'Februar',
        'Marts',
        'April',
        'Maj',
        'Juni',
        'Juli',
        'August',
        'September',
        'Oktober',
        'November',
        'December'
      ],
      monthNamesShort: [
          'Jan',
          'Feb',
          'Mar',
          'Apr',
          'Maj',
          'Jun',
          'Jul',
          'Aug',
          'Sep',
          'Okt',
          'Nov',
          'Dec'
      ],
      dayNames: [
        'Søndag',
        'Mandag',
        'Tirsdag',
        'Onsdag',
        'Torsdag',
        'Fredag',
        'Lørdag'
      ],
      dayNamesShort: [
        'Søn',
        'Man',
        'Tir',
        'Ons',
        'Tor',
        'Fre',
        'Lør'
      ],
      buttonText: {
        today: 'Idag',
        month: 'Måned',
        week:  'Uge',
        day:   'Dag',
        year:  'År'
      }
    });

     tinyMCE.init({
      mode : "textareas",
      editor_deselector : "no_editor",
      theme: "advanced",
      plugins: "media",

      theme_advanced_buttons1 : "bold,italic,underline,|,justifyleft,justifycenter,justifyright,fontselect,fontsizeselect,formatselect",
      theme_advanced_buttons2 : "cut,copy,paste,|,bullist,numlist,|,outdent,indent,|,undo,redo,|,link,unlink,anchor,image,|,code,preview,|,forecolor,backcolor",
      theme_advanced_buttons3 : "insertdate,inserttime,|,removeformat,|,sub,sup",
      theme_advanced_buttons4 : "media",
      theme_advanced_toolbar_location : "top",
      theme_advanced_toolbar_align : "left",
      theme_advanced_statusbar_location : "bottom",
      theme_advanced_resizing : true,

      skin : "o2k7",
      skin_variant : "silver"
    });
  });
})(jQuery);

  
