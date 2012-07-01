require 'yaml'

class EnvLogger
  def initialize(app, logger)
    @app = app
    @log = logger
  end

  def call(env)
    @log.info(env.to_yaml)
    @app.call(env)
  end
end
