class Location < ActiveRecord::Base
	belongs_to :provider
	validates :street1, uniqueness: true
end
