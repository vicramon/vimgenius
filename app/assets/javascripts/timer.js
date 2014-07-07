var seconds = 0;
var minutes = 0;
var timerInterval;

function startTimer() { timerInterval = window.setInterval(countSeconds, 1000); }

function countSeconds() {
  seconds++;
  if (seconds > 59) {
    minutes++;
    seconds = 0;
  }
  updateTimer();
}

function updateTimer() {
  $('p.timer').text(padWithZero(minutes) + ":" + padWithZero(seconds));
}

function padWithZero(time) {
  if (time == 0) {
    return '';
  } else if (time.toString().length == 1) {
    return "0" + time;
  } else {
    return time;
  }
}

function resetTimer() {
  seconds = 0;
  minutes = 0;
}

function stopTimer() {
  clearInterval(timerInterval);
}

startTimer();
