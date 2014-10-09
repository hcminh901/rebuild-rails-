require "rulers"
$LOAD_PATH.unshift File.join(File.dirname(__FILE__), "..", "app", "controllers")
Dir["#{$:.first}/*.rb"].each {|file| require file }

module BestQuotes
  class Application < Rulers::Application
  end
end