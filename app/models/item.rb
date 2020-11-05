class Item < ApplicationRecord
  belongs_to :user, optional: true
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :postage_player
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :shipping_date

  with_options presence: true do  
    validates :image
    validates :name,              length: { maximum: 40 }
    validates :description,       length: { maximum: 1000 }
    validates :category
    validates :category_id,       numericality: { other_than: 1 }
    validates :condition
    validates :condition_id,      numericality: { other_than: 1 }
    validates :postage_player
    validates :postage_player_id, numericality: { other_than: 1 } 
    validates :shipping_area
    validates :shipping_area_id,  numericality: { other_than: 1 } 
    validates :shipping_date
    validates :shipping_date_id,  numericality: { other_than: 1 } 
    validates :price,             format: { with: /\A[0-9]+\z/ }, numericality:{ greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  end
end
