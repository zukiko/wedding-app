class Photo < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :image, presence: { message: 'を選択してください' }
  validates :text, presence: true
end
