$ ->
  
  parseInput = (input) ->
    switch input
              
      # fields
      when "carlos.first_name"
        output = "\"#{Carlos.first_name}\""
      when "carlos.last_name"
        output = "\"#{Carlos.last_name}\""
      when "carlos.title"
        output = "\"#{Carlos.title}\""
      when "carlos.email"
        output = "<a href=\"mailto:#{Carlos.email}\">#{Carlos.email}</a>"
      when "carlos.website"
        output = "<a href=\"#{Carlos.website}\" target=\"blank\">#{Carlos.website}</a>"
      when "carlos.description"
        output = "\"#{Carlos.description}\""
      when "carlos.skills"
        output = "<pre>#{Carlos.skills}</pre>"
      when "carlos.work_experience"
        output = "<pre>#{Carlos.work_experience}</pre>"
      when "carlos.education"
        output = Carlos.education
      when "carlos.girlfriend"
        output = "\"Ellie Fichtelman\""
              
      # methods
      when "carlos.to_s", "carlos.to_s()"
        output = Carlos.to_s()
      when "carlos.print", "carlos.print()"
        Carlos.print()
        output = ""
      when "carlos.contact", "carlos.contact()"
        Carlos.contact()
        output = ""
      when "carlos.follow", "carlos.follow()"
        Carlos.follow()
        output = ""
      when "carlos.connect", "carlos.connect()"
        Carlos.connect()
        output = ""
      when "carlos.meet", "carlos.meet()"
        Carlos.meet()
        output = ""
      
      # commands
      when "help"
        output = "<pre>#{Carlos.uml}</pre>"
      when "clear"
        clearOutput()
        output = ""
        
      # misc
      when "carlos"
        output = "<#Person first_name: \"#{Carlos.first_name}\", last_name: \"#{Carlos.last_name}\", title: \"#{Carlos.title}\">"

      else
        output = "error: unrecognized command. type 'help' for list of commands"
  
  setOutput = ->
    input = $('input')
    output = parseInput input.val()
    $('#output').append "<p>> " + input.val() + "<p>"
    $('#output').append "<p>=> " + output + "<p>" if output.length > 0
    input.val("")
    return
    
  clearOutput = ->
    $('#output').html("")
    return
  
  $('input').keyup (e) ->
    switch e.keyCode
      when 13
        event.preventDefault()
        setOutput()
        
    false