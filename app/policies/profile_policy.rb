class ProfilePolicy
  def show?
    # Vous pouvez mettre ici votre logique d'autorisation.
    # Par exemple, vérifier si l'utilisateur actuel peut voir ce profil.
    # Renvoyez true si l'utilisateur est autorisé, false sinon.
    user.present?
  end
end
