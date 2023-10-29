class User < ApplicationRecord
  before_create :set_default_user_type
  # Associations
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one_attached :avatar

  # Validations
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }
  validates :user_type, presence: true, inclusion: { in: %w[admin poster user] }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def admin?
  user_type == "admin"
  end

  def poster?
    user_type == "poster"
    end

  include Administration

  validate :check_user_type_change, on: :update

  def check_user_type_change
    errors.add(:user_type, "Vous ne pouvez pas changer le user_type.") if user_type_changed? && !can_change_user_type?
  end

  private

  def set_default_user_type
    self.user_type ||= 'user'
  end
end
