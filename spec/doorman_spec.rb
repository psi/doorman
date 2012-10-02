require File.dirname(__FILE__) + '/spec_helper'
require File.dirname(__FILE__) + '/../doorman'
require 'rack/test'

ENV['RACK_ENV'] = 'test'

include Rack::Test::Methods

def app
  Doorman
end

describe Doorman do
  before do
    Offender.all.each do |offender|
      offender.delete
    end
  end

  it "tracks an IP address" do
    put "/track", {:ip_address => "10.10.0.1", :incident_type => "scraping/high_page_param"}

    assert last_response.ok?
  end

  it "lists abusive IPs" do
    51.times { put "/track", {:ip_address => "10.10.0.1", :incident_type => "scraping/high_page_param"} }
    get "/"

    assert last_response.ok?
    assert last_response.body.include?("deny 10.10.0.1;")
  end
end
