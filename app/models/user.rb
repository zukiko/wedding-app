class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable

  
  with_options presence: true do
    validates :attendance
    validates :bride_groom
    validates :name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
    validates :name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'に(-)を入力してください' }
    validates :prefecture_code
    validates :city
    validates :address
    validates :email
  end

  has_one :seating_list, dependent: :destroy
  has_many :photos
end
