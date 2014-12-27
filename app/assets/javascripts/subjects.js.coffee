jQuery ->
  $("#subject_course_id").change ->
    $.ajax
        type: "GET"
        url: "/subjects/update_course"
        data: "course_id=" + this.value
        success: ->
          #alert 'success'
		return

jQuery ->
	$("#search_by_course_in_subjects").change ->
    $.ajax
        type: "GET"
        url: "/subjects/update_course"
        data: "course_id=" + this.value
        success: ->
          #alert 'success'

    return
    
jQuery ->
	$("#search_by_course_in_subjects").change ->
		$.get $("#subjects_search_form").attr("action"), $("#subjects_search_form").serialize(), null, "script"
		false

jQuery ->
	$(".batches").change ->
		value = $(this).find("#search_by_batch_in_subjects").val()
		$.get $("#subjects_search_form").attr("action"), $("#subjects_search_form").serialize(), null, "script"
		false





