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

	