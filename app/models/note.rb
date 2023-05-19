class Note < ApplicationRecord
	validates :phone_number, presence: true
end
