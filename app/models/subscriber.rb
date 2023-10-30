class Subscriber < ApplicationRecord
  has_many :subscriptions
  
  validates :surname, presence: true
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :category, presence: true
end
