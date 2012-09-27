require File.dirname(__FILE__) + '/../doorman'
require 'minitest/autorun'
require 'rack/test'

ENV['RACK_ENV'] = 'test'

include Rack::Test::Methods

def app
  Doorman
end

describe Doorman do
  it "tracks an IP address" do
    put "/track", {:ip_address => "10.10.0.1"}

    assert last_response.ok?
    assert_equal last_response.body, "10.10.0.1"
  end

  it "lists abusive IPs" do
    get "/"

    assert last_response.ok?
    assert last_response.body.include?("deny 10.10.0.1;")
  end
end
