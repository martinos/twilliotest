require "rubygems"
require "bundler/setup"

require 'rack'
require 'logger'
require 'thin'
require 'yaml'
require './lib/rack/response_logger'
require './lib/rack/params_logger'
require './lib/rack/env_logger'
require './lib/twilio_test'

logger = Logger.new(STDOUT)
#use Rack::ShowExceptions
use ParamsLogger, logger
#use ResponseLogger, logger
#use Rack::CommonLogger
use Rack::Logger
use Rack::ShowStatus
use Rack::Lint
use EnvLogger, logger
run TwilioTest.new
