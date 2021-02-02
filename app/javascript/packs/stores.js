$( document ).on('turbolinks:load', function() {
  $(".search_field").keyup(function(){
    $(".search_btn").click();
  });
  $('.store_cat li').click(function(){
    var va=$(this).attr('value')
    if(va=='all'){
      $("form")[0].reset();
      $("form input").val('')
    }
    else{
      $('.cat_id_field').val(va)
    }
   $(".search_btn").click();
  });
  $('.sort_type li').click(function(){
    var va=$(this).attr('value')
    $('.sort_type_field').val(va)
    $(".search_btn").click();
  });

  // user's setting
  $('#cryptoToggle').on('change', function(e) {
    e.preventDefault();

    var isChecked = $(this).is(':checked');

    $.ajax({
      contentType: 'application/json',
      url: '/profile.json',
      type: 'PUT',
      data: JSON.stringify({ user: {show_live_ticker: isChecked} })
    })
  })

  $('#user-avatar-change-photo').on('click', function(e) {
    e.preventDefault();

    $('#user-avatar-change-file').trigger('click')
  })

  $('#user-avatar-change-file').on('change', function(e) {
    $('form#direct-upload-avatar-form').trigger('submit')
  })
});

