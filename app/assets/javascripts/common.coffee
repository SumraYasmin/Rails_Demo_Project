$(document).on 'turbolinks:load', ->
  $('.select2').select2()
  datepickerfunction();

window.datepickerfunction  = () ->
  $('.datepicker').datetimepicker format: 'DD/MM/YYYY'
