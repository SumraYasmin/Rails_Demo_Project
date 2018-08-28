$(document).on("click",".datepicker", function(){
  $(".datepicker").datetimepicker();
});

$(document).on("turbolinks:load", function(){
  $(".select2").select2();
});
