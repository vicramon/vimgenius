jQuery(function($) {

  $('form#login').submit( function() {
    $.ajax({
      url: '/login',
      data: $('input#email'),
      type: 'POST',
      success: function(response) {
        $('.session').replaceWith(response)
      },
      error: function() {
        console.log('Ajax error')
      }
    });
    return false;
  });

});
