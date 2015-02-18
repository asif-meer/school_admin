jQuery ->
  $('#class_details_1').click ->
  	to_start_for_class_details = $("#classes_all_details")
	  val = $('#details_class').val()
	  return $.ajax(
	    type: 'GET'
	    url: '/classes/' + val + '/class_details'
	    data: 'id=' + val
	    success: ->
	  )
  $('#class_details_2').click ->
  	to_start_for_class_details = $("#classes_all_details")
	  val = $('#details_class').val()
	  return $.ajax(
	    type: 'GET'
	    url: '/classes/' + val + '/class_details_for_periods'
	    data: 'id=' + val
	    success: ->
	    	$.unblockUI
		)
