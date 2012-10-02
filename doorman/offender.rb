require 'ohm'

class Offender < Ohm::Model
  attribute :ip_address
  attribute :incident_type
  attribute :last_incident_at

  counter :incident_count

  index :ip_address
  index :incident_type

  def self.track(ip_address, incident_type)
    params = {
      :ip_address    => ip_address,
      :incident_type => incident_type
    }

    offender = find(params).first || create(params)

    offender.incr(:incident_count)

    offender.last_incident_at = Time.now
    offender.save
  end

  def blacklisted?
    case incident_type
    when 'scraping/high_page_param'
      if incident_count.to_i > 50 && Time.now - Time.parse(last_incident_at) < 5 * 86400
        return true
      end
    end

    return false
  end

  def self.blacklist
    all.select {|o| o.blacklisted? }.map {|o| "deny #{o.ip_address};" }.join("\n")
  end
end
