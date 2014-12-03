jQuery -> 
	$("#batch_start_date").datepicker
		changeYear: true
		yearRange: "1950:2025"
		changeMonth: true
		showOtherMonths: true
		dateFormat: "dd/mm/yy"
	$("#batch_end_date").datepicker
		changeYear: true
		yearRange: "1950:2025"
		changeMonth: true
		showOtherMonths: true
		dateFormat: "dd/mm/yy"

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

	