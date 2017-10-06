var keystrokes = $.map($('.success').attr("data-attribute-keystroke").split(" or "), $.trim);
var keysPressedDiv = $('#keys_pressed');
var userText = '';
var mousetrapList = ["escape", "ctrl"]

applyMousetrapIfNeeded();
interceptCtrlR();
interceptCtrlO();

function interceptCtrlR () {
  if (contains(keystrokes, ["ctrl+r"])) {
    $("body").on("keydown", function (e) {
      if (e.ctrlKey && e.keyCode == 82) {
        successCommand();
        event.keyCode = 0;
        event.cancelBubble = true;
        return false;
      }
    });
  }
}

function interceptCtrlO () {
  if (contains(keystrokes, ["ctrl+o"])) {
    $("body").on("keydown", function (e) {
      if (e.ctrlKey && e.keyCode == 79) {
        successCommand();
        event.keyCode = 0;
        event.cancelBubble = true;
        return false;
      }
    });
  }
}

$(document).keyup( function() {
  userText = keysPressed();
  $.each(keystrokes, function (index, keystroke) {
    if (userText == keystroke) { successCommand(); }
  });
});

function applyMousetrapIfNeeded() {
  if (mousetrapRequired()) { bindMousetrap(); }
}

function contains(string, lookUp) {
  string = string.join();
  var containsSpecialKey = false;
  $.each(lookUp, function(index, lookUpItem) {
    if (string.indexOf(lookUpItem) != -1) { containsSpecialKey = true; }
  });
  return containsSpecialKey;
}

function mousetrapRequired() {
  return contains(keystrokes, mousetrapList)
}

function bindMousetrap() {
  $.each(keystrokes, function(index, keystroke) {
    Mousetrap.bind(keystroke, function() { successCommand(); });
  });
}

function unbindMousetrap() {
  $.each(keystrokes, function(index, keystroke) {
    Mousetrap.unbind(keystroke);
  });
}

function keysPressed() {
  return keysPressedDiv.text();
}

$('a.next').click( function() { nextCommand(); return false; });

function successCommand() {
  captureKeypress = false;
  $('.success').show();
  $('.error').hide();
  stopTimer();
  unbindDelete();
  unbindMousetrap();
  Mousetrap.bind("enter", function() { nextCommand(); return false; });
}

function nextCommand() {
  unbindEnter();
  replaceQuestion();
  bindDelete();
  captureKeypress = true;
}

function unbindEnter() {
  Mousetrap.unbind('enter');
}

function currentCycle() {
  return $('.success').attr("data-attribute-current-cycle");
}

function timerCount() {
  numbers = $('p.timer').text();
  return parseInt(numbers.slice(-2));
}

function under15Seconds() {
  if (timerCount() <= 15) {
    return true;
  } else {
    return false;
  }
}

function replaceQuestion() {
  $.ajax({
    url: $('.success').attr("data-attribute-next-command-url"),
    data: { current_cycle: currentCycle(), mastered: under15Seconds() },
    type: 'GET',
    success: function(response) {
      $('#command').replaceWith(response);
      resetTimer();
      startTimer();
    },
    error: function() {
      console.log('Ajax error')
    }
  });
  return false;
}
