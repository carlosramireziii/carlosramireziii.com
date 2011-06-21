/**
 * typewrite - A jQuery plugin to simulate typing
 * Examples and documentation at: http://adamchambers.me/typewrite
 * Version: 1.0.0 (20/05/2011)
 * Copyright (c) 2011 Adam Chambers
 * Licensed under the GNU General Public License v3: http://www.gnu.org/licenses/gpl.html
 * Requires: jQuery v1.5.1+
 */

(function($){

  $.fn.typewrite = function(options) {
  
    var settings = {
      'typeSpeed' : 200,
      'delay' : 0,
      'fade' : 0,
      'cursor' : '|',
      'complete' : null
    };
    
    if(options) { 
      $.extend(settings, options);
    }
    
    return this.each(function() {
      
      var $this = $(this),
          content = $this.html(),
          contentSplit = content.split(''), // split content at every letter
          html = false, // record start of HTML in text
          newContent = '',
          i = 0,
          j = 0,
          writeContent;
        
      for(i = 0; i < contentSplit.length; i++) {
          
          // if we find a '<' tag and HTML is false then this is beginning of HTML tag
          if(contentSplit[i] === '<' && html === false) {
            
            // add first span tag and set html to true
            newContent += '<span style="display: none;">'+contentSplit[i];
            html = true;
          
          // if we find a '>' and html is true then this is the end of HTML tag
          } else if(contentSplit[i] === '>' && html === true) {
            
            // close span and set html to false
            newContent += contentSplit[i]+'</span>';
            html = false;
          
          /**
           * if we find any character other than '>' and html is set to true then this
           * is inside HTML tag and should just be added straight to the newContent string
           */
          } else if(contentSplit[i] !== '>' && html === true) {
            
            newContent += contentSplit[i];
          
          // anything else is a regular character so wrap in <span>
          } else {
            
            newContent += '<span style="display: none;">'+contentSplit[i]+'</span>';
            
          }
      }
      
      // timeout for delay defaults at 0
      setTimeout(function() {
        
        // add cursor simulation to end of string and show parent
        $this.html(newContent+settings.cursor).show();
          
        writeContent = setInterval(function() {
            
            // add a letter at a time
            if(settings.fade > 0) {
              $this.find('span').eq(j).fadeIn(settings.fade);
            } else {
              $this.find('span').eq(j).show();
            }
            
            if(j === $this.find('span').length) {
                
                clearInterval(writeContent);
                
                // add original content back in
                $this.html(content);
                
                // callback
                if($.isFunction(settings.complete)) {
                  settings.complete();
                }
                
            } else {
                j++;
            }
              
        }, settings.typeSpeed);
      
      }, settings.delay);
    
    });
    
  };
  
})( jQuery );