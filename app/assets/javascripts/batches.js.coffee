isChecked = (checkboxId) ->
  id = "#" + checkboxId
  $(id).is ":checked"
resetSelectAll = ->
  
  # if all checkbox are selected, check the selectall checkbox
  # and viceversa
  if $(".selectedId").length is $(".selectedId:checked").length
    $("#select_all").attr "checked", "checked"
  else
    $("#select_all").removeAttr "checked"
  if $(".selectedId:checked").length > 0
    $("#edit").attr "disabled", false
  else
    $("#edit").attr "disabled", true
  return

jQuery ->

	$("#batch_start_date").datetimepicker
		pickTime: false

  $("#batch_start_date")
    .on 'change', (e) ->
      $('form').data('bootstrapValidator').revalidateField 'batch[start_date]'
      return
	$("#batch_end_date").datetimepicker
		pickTime: false

  $("#batch_end_date")
    .on 'change', (e) ->
      $('form').data('bootstrapValidator').revalidateField 'batch[end_date]'
      return

jQuery ->
	$("#search_by_course").change ->
		$.ajax
      type: "GET"
      url: "/batches/update_batches"
      data: "course_id=" + this.value
      success: ->
        #alert 'success'

  	$.get $("#batches_search_form").attr("action"), $("#batches_search_form").serialize(), null, "script"
		false

	$(".update_batches").change ->
		value = $(this).find("#subject_allocation_batch_id").val()
		$.get $("#batches_search_form").attr("action"), $("#batches_search_form").serialize(), null, "script"
		false






  # alert($("#search_by_category option:nth-child(1)").text())


	