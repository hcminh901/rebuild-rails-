Dir["#{File.expand_path(File.dirname(__FILE__))}/rulers/*.rb"].each {|f| require f }

module Rulers
  class Application
    def call env
      if env["PATH_INFO"] == "/favicon.ico"
        return [404, {"Content-Type" => "text/html"}, []]
      end
      rack_app = get_rack_app env
      rack_app.call env
      # controller = klass.new env
      # text = controller.send act
      # if controller.get_response
      #   st, hd, rs = controller.get_response.to_a
      #   [st, hd, [rs.body].flatten]
      # else
      #   [200, {'Content-Type' => 'text/html'}, [text]]
      # end
    end
  end
end