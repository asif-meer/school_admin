jQuery ->
  $("#subject_course_id").change ->
    $.ajax
        type: "GET"
        url: "/subjects/update_course"
        data: "course_id=" + this.value
        success: ->
          #alert 'success'