$(document).on("click",".datepicker", function(){
  $(".datepicker").datetimepicker({
    format: 'DD/MM/YYYY'
  });
});
$(document).on("turbolinks:load", function(){
  $(".select2").select2();
});
