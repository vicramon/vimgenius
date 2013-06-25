$(function () {

  var keystroke = $('.success').attr("data-attribute-keystroke")
  Mousetrap.bind(keystroke, function() { success_command(); return false; });

  function success_command() {
    $('.success').show();
  }

});

