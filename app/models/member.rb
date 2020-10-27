class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  def active_for_authentication?
    super && (self.is_deleted == false)
  end

  has_many :delivery_destinations, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :cart_items, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, presence: true, length: {maximum: 10, minimum: 1}, uniqueness: true
  validates :last_name, presence: true, length: {maximum: 10, minimum: 1}, uniqueness: true
  validates :first_name_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。'}
  validates :last_name_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。'}
  validates :postal_code, presence: true, length: {maximum: 7, minimum: 7}
  validates :address, presence: true
  validates :phone_number, presence: true
  
  def registered?(delivery_destination)
    self.delivery_destinations.where(address: delivery_destination.address, postal_code: delivery_destination.postal_code, reciever_name: delivery_destination.reciever_name).exists? || delivery_destination.postal_code == self.postal_code && delivery_destination.address == self.address
  end
  
end