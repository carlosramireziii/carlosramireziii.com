class Carlos

  # fields
  @first_name: "Carlos"
  @last_name: "Ramirez III"
  @title: "Software Engineer"
  @email: "carlosramireziii@me.com"
  @website: "http://www.carlosramireziii.me"
  @description: "Experienced software engineer with focus on Ruby on Rails web application development. Staunch believer in programming best practices, test-driven development, and agile methodology. Able to communicate effectively with clients and colleagues. Passion for writing clear, concise, readable code. Possess a perpetual desire teach, learn from, and cooperate with others."
  @skills: '''
    { 
      :specialties => ["Ruby", "JavaScript/CoffeeScript", "CSS/Sass", "HTML5"],
      :frameworks => ["Ruby on Rails", "jQuery"],
      :testing_tools => ["Test::Unit", "MiniTest", "RSpec"],
      :databases => ["PostgreSQL", "SQLite3", "MySQL", "MongoDB"],
      :platforms => ["Mac OSX", "Linux", "FreeBSD", "Windows"],
      :other => ["C#", "VB.NET", "Java", "C/C++", "XAML", "WPF", "WCF"] 
    }
    '''
  @work_experience: '''
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
  @education: "<#School name: \"Williams College\", grad_year: 2008, degree: \"Bachelor of Arts in Computer Science\">"
  @uml: '''
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
      + print
      + contact
      + follow
      + connect
      + meet
      + to_s
      + inspect
   '''

  # methods
  @print: ->
    window.open("../carlos_ramirez_iii_resume.pdf")
  @contact: ->
    window.open("mailto:#{@email}", "_parent")
  @follow: ->
    window.open("http://www.twitter.com/cramireziii")
  @connect: ->
    window.open("http://www.linkedin.com/pub/carlos-ramirez-iii/35/a/432")
  @meet: ->
    window.open("http://www.meetup.com/Long-Island-Rails-Road/")
  @to_s: ->
    return "#{@first_name} #{@last_name}"
  @inspect: ->
    return "<#Person first_name: \"#{@first_name}\", last_name: \"#{@last_name}\", title: \"#{@title}\">"

# This adds this class definition to the global namespace  
root = exports ? this
root.Carlos = Carlos