# Logs the params of the request
class ParamsLogger
  def initialize(app, logger)
     @app = app
     @log = logger
   end

   def call(env)
     req = Rack::Request.new(env)
     @log.info "Params:"
     @log.info req.params.to_yaml
     status, headers, body = @app.call(env)
     [status, headers, body]
   end
end

