class Day < ApplicationRecord
	has_many :samsungcalls, dependent: :nullify
end
