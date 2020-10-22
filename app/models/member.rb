class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :delivery_destinations
  has_many :orders
  has_many :cart_items
  has_many :items, through: :cart_items
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, presence: true, length: {maximum: 10, minimum: 1}, uniqueness: true
  validates :last_name, presence: true, length: {maximum: 10, minimum: 1}, uniqueness: true
  validates :first_name_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。'}
  validates :last_name_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。'}
  validates :postal_code, presence: true, length: {maximum: 7, minimum: 7}
  validates :address, presence: true
  validates :phone_number, presence: true

end