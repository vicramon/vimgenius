
var keys_pressed_div = $('#keys_pressed');
var correct_keystroke = $('.success').attr("data-attribute-keystroke").replace(/\s+/g, '');
var capture_keypress = true

Mousetrap.bind("escape", function() { reset_keys_pressed(); return false; });
Mousetrap.bind("backspace", function() { delete_last_key_press(); return false; });

document.onkeypress = function(event) {
  if (capture_keypress) {
    display_keypress(event)
  }
}

function display_keypress(event) {
  event = event || window.event;
  var character = String.fromCharCode(event.keyCode);
  keys_pressed_div.append(character);
  reset_if_too_long();
}

function reset_if_too_long() {
  var key_length = $.trim(keys_pressed_div.text()).length;
  if (key_length > correct_keystroke.length + 2) {
    reset_keys_pressed();
    display_error();
  }
}

function reset_keys_pressed() {
  keys_pressed_div.text('');
}

function delete_last_key_press() {
  var current_text = keys_pressed_div.text();
  keys_pressed_div.text(current_text.slice(0,-1));
}

function display_error() {
  $('.error').show();
}


