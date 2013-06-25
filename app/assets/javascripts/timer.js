$(function () {

  var seconds = 0;
  var minutes = 0;

  function start_timer() { action = window.setInterval(count_seconds, 1000); }

  function count_seconds() {
    seconds++;
    if (seconds > 59) {
      minutes++;
      seconds = 0;
    }
    update_timer();
  }

  function update_timer() {
    $('p.timer').text(pad_with_zero(minutes) + ":" + pad_with_zero(seconds));
  }

  function pad_with_zero(time) {
    if (time == 0) {
      return '';
    } else if (time.toString().length == 1) {
      return "0" + time;
    } else {
      return time;
    }
  }

  start_timer();



});
