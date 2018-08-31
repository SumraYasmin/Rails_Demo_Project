$(document).on("turbolinks:load", function(){
  $(".toggle-link").on("click", function(){
    $(".ajax-form").fadeToggle();
    $("#comment-body").focus();
    return false;
  });
});
