var keystrokes = $.map($('.success').attr("data-attribute-keystroke").split(" or "), $.trim);
var keys_pressed_div = $('#keys_pressed');
var user_text = '';
var mousetrap_list = ["escape", "ctrl"]

apply_mousetrap_if_needed();

$(document).keyup( function() {
  user_text = keys_pressed();
  $.each(keystrokes, function (index, keystroke) {
    if (user_text == keystroke) { success_command(); }
  });
});

function apply_mousetrap_if_needed() {
  if (mousetrap_required()) { bind_mousetrap(); }
}

function contains(string, look_up) {
  string = string.join();
  var contains_special_key = false;
  $.each(look_up, function(index, look_up_item) {
    if (string.indexOf(look_up_item) != -1) { contains_special_key = true; }
  });
  return contains_special_key;
}

function mousetrap_required() {
  return contains(keystrokes, mousetrap_list)
}

function bind_mousetrap() {
  $.each(keystrokes, function(index, keystroke) {
    Mousetrap.bind(keystroke, function() { success_command(); });
  });
}

function unbind_mousetrap() {
  $.each(keystrokes, function(index, keystroke) {
    Mousetrap.unbind(keystroke);
  });
}

function keys_pressed() {
  return keys_pressed_div.text();
}

$('a.next').click( function() { next_command(); return false; });

function success_command() {
  capture_keypress = false;
  $('.success').show();
  $('.error').hide();
  stop_timer();
  unbind_delete();
  unbind_mousetrap();
  Mousetrap.bind("enter", function() { next_command(); return false; });
}

function next_command() {
  unbind_enter();
  replace_question();
  bind_delete();
  capture_keypress = true;
}

function unbind_enter() {
  Mousetrap.unbind('enter');
}

function current_cycle() {
  return $('.success').attr("data-attribute-current-cycle");
}

function timer_count() {
  numbers = $('p.timer').text();
  return parseInt(numbers.slice(-2));
}

function under_5_seconds() {
  if (timer_count() <= 5) {
    return true;
  } else {
    return false;
  }
}

function replace_question() {
  $.ajax({
    url: $('.success').attr("data-attribute-next-command-url"),
    data: { current_cycle: current_cycle(), mastered: under_5_seconds() },
    type: 'GET',
    success: function(response) {
      $('#command').replaceWith(response);
      reset_timer();
      start_timer();
    },
    error: function() {
      console.log('Ajax error')
    }
  });
  return false;
}

