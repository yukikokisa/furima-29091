class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items  
      
  validates :nickname,        presence: true, length: { maximum: 40 }
  validates :last_name,       presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :fast_name,       presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :last_name_kana,  presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :fast_name_kana,  presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :birth_date ,     presence: true
end
