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

jQuery ->
  $(".destroy-all").click ->
    if !$(":checkbox").is(':checked')
        $("#select_notice").html("Select atleast one checkbox")
        return false
    else 
      if $(":checkbox").is(':checked')
     
        $("#select_notice").html("")
        return true   
    return false
