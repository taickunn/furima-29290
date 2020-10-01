class Purchaser < ApplicationRecord
  belongs_to :item
  belongs_to :user
  has_one :orders

end
