// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/
$(".mom.dashboard").ready(function() {
  $(function() {
    $('.clockpicker').clockpicker({
      donetext: 'Done'
    });
  });

  $(function() {
    $("div.workout-schedule input[type=text]").change(function(){
      $("form.workout-schedule").submit();
    });
  });
});