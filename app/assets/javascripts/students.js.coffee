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
    format: 'yyyy-mm-dd'
    todayHighlight: true

  $("#student_date_of_birth")
    .on 'change', (e) ->
      $('form').data('bootstrapValidator').revalidateField 'student[date_of_birth]'
      return

  $("#student_joining_date").datepicker
    format: 'yyyy-mm-dd'
    todayHighlight: true


  $("#student_joining_date")
    .on 'change', (e) ->
      $('form').data('bootstrapValidator').revalidateField 'student[joining_date]'
      return



jQuery ->
  $("#students_datatable").dataTable()

  #$("#student_nic").mask('0000-000000-0')

  

  