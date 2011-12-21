/**
 * typewrite - A jQuery plugin to simulate typing
 * Examples and documentation at: http://adamchambers.me/typewrite
 * Version: 1.0.0 (20/05/2011)
 * Copyright (c) 2011 Adam Chambers
 * Licensed under the GNU General Public License v3: http://www.gnu.org/licenses/gpl.html
 * Requires: jQuery v1.5.1+
 */
(function(a){a.fn.typewrite=function(b){var c={typeSpeed:200,delay:0,fade:0,cursor:"|",complete:null};return b&&a.extend(c,b),this.each(function(){var b=a(this),d=b.html(),e=d.split(""),f=!1,g="",h=0,i=0,j;for(h=0;h<e.length;h++)e[h]==="<"&&f===!1?(g+='<span style="display: none;">'+e[h],f=!0):e[h]===">"&&f===!0?(g+=e[h]+"</span>",f=!1):e[h]!==">"&&f===!0?g+=e[h]:g+='<span style="display: none;">'+e[h]+"</span>";setTimeout(function(){b.html(g+c.cursor).show(),j=setInterval(function(){c.fade>0?b.find("span").eq(i).fadeIn(c.fade):b.find("span").eq(i).show(),i===b.find("span").length?(clearInterval(j),b.html(d),a.isFunction(c.complete)&&c.complete()):i++},c.typeSpeed)},c.delay)})}})(jQuery)