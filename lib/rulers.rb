require "rulers/version"
require "rulers/array"

class Rulers::Application
  def call env
    `echo debug > debug.txt`;
    [200, {"Content-Type" => "text/html"}, ["Hello from Ruby on Rulers"]]
  end
end
