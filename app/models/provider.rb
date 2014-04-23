class Provider < ActiveRecord::Base
	validates :npi, uniqueness: true
	has_many :locations
	has_many :services
end
