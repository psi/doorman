require File.dirname(__FILE__) + '/../doorman/offender'
require 'minitest/autorun'

describe Offender do
  before do
    Offender.all.each do |offender|
      offender.delete
    end
  end

  it "creates a new offender" do
    Offender.track "10.10.0.1", "scraping"
    assert Offender.find(:ip_address => "10.10.0.1")
  end

  it "increments the incident_count" do
    2.times { Offender.track "10.10.0.1", "scraping" }

    offender = Offender.find(:ip_address    => "10.10.0.1",
                             :incident_type => "scraping").first

    assert_equal offender.incident_count, 2
  end
end
