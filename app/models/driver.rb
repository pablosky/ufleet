class Driver < ActiveRecord::Base
	has_many :reservations
	has_one :vehicle, :through => :reservations
	
end
