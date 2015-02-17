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
  $.blockUI
    message: "<h2><span class='glyphicon glyphicon-refresh glyphicon-refresh-animate'></span>Loading...</h2>"
    timeout:500
    fadeIn:300
    css:
      border: 'none'
      padding: '7px 0px 15px'
      backgroundColor: 'rgb(255, 255, 255)'
      '-webkit-border-radius': '11px'
      '-moz-border-radius': '11px'
      opacity: .5
      color: '#fff'
      'margin-left': '73px'
      width: '17%'
      
jQuery ->
  $("#select_all").hide()  if !$(".selectedId").length

  $(document).on "click", "#select_all", ->
    $(this).closest("table").find(":checkbox").prop "checked", @checked
    return
    
  $(".destroy-all").on "click", ->
    if !$(":checkbox").is(':checked')
        url = window.location.href
        host = window.location.host
        if url.indexOf('http://' + host + '/subjects/list') != -1
        
          $("#select_notice").html("Select atleast one Subject")
        else if url.indexOf('http://' + host + '/batches') != -1
          $("#select_notice").html("Select atleast one Batch")
        else if url.indexOf('http://' + host + '/courses') != -1
          $("#select_notice").html("Select atleast one Course")
        else if url.indexOf('http://' + host + '/employees') != -1
          $("#select_notice").html("Select atleast one Employee")
        else if url.indexOf('http://' + host + '/classrooms') != -1
          $("#select_notice").html("Select atleast one classroom")
        else if url.indexOf('http://' + host + '/classes') != -1
          $("#select_notice").html("Select atleast one class")
        else if url.indexOf('http://' + host + '/periods') != -1
          $("#select_notice").html("Select atleast one period")

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

  

  
      
  
