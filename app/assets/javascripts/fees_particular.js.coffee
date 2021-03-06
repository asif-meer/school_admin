$ ->
  $("#all_particular").hide()
  $("#roll_no_particular").hide()
  $("#batches_particular").hide()

  # Dropdown, dynamic change of fields
  $("#fees_particular_all").change ->
    if $("#fees_particular_all").val() is "true"
      $("#roll_no_particular").hide()
      $("#batches_particular").hide()
      $(".edit_particular_field").hide()
    else if $("#fees_particular_all").val() is "2"
      $("#all_particular").hide()
      $("#roll_no_particular").show()
      $("#batches_particular").show()
      $("#fees_particular_roll_no").val('')
      $("#fees_particular_batch_id").val('')
      $(".edit_particular_field").hide()
    else if $("#fees_particular_all").val() is "3"
      $("#batches_particular").show()
      $("#fees_particular_batch_id").val('')
      $("#all_particular").hide()
      $("#roll_no_particular").hide()
      $(".edit_particular_field").hide()
    return

  return

  


jQuery ->
  $('#particulars_datatable').dataTable()

  # Dropdown, when All is selected then others are removed
  $('#choose-category').change ->
    fees_particular_id = $("#fees_particular_id").val()
    if $("#choose-category").val() is "true"
      $("#roll_no_particular").hide()
      $("#batches_particular").hide()
      $("#fees_particular_roll_no").val('')
      $("#fees_particular_batch_id").val('')
      $(".edit_particular_field").hide()
      $.ajax
        type: "POST"
        url: "/fees_particulars/types"
        data: "id=" + fees_particular_id
        success: ->
          #alert 'success'
    else if $("#choose-category").val() is "2"
      $("#all_particular").hide()
      $("#roll_no_particular").show()
      $("#batches_particular").show()
      $("#fees_particular_roll_no").val('')
      $("#fees_particular_batch_id").val('')
      $(".edit_particular_field").hide()
      $.ajax
        type: "POST"
        url: "/fees_particulars/types"
        data: "id=" + fees_particular_id
        success: ->
          #alert 'success'
    else if $("#choose-category").val() is "3"
      $("#batches_particular").show()
      $("#fees_particular_roll_no").val('')
      $("#fees_particular_batch_id").val('')
      $("#all_particular").hide()
      $("#roll_no_particular").hide()
      $(".edit_particular_field").hide()
      $.ajax
        type: "POST"
        url: "/fees_particulars/types"
        data: "id=" + fees_particular_id
        success: ->
          #alert 'success'
    return

  return

$ ->
  $('#fees_particular_batch_id').change ->
    $.ajax
        type: "GET"
        url: "/fees_particulars/update_students"
        data: "batch_id=" + this.value
        success: ->
          #alert 'success'
    #alert(this.value)
