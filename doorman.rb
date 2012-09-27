require "sinatra"

$ip_addresses = []

class Doorman < Sinatra::Application
  get "/" do
    $ip_addresses.map { |ip| "deny #{ip};" }.join("\n")
  end

  put "/track" do
    $ip_addresses << params[:ip_address]
  end
end
