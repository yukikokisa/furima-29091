class Item < ApplicationRecord
  belongs_to :user, optional: true
  has_one :order
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :postage_player
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :shipping_date

  with_options presence: true do
    validates :image, :category, :condition, :postage_player, :shipping_area, :shipping_date
    validates :name,              length: { maximum: 40 }
    validates :description,       length: { maximum: 1000 }
    validates :category_id, numericality: { other_than: 1 }
    validates :condition_id, numericality: { other_than: 1 }
    validates :postage_player_id, numericality: { other_than: 1 }
    validates :shipping_area_id, numericality: { other_than: 1 }
    validates :shipping_date_id,  numericality: { other_than: 1 }
    validates :price,             format: { with: /\A[0-9]+\z/ }, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end
end
