class SubscriptionsController < ApplicationController
  # Autres actions du contrôleur (index, show, update, destroy, etc.)

  def subscribe
    @subscriber = Subscriber.find(params[:subscriber_id])
    @newsletter = Newsletter.find(params[:newsletter_id])
    if Subscription.create(subscriber: @subscriber, newsletter: @newsletter)
      redirect_to root_path, notice: "Abonnement à la newsletter réussi."
    else
      redirect_to root_path, alert: "Échec de l'abonnement à la newsletter."
    end
  end

  def unsubscribe
    @subscriber = Subscriber.find(params[:subscriber_id])
    @newsletter = Newsletter.find(params[:newsletter_id])
    @subscription = Subscription.find_by(subscriber: @subscriber, newsletter: @newsletter)
    if @subscription&.destroy
      redirect_to root_path, notice: "Désabonnement de la newsletter réussi."
    else
      redirect_to root_path, alert: "Échec du désabonnement de la newsletter."
    end
  end
end
