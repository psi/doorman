require "doorman"

use Rack::ShowExceptions

run Doorman.new
