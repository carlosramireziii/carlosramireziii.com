$ ->
  
  console = new Console $('input'), $('#output')
  
  # listen for 'enter' key to be pressed within the input field
  $('input').keyup (e) ->
    switch e.keyCode
      when 13
        event.preventDefault()
        output = console.parseInput()
        console.setOutput output
        $('#console').animate
          scrollTop: 999999,
          'slow'
    false
    
  # add typewriter effect for automated console input
  $('.typewrite').typewrite
    typeSpeed: 60,
    complete: ->
      console.setOutput Carlos.inspect()
      $('#prompt').show()
      $('input').focus()