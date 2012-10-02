require "sinatra"
require "doorman/offender"

class Doorman < Sinatra::Application
  get "/" do
    Offender.blacklist
  end

  put "/track" do
    Offender.track(params[:ip_address], params[:incident_type])
  end
end