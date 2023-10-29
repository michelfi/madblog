class Subscriber < ApplicationRecord
  validates :surname, presence: true
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end
