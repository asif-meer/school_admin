jQuery(function() {
  $("#subject_allocation_course_id").change(function() {
    return $.ajax({
      type: "GET",
      url: "/subject_allocations/update_course",
      data: "course_id=" + this.value,
      success: function() {}
    });
  });

  $("#subject_allocation_department_id").change(function() {
    return $.ajax({
      type: "GET",
      url: "/subject_allocations/update_department",
      data: "department_id=" + this.value,
      success: function() {}
    });
  });


  return $(".batches").change(function() {
    var value;
    value = $(this).find("#subject_allocation_batch_id").val();
    // alert(value)
    return $.ajax({
      type: "GET",
      url: "/subject_allocations/update_batch",
      data: "batch_id=" + value,
      success: function() {}
    });
  });
});
