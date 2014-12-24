$ ->
	$("#search").keyup ->
		$.get $("#subjects_search_form").attr("action"), $("#subjects_search_form").serialize(), null, "script"
		false

	$("#search_by_course").change ->
		$.get $("#subjects_search_form").attr("action"), $("#subjects_search_form").serialize(), null, "script"
		false

	$("#search_by_batch").change ->
		$.get $("#subjects_search_form").attr("action"), $("#subjects_search_form").serialize(), null, "script"
		false

jQuery ->
  $("#subject_course_id").change ->
    $.ajax
        type: "GET"
        url: "/subjects/update_course"
        data: "course_id=" + this.value
        success: ->
          #alert 'success'

	

	return

