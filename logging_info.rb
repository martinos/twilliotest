class LoggingInfo
  def initialize(app)
    @app = app
  end

  def call(env)
    req = Rack::Request.new(env)
    puts "Params:"
    puts req.params.to_yaml
    status, headers, response = @app.call(env)
    puts "Response:"
    puts response.to_s
    [status, headers, response]
  end
end
