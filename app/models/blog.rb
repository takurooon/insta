class Blog < ApplicationRecord

  belongs_to :user

  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user

  validates :content, length: {minimum:1}
  validates :content, length: {maximum:140}
  validates :picture, presence:true

  mount_uploader :picture, PictureUploader


end
