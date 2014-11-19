jQuery ->
  $("#fees_period_fees_category_id").change ->
    $.ajax
        type: "GET"
        url: "/fees_periods/update_fees_particulars"
        data: "fees_category_id=" + this.value
        success: ->
          #alert 'success'

  $("#fees_period_start_date").datepicker
    changeYear: true
    yearRange: "1950:2025"
    changeMonth: true
    showOtherMonths: true
    dateFormat: "dd/mm/yy"
  $("#fees_period_end_date").datepicker
    changeYear: true
    yearRange: "1950:2025"
    changeMonth: true
    showOtherMonths: true
    dateFormat: "dd/mm/yy"
  $("#fees_period_due_date").datepicker
    changeYear: true
    yearRange: "1950:2025"
    changeMonth: true
    showOtherMonths: true
    dateFormat: "dd/mm/yy"