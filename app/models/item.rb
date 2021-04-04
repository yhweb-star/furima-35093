class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :postage
  belongs_to :shipping_area
  belongs_to :shipping_days

  validates :title, :introduction, :price, presence: true
  validates :category_id, :status_id, :postage_id, :shipping_area_id, :shipping_days_id, numericality: { other_than: 1 } 
end
