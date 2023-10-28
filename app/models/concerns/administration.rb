module Administration
  extend ActiveSupport::Concern

  def can_change_user_type?
    admin?
  end
end
