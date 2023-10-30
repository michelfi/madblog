class SubscribersController < ApplicationController
  def index
    @subscribers = Subscriber.all
  end

  def create
    @subscriber = Subscriber.new(subscriber_params)
    if @subscriber.save
      NewsletterMailer.welcome_subscriber(@subscriber).deliver_now
      cookies[:saved_lead] = true
      redirect_to root_path, notice: "Votre inscription a été prise en compte."
    else
      # Traiter les erreurs de validation si nécessaire
      redirect_to root_path, alert: "Vous êtes déjà inscrit à notre Newsletter !"
    end
  end

  private

  def subscriber_params
    params.require(:subscriber).permit(:surname, :name, :email, :category)
  end
end
