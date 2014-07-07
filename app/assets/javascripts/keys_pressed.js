var keysPressedDiv = $('#keys_pressed');
var correctKeystroke = $('.success').attr("data-attribute-keystroke").replace(/\s+/g, '');
var captureKeypress = true

Mousetrap.bind("escape", function() { resetKeysPressed(); return false; });

bindDelete();

function bindDelete() {
  Mousetrap.bind("backspace", function() { deleteLastKeyPress(); return false; });
}

function unbindDelete() {
  Mousetrap.bind("backspace", function() { return false; });
}

document.onkeypress = function(event) {
  if (captureKeypress) {
    displayKeypress(event)
  }
}

function displayKeypress(event) {
  event = event || window.event;
  var character = String.fromCharCode(event.keyCode);
  keysPressedDiv.append(character);
  resetIfTooLong();
}

function resetIfTooLong() {
  var keyLength = $.trim(keysPressedDiv.text()).length;
  if (keyLength > correctKeystroke.length + 2) {
    resetKeysPressed();
    displayError();
  }
}

function resetKeysPressed() {
  keysPressedDiv.text('');
}

function deleteLastKeyPress() {
  var currentText = keysPressedDiv.text();
  keysPressedDiv.text(currentText.slice(0,-1));
}

function displayError() {
  $('.error').show();
}


