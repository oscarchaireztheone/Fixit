class Order < ApplicationRecord
  belongs_to :customer
  belongs_to :agent
  belongs_to :technician

  has_many :payments
end
