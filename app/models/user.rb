class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable

  
  with_options presence: true do
    validates :attendance
    validates :bride_groom
    validates :name
    validates :name_kana
    validates :postal_code
    validates :prefecture_code
    validates :city
    validates :address
    validates :email
  end

  has_one :seating_list, dependent: :destroy
end
