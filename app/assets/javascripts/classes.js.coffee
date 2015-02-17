jQuery ->
  $('#class_details_1').click ->
	  val = $('#details_class').val()
	  return $.ajax(
	    type: 'GET'
	    url: '/classes/' + val + '/class_details'
	    data: 'id=' + val
	    success: ->
	  )
  $('#class_details_2').click ->
	  val = $('#details_class').val()
	  return $.ajax(
	    type: 'GET'
	    url: '/classes/' + val + '/class_details_for_periods'
	    data: 'id=' + val
	    success: ->
    )
