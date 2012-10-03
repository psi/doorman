require "sinatra"
require "doorman/offender"

module Doorman
  class App < Sinatra::Application
    get "/" do
      Offender.blacklist
    end

    put "/track" do
      Offender.track(params[:ip_address], params[:incident_type])
    end
  end
end
