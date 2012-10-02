require File.dirname(__FILE__) + '/spec_helper'
require File.dirname(__FILE__) + '/../lib/doorman/offender'

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

  it "blacklists a scraping/high_page_param offender after 50 requests" do
    51.times { Offender.track "10.10.0.1", "scraping/high_page_param" }

    offender = Offender.find(:ip_address => "10.10.0.1", :incident_type => "scraping/high_page_param").first

    assert offender.blacklisted?
  end
end
