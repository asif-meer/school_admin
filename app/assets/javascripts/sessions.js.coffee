$ ->
	$("#session_start_date").datetimepicker
		pickTime: false

	$("#session_start_date")
    .on 'change', (e) ->
      $('form').data('bootstrapValidator').revalidateField 'session[start_date]'
      return
	$("#session_end_date").datetimepicker
		pickTime: false

	$("#session_end_date")
    .on 'change', (e) ->
      $('form').data('bootstrapValidator').revalidateField 'session[end_date]'
      return

