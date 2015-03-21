jQuery ->
	$("#period_start_time")
		.datetimepicker
			pickDate: false,
  		pick12HourFormat: false

	$("#period_start_time")
		.on 'change', (e) ->
	    $('form').data('bootstrapValidator').revalidateField 'period[start_time]'
	    return



	$("#period_end_time").datetimepicker
		pickDate: false,
  		pick12HourFormat: false

	#Revalidate bootstrap Datepicker
	$("#period_end_time")
		.on 'change', (e) ->
	    $('form').data('bootstrapValidator').revalidateField 'period[end_time]'
	    return