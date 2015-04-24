// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

$(".workout.show").ready(function() {
    var seq_dur = JSON.parse(SEQUENCES_DURATION);
    var keys = _.keys(seq_dur);
    var seq_len = keys.length;
    var counts = 0;
    var timer = JSON.parse(TIMER);
    var workout_seq = _.keys(timer);
    var start_time = 0;
    var current_seq_num = 0
    var next_seq_num = 0
    if (timer) {
        $("#timer").text(timer[workout_seq[0]]);
        start_time = parseInt(timer[workout_seq[0]].replace(/:/g, "")) * 1000;
        $('#timer').stopwatch({startTime: start_time}).stopwatch('stop');
    }
    $("#btn_stop").hide();

    $("#btn_start").click(function () {
        $('#timer').stopwatch().stopwatch('start');
        $("#btn_start").hide();
        $("#btn_stop").show();
        seq_name = $('#sequence_name').text();

        if (Number.isInteger(seq_name.split(".", 1))) {
            current_seq_num = seq_name.split(".", 1)
            next_seq_num = current_seq_num + 1
        }
        workout_elapsed = $('#timer').text();
        update_status('in progress', "{\\\"" + seq_name + "\\\":\\\"" + workout_elapsed + "\\\"}");
    });
    $("#btn_stop").click(function () {
        $('#timer').stopwatch().stopwatch('stop');
        $("#btn_stop").hide();
        $("#btn_start").show();
        seq_name = $('#sequence_name').text();
        workout_elapsed = $('#timer').text();
        update_status('paused', "{\\\"" + seq_name + "\\\":\\\"" + workout_elapsed + "\\\"}");
    });

    $('#timer').stopwatch().bind('tick.stopwatch', function (e, elapsed) {
        // duration * 1000 = actual seconds
        if (elapsed >= seq_dur[keys[counts]] * 1000) {
            if (counts + 1 >= seq_len) {
                $(this).stopwatch('stop');
                $(this).stopwatch('reset');
                $("#btn_star").hide();
                $("#btn_stop").hide();
                $("#sequence_name").text();
                update_status('completed', null);
                $("form#update-seq-form").submit();
            } else {
                $(this).stopwatch('reset');
                counts += 1;
                $("#sequence_name").text(keys[counts]);
                $("#sequence_duration").text(seq_dur[keys[counts]]);
                $("#curr_sequence_name").text(keys[counts]);
                $("#curr_sequence_duration").text(seq_dur[keys[counts]]);
                $("#next_sequence_name").text(keys[counts + 1]);
                $("#next_sequence_duration").text(seq_dur[keys[counts + 1]]);
                seq_name = $('#sequence_name').text();
                workout_elapsed = '00:00:00';
                update_status('in progress', "{\\\"" + seq_name + "\\\":\\\"" + workout_elapsed + "\\\"}");
            }
        }
    });

    function update_status(status, time) {
      $('#workout-status').val(status);
      $('#workout-timer').val(time);
      $("form#update-seq-form").submit();
    }
  });
  
  $(document).ready(function () {
      $('#button').click(function () {
          $('#preview').toggle();
      });
  });
