# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  $("#student_course_id").change ->
    $.ajax
        type: "GET"
        url: "/admission/update_course"
        data: "course_id=" + this.value
        success: ->
          #alert 'success'
      
jQuery ->
  $("#student_date_of_birth").datepicker
    changeYear: true
    yearRange: "1950:2025"
    changeMonth: true
    showOtherMonths: true
    dateFormat: "dd/mm/yy"

  $("#student_joining_date").datepicker
    changeYear: true
    yearRange: "1950:2025"
    changeMonth: true
    showOtherMonths: true
    dateFormat: "dd/mm/yy"

jQuery ->
  $("#students_datatable").dataTable()

  #$("#student_nic").mask('0000-000000-0')

  

  