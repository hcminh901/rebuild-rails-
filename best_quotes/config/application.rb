require "rulers"
$LOAD_PATH.unshift File.join(File.dirname(__FILE__), "..", "app", "controllers")

module BestQuotes
  class Application < Rulers::Application
  end
end