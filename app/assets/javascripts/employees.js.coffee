# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
	$("#employee_date_of_birth").datepicker
		changeYear: true
		yearRange: "1950:2025"
		changeMonth: true
		showOtherMonths: true
		dateFormat: "dd/mm/yy"

	$("#employee_joining_date").datepicker
		changeYear: true
		yearRange: "1950:2025"
		changeMonth: true
		showOtherMonths: true
		dateFormat: "dd/mm/yy"

	$("#employee_employee_attendences_attributes_0_date").datepicker
		changeYear: true
		yearRange: "1950:2025"
		changeMonth: true
		showOtherMonths: true
		dateFormat: "dd/mm/yy"