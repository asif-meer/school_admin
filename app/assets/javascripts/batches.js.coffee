jQuery -> 
	$("#batch_start_date").datetimepicker
		pickTime: false
	$("#batch_end_date").datetimepicker
		pickTime: false

	$("#select_all").click ->
		if @checked
			$(":checkbox").each ->
			  @checked = true
			  return

		else
			$(":checkbox").each ->
			  @checked = false
			  return

		return

jQuery ->

	$(".update_batches").change ->
		value = $(this).find("#subject_allocation_batch_id").val()
		$.get $("#batches_search_form").attr("action"), $("#batches_search_form").serialize(), null, "script"
		false

	$("#search_by_course").change ->
		
		$.ajax
	        type: "GET"
	        url: "/batches/update_batches"
	        data: "course_id=" + this.value
	        success: ->
	          #alert 'success'

      	$.get $("#batches_search_form").attr("action"), $("#batches_search_form").serialize(), null, "script"
		false
	return




  	# alert($("#search_by_category option:nth-child(1)").text())


	