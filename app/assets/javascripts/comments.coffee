$(document).on "turbolinks:load", ->
  $(".toggle-link").on "click", ->
    $(".ajax-form").fadeToggle();
    $("#comment-body").focus();
    return false;
