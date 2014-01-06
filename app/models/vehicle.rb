class Vehicle < ActiveRecord::Base

	has_many :reservations
	has_one :driver, :through => :reservations
end
