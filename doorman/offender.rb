require 'ohm'

class Doorman::Offender < Ohm::Model
  attribute :ip_address
  attribute :offense_type
  attribute :last_offense_at

  counter :offense_count

  index :ip_address
end
