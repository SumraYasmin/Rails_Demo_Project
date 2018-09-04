@bind_date_picker = ->
  $('.datepicker').datetimepicker format: 'DD/MM/YYYY'

$(document).on 'turbolinks:load', ->
  $('.select2').select2()
  bind_date_picker()
