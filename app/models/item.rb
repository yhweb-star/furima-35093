class Item < ApplicationRecord
  belongs_to :user
  has_one :order, dependent: :destroy
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :postage
  belongs_to :shipping_area
  belongs_to :shipping_days

  with_options presence: true do
    validates :title
    validates :introduction
    validates :image
    with_options numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999,
                                 message: 'Out of setting range' } do
      validates :price
    end
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :postage_id
    validates :shipping_area_id
    validates :shipping_days_id
  end
end
