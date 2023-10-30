class Newsletter < ApplicationRecord
  has_many :subscriptions

  validates :subject, presence: true
  validates :content, presence: true
end
