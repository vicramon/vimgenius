
var keys_pressed = $('#keys_pressed');
var correct_keystroke = $('.success').attr("data-attribute-keystroke").replace(/\s+/g, '');

document.onkeypress = function(event) {
  display_keypress(event)
}

function display_keypress(event) {
  event = event || window.event;
  var character = String.fromCharCode(event.keyCode);
  keys_pressed.append(character);
  reset_if_too_long();
}

function reset_if_too_long() {
  var key_length = $.trim(keys_pressed.text()).length;
  if (key_length > correct_keystroke.length + 2) {
    reset_keys_pressed();
    display_error();
  }
}

function reset_keys_pressed() {
  keys_pressed.text('');
}

function display_error() {
  $('.error').show();
}


