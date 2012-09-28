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

  def self.blacklist
    all.map {|o| "deny #{o.ip_address};" }.join("\n")
  end
end
