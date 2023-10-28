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
    user.admin? || user.poster? # Seuls les admins et les posteurs peuvent supprimer un post
  end
end

