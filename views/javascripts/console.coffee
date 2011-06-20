$ ->
  
  # ========== TODO ==============
  # EXTRACT THIS INTO A SEPARATE LIB
  class Carlos
    
    first_name = "Carlos"
    last_name = "Ramirez III"
    title = "Software Engineer"
    email = "carlosramireziii@me.com"
    website = "http://www.carlosramireziii.me"
    description = "Experienced software engineer with focus on Ruby on Rails web application development. Staunch believer in programming best practices, test-driven development, and agile methodology. Able to communicate effectively with clients and colleagues. Passion for writing clear, concise, readable code. Possess a perpetual desire teach, learn from, and cooperate with others."
    skills = ''' 
      { 
        :specialties => ["Ruby", "JavaScript/CoffeeScript", "CSS/Sass", "HTML5"],
        :frameworks => ["Ruby on Rails", "jQuery"],
        :testing_tools => ["Test::Unit", "MiniTest", "RSpec"],
        :databases => ["PostgreSQL", "SQLite3", "MySQL", "MongoDB"],
        :platforms => ["Mac OSX", "Linux", "FreeBSD", "Windows"],
        :other => ["C#", "VB.NET", "Java", "C/C++", "XAML", "WPF", "WCF"] 
      }
      '''
    work_experience = '''
      [{
        :company => "Cetrasoft LLC",
        :position => "Freelance Web Developer",
        :when => 2010..Present,
        :summary => "Worked on a wide variety of web and corporate identity projects. 
                    Coordinated concept through implementation, concentrating on backend design, 
                    user interface enhancements through AJAX and JavaScript, deployment and optimizations."
      },
      {
        :company => "Total Computer Software",
        :position => "Senior Software Engineer",
        :when => 2008..2011,
        :summary => "Architected and implemented an inter-agency data sharing system using Windows Communication 
                  Foundation with an emphasis on interoperability, distributability, and security. Designed and 
                  implemented a mapping system which integrates with ESRI ArcGIS web services to display maps, 
                  locate addresses, and retrieve geo-data."
        }]
      '''
    education = "<#School name: \"Williams College\", grad_year: 2008, degree: \"Bachelor of Arts in Computer Science\">"

    # fields
    first_name: -> first_name
    last_name: -> last_name
    title: -> title
    email: -> email
    website: -> website
    description: -> description
    skills: -> skills
    work_experience: -> work_experience
    education: -> education
    
    # methods
    
    # helper
    full_name: -> first_name + ' ' + last_name
    
    help: ->
      html = '''
        ==========
        = Person =
        ==========
        
        FIELDS:
          - first_name
          - last_name
          - title
          - email
          - website
          - description
          - skills
          - work_experience
          - education
        METHODS:
          + to_s
          + print
          + contact
          + tweet
          + link_in
          + meet_up
       '''

      
      
  # ========== END TODO ==============
  
  parseInput = (input) ->
    carlos = new Carlos()
    switch input
              
      # fields
      when "carlos.first_name"
        output = "\"#{carlos.first_name()}\""
      when "carlos.last_name"
        output = "\"#{carlos.last_name()}\""
      when "carlos.title"
        output = "\"#{carlos.title()}\""
      when "carlos.email"
        output = "<a href=\"mailto:#{carlos.email()}\">#{carlos.email()}</a>"
      when "carlos.website"
        output = "<a href=\"#{carlos.website()}\" target=\"blank\">#{carlos.website()}</a>"
      when "carlos.description"
        output = "\"#{carlos.description()}\""
      when "carlos.skills"
        output = "<pre>#{carlos.skills()}</pre>"
      when "carlos.work_experience"
        output = "<pre>#{carlos.work_experience()}</pre>"
      when "carlos.education"
        output = carlos.education()
      when "carlos.girlfriend"
        output = "\"Ellie Fichtelman\""
              
      # commands
      when "help"
        output = "<pre>#{carlos.help()}</pre>"
      when "clear"
        clearOutput()
        
      # misc
      when "carlos"
        output = "<#Person first_name: \"#{carlos.first_name}\", last_name: \"#{carlos.last_name}\", title: \"#{carlos.title}\">"

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
    return ""
  
  $('input').keyup (e) ->
    switch e.keyCode
      when 13
        event.preventDefault()
        setOutput()
        
    false