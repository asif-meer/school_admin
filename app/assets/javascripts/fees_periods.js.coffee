jQuery ->
  $("#fees_period_fees_category_id").change ->
    $.ajax
        type: "GET"
        url: "/fees_periods/update_fees_particulars"
        data: "fees_category_id=" + this.value
        success: ->
          #alert 'success'

  $("#fees_period_start_date").datetimepicker
        pickTime: false
  $("#fees_period_end_date").datetimepicker
        pickTime: false
  $("#fees_period_due_date").datetimepicker
        pickTime: false