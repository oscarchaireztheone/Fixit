class Samsungcall < ApplicationRecord
	before_validation :set_default_phone, on: :create
	belongs_to :day, optional: true


	def set_default_phone
	    self.phone1 ||= 'none'
	    self.phone2 ||= 'none'
	end
end
