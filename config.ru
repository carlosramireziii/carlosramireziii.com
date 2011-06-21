=begin
require 'rubygems'
require 'middleman'

run Middleman::Server
=end

use Rack::Static, 
  :urls => ["/stylesheets", "/images", "/javascripts", "/carlos_ramirez_iii_resume.pdf"],
  :root => "build"

run lambda { |env|
  [
    200, 
    {
      'Content-Type'  => 'text/html', 
      'Cache-Control' => 'public, max-age=86400' 
    },
    File.open('build/index.html', File::RDONLY)
  ]
}