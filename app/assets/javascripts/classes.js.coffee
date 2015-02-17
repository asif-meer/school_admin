jQuery ->
	$("#class_details_1").click ->
		
		val = $("#details_class").val()
		#alert(val)
		$.ajax
      type: "GET"
      url: "/classes/"+val+"/class_details"
      data: "id=" + val
      success: ->
