class Agent < ApplicationRecord
	has_many :orders
	has_one :crew, as: :assignable

end
