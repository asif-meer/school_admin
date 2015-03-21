jQuery ->
  $("#student_course_id").change ->
    console.log ("fetching batches")
    $.ajax '/get_batches/',
      type: 'GET'
      dataType: 'json'
      data: { course_id: 1 }
      error: (jqXHR, textStatus, errorThrown) ->
        alert textStatus
      success: (data, textStatus, jqXHR) ->
        if data.success == true
          $(".find_patients_response_count").html data.records_found + " Results found for <strong> &#147; " + name_search_field + " &#147; </strong>"
          $(".find_patients_query_response").html JST["templates/patients/doctors_patients_search"](patients : data.data.patients)
          $("tr.invite-patient").on
            mouseenter: ->
              $(this).find(".btn-invite-patient").stop().fadeTo("fast", 1).find(".btn-invite-patient").addClass("show-btn").removeClass "hide-btn"
            mouseleave: ->
              $(this).find(".btn-invite-patient").stop().fadeTo "fast", 0