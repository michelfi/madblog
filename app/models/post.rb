class Post < ApplicationRecord
  # Associations
  has_many :comments, dependent: :destroy
  belongs_to :user
  has_one_attached :image
  has_one_attached :video

  # Validations
  validates :title, presence: true
  validates :category, presence: true
  validates :content, presence: true
end
