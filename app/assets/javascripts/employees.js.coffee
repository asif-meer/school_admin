# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
	$("#employee_date_of_birth").datetimepicker
		pickTime: false

	$("#employee_joining_date").datetimepicker
		pickTime: false

	$("#employee_employee_attendences_attributes_0_date").datetimepicker
		pickTime: false


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