# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
	$("#time_table_form").submit (event) ->
		#alert($(this).find("#search_class").val())
		class_name = $(this).find("#search_class").val()
		event.preventDefault()
		$.ajax
      type: "GET"
      url: "/time_table/view"
      data: "school_class_name=" + class_name
      success: ->
        #alert 'success'
		return