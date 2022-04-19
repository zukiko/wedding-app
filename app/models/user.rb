class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable

    validates :attendance, presence: { message: "を選択して下さい" }
    validates :bride_groom, presence: { message: "を選択して下さい" }

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, {presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }}

  with_options presence: true do
    validates :name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
    validates :name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/ , message: "に(-)を入力してください" }
    validates :prefecture_code
    validates :city
    validates :address
  end

  has_one :seating_list, dependent: :destroy
  has_many :photos
end
