class ResponseLogger
  def initialize(app, logger)
    @app = app
    @log = logger
  end

  def call(env)
    status, headers, body = @app.call(env)
    response = Rack::Response.new(body, status, headers)
    @log.info "Response:"
    @log.info response.body.first
    [status, headers, body]
  end
end

