class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :postage
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_day

  belongs_to :user
  has_one_attached :image

  with_options presence: true do

  validates :name, :description, :price, :image

  validates :category_id, :condition_id, :postage_id, :prefecture_id, :shipping_day_id, numericality: { other_than: 1 }

  validates :name, length: { maximum: 40 }

  validates :description, length: { maximum: 1000 } 

  validates :price, numericality: { greater_than: 299}

  validates :price, numericality: { less_than: 9999999}
  
  validates :price, format: {with: /\A[0-9]+\z/}
  end

end
