class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  with_options presence: true do
    validates :nickname,         length: { maximum: 40 }
    validates :last_name,        format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :fast_name,        format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :last_name_kana,   format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :fast_name_kana,   format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :birth_date
  end
end
