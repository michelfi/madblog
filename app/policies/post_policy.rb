class PostPolicy < ApplicationPolicy
  def show?
    true # Tout le monde peut lire un post
  end

  def create?
    user.admin? || user.poster? # Seuls les admins et les posteurs peuvent créer un post
  end

  def update?
    user.admin? || user.poster? # Seuls les admins et les posteurs peuvent modifier un post
  end

  def destroy?
    if user.admin?
      true
    elsif user.poster? && user == record.user
      true
    else
      puts "L'utilisateur #{user.email} n'a pas l'autorisation de supprimer ce post."
      false
    end
  end
end
