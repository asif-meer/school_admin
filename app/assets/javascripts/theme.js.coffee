$ ->
  stripTrailingSlash = (str) ->
    return str.substr(0, str.length - 1)  if str.substr(-1) is "/"
    str
  url = window.location.pathname
  activePage = stripTrailingSlash(url)
  $(".nav li a").each ->
    currentPage = stripTrailingSlash($(this).attr("href"))
    $(this).parent().addClass "active"  if activePage is currentPage
    return

  return
  




$(document).ajaxStart ->
  $.blockUI({ message: "<h2><span class='glyphicon glyphicon-refresh glyphicon-refresh-animate'></span>Loading...</h2>" });

$(document).ajaxStop($.unblockUI);


  

      
jQuery ->
  $("#select_all").hide()  if !$(".selectedId").length

  $(document).on "click", "#select_all", ->
    $(this).closest("table").find(":checkbox").prop "checked", @checked
    return
    
  $(".destroy-all").on "click", ->
    if !$(":checkbox").is(':checked')
        url = window.location.href
        host = window.location.host
        if url.indexOf('https://' + host + '/subjects/list') != -1 or url.indexOf(host + '/subjects/list') != -1
          $("#select_notice").html("Select atleast one Subject") 
        else if url.indexOf('https://' + host + '/batches') != -1 or url.indexOf(host + '/batches') != -1
          $("#select_notice").html("Select atleast one Batch")
        else if url.indexOf('https://' + host + '/courses') != -1 or url.indexOf(host + '/courses') != -1
          $("#select_notice").html("Select atleast one Course")
        else if url.indexOf('https://' + host + '/employees') != -1 or url.indexOf(host + '/employees') != -1
          $("#select_notice").html("Select atleast one Employee")
        else if url.indexOf('https://' + host + '/classrooms') != -1 or url.indexOf(host + '/classrooms') != -1
          $("#select_notice").html("Select atleast one classroom") or url.indexOf(host + '/teachers') != -1
        else if url.indexOf('https://' + host + '/classes') != -1 or url.indexOf(host + '/classes') != -1
          $("#select_notice").html("Select atleast one class")
        else if url.indexOf('https://' + host + '/periods') != -1 or url.indexOf(host + '/periods') != -1
          $("#select_notice").html("Select atleast one period")
        else if url.indexOf('https://' + host + '/teachers') != -1 or url.indexOf(host + '/teachers') != -1
          $("#select_notice").html("Select atleast one teacher")
        else if url.indexOf('https://' + host + '/students') != -1 or url.indexOf(host + '/students') != -1
          $("#select_notice").html("Select atleast one student")

        if !$(".selectedId").length
          $("#select_notice").html("There is no record present")
          #$(this).attr('disabled','disabled');
          return false
    else if $(":checkbox").is(':checked')
     
        $("#select_notice").html("")
        return true
    return false

    
  $(window).click ->
      $("#select_notice").html("")
      $("input[type='submit']").prop 'disabled', false

  

  
      
  
