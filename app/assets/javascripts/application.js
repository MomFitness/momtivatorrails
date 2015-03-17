// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require_tree .

$(function() {
  setTimeout(function(){
    $('.flash-notice').slideUp(450);
  }, 3000);
});

$(function() {
  $('.clockpicker').clockpicker({
    donetext: 'Done'
  });
});

//  iPhone-style checkbox switches
$(function() {
  $("div.workout_schedule input[type=text]").blur(function(){
    $("form.workout_schedule").submit();
  });
});

// $(document).ready(function(){
//     $("input").focus(function(){
//         $(this).css("background-color", "#cccccc");
//     });
//     $("input").blur(function(){
//         $(this).css("background-color", "#ffffff");
//     });
// });

// $("input").blur(function(){
//   alert("teser");
//   $("form.workout_schedule").submit();
// });