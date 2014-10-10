require "erubis"
require "rulers/file_model"

module Rulers
  class Controller
    include Rulers::Model
    def initialize env
      @env = env
    end

    def env
      @env
    end

    def request
      @request ||= Rack::Request.new @env
    end

    def params
      request.params
    end

    def render view_name, locals = {}
      local = locals
      filename = File.join "app", "views", controller_name, "#{view_name}.html.erb"
      template = File.read filename
      eruby = Erubis::Eruby.new template
      self.instance_variables.each do |variable|
        local = local.merge(:"#{variable}" => self.instance_variable_get(:"#{variable}"))
      end
      eruby.result local
    end

    def controller_name
      klass = self.class
      klass = klass.to_s.gsub /Controller$/, ""
      Rulers.to_underscore klass
    end

    def response text, status = 200, headers = {}
      raise "Already responded!" if @response
      a = [text].flatten
      @response = Rack::Response.new a, status, headers
    end

    def get_response
      @response
    end

    def render_response *args
      response render(*args)
    end
  end
end