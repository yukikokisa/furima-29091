class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, :last_name, :fast_name, :last_name_kana, :fast_name_kana, :birth_date ,presence: true
  has_many :items
end
