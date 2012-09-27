require "bouncer"

use Rack::ShowExceptions

run Bouncer.new
