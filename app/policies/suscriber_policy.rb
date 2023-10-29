class SubscriberPolicy < ApplicationPolicy
  # Vous n'avez pas besoin de définir de méthode index? ici, car elle est déjà définie dans ApplicationPolicy.
  def index?
    true # Tout le monde peut voir la liste des abonnés
  end
end
