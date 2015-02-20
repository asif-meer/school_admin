# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
	

  $("#employee_date_of_birth")
    .on 'change', (e) ->
      $('form').data('bootstrapValidator').revalidateField 'employee[date_of_birth]'
      return

  $("#employee_date_of_birth").datepicker
    format: 'yyyy-mm-dd'
    todayHighlight: true

  $("#employee_joining_date").datepicker
    format: 'yyyy-mm-dd'
    todayHighlight: true
	
  $("#employee_educations_attributes_0_start_date").datepicker
    format: 'yyyy-mm-dd'
    todayHighlight: true

  $("#employee_educations_attributes_0_completion_date").datepicker
    format: 'yyyy-mm-dd'
    todayHighlight: true

  $("#employee_joining_date")
    .on 'change', (e) ->
      $('form').data('bootstrapValidator').revalidateField 'employee[joining_date]'
      return

  

  $("#employee_educations_attributes_0_start_date")
    .on 'change', (e) ->
      $('form').data('bootstrapValidator').revalidateField 'employee[educations_attributes][0][start_date]'
      return

  

  $("#employee_educations_attributes_0_completion_date")
    .on 'change', (e) ->
      $('form').data('bootstrapValidator').revalidateField 'employee[educations_attributes][0][completion_name]'
      return

  $("#employee_experiences_attributes_0_from_date").datepicker
    format: 'yyyy-mm-dd'
    todayHighlight: true

  $("#employee_experiences_attributes_0_from_date")
    .on 'change', (e) ->
      $('form').data('bootstrapValidator').revalidateField 'employee[experiences_attributes][0][from_date]'
      return

  $("#employee_experiences_attributes_0_to_date").datepicker
    format: 'yyyy-mm-dd'
    todayHighlight: true 

  $("#employee_experiences_attributes_0_to_date")
    .on 'change', (e) ->
      $('form').data('bootstrapValidator').revalidateField 'employee[experiences_attributes][0][to_date]'
      return

  #$("#employee_phone").mask('(990) 999-99')


$(document).ready ->
  $("#employees_datatable").dataTable()  

  #$(document).bind "ajaxSuccess", "form.employee_form", (event, xhr, settings) ->
    #$employee_form = $(event.data)
    #$error_container = $("#error_explanation", $employee_form)
    #$error_container_ul = $("ul", $error_container)
    #$("<p>").html(xhr.responseJSON.title + " saved.").appendTo $employee_form
    #if $("li", $error_container_ul).length
      #$("li", $error_container_ul).remove()
      #$error_container.hide()

  #$(document).bind "ajaxError", "form.employee_form", (event, jqxhr, settings, exception) ->
    #$employee_form = $(event.data)
    #$error_container = $("#error_explanation", $employee_form)
    #$error_container_ul = $("ul", $error_container)
    #$error_container.show()  if $error_container.is(":hidden")
    #$.each jqxhr.responseJSON, (index, message) ->
      #$("<li>").html(message).appendTo $error_container_ul

