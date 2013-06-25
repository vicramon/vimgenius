$(function() {


  $(document).keydown( function(event) {
    if (event.keyCode == 39) { showHint(); return false }
  });

  function showHint() {
    $('span.hidden_hint').first().removeClass('hidden_hint');
  }

});

