class Post < ApplicationRecord
  # Associations
  has_many :comments
  belongs_to :users

  # Validations
  validates :title, presence: true
  validates :category, presence: true
  validates :content, presence: true
  validates :images, presence: true
end
