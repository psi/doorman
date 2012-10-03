require File.dirname(__FILE__) + "/lib/doorman"

use Rack::ShowExceptions

run Doorman::App.new
