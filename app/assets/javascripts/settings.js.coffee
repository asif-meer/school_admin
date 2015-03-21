class window.settings
  constructor: ->
    console.log "In settings.js.coffee"
    @setupSettingsShow()

  tabLoaded: (event, ui) =>
    self = window.odw.settings
    if ui.panel? and ui.panel.length? and ui.panel.length > 0
      panelId = ui.panel[0].id
    else
      panelId = ui.panel.id
    switch panelId
      when "ui-tabs-1" then self.mySettingsLoaded()
      when "ui-tabs-2" then self.organizationSettingsLoaded()


  setupSettingsShow: ->
    console.log "In setupSettingsShow"
    self = this
    $("#tabs").tabs
      load: self.tabLoaded
      activate: self.tabLoaded

  mySettingsLoaded: ->
    console.log "My Settings Loaded"
    odw.hijackFormSubmit()
    $('#user_date_of_birth').mask '9999/99/99', 
      placeholder: 'yyyy/mm/dd'
    # avatar uploading functionality starts
    $('#user_avatar').on 'change', ->
      file = @files[0]
      fileName = file.name
      fileSize = file.size
      user_id  = current_user.id
      console.log  "Uploading: " + fileName
      urlPath = "/users/" + user_id + "/avatar_upload"
      $dataSpinner =
        autoCheck: if $('#autoCheck').is(':checked') then 32 else false
        size: '32'
        bgColor: '#EEE'
        bgOpacity: '0.7'
        fontColor: '#000'
        title: 'Please wait image is uploading..'
        isOnly: !$('#isOnly').is(':checked')

      r = confirm "Do you want to confirm add/change picture?"
      if r == true
        $('form').loader $dataSpinner
        formData = new FormData
        $input = $('#user_avatar')
        formData.append 'user[avatar]', $input[0].files[0]
        $.ajax
          url: urlPath
          data: formData
          cache: false
          contentType: false
          processData: false
          type: 'POST'
          success: ( response ) ->
            window.location.reload true

      else
        console.log "action cancelled"
      return

  organizationSettingsLoaded: ->
    console.log "Organization Settings loaded"
    odw.hijackFormSubmit()
