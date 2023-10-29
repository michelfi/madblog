# app/policies/user_policy.rb

class UserPolicy < ApplicationPolicy
  def show?
    # Autoriser l'accès à la page du profil de l'utilisateur
    # Vous pouvez personnaliser cette logique selon vos besoins.
    # Par exemple, vous pouvez autoriser seulement les utilisateurs connectés à voir leur propre profil.
    # Dans ce cas, vous pouvez vérifier si l'utilisateur actuel est le même que l'utilisateur du profil.
    # Par exemple :
    # user == record
    user.present?
  end
end
