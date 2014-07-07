// Detect the Vimium Chrome extension by Evan Hahn (evanhahn.com)

;(function(doc) {

  doc.hasVimium = function() {
    return doc.getElementsByClassName('vimiumReset').length > 0;
  };

  doc.onDetectVimium = function(callback, scope) {

    scope || (scope = window);

    if (doc.hasVimium()) {
      callback.call(scope);
    }

    else {
      var interval = setInterval(function() {
        if (doc.hasVimium()) {
          clearInterval(interval);
          callback.call(scope);
        }
      }, 1000);
    }

  };

})(document);

document.onDetectVimium(function() {
  $('#vimium_warning').show()
  $('#vimium_warning .error').show()
});
