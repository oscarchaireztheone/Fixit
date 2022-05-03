class Payment < ApplicationRecord
  belongs_to :order
  has_many :receipts
end
