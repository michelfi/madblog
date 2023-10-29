class PagesController < ApplicationController
  def home
    @posts = Post.order(created_at: :desc)
    @subscriber = Subscriber.new
  end

 def create
  @subscriber = Subscriber.new(subscriber_params)
  if @subscriber.save
    cookies[:saved_lead] = true
    redirect_to root_path, notice: "Votre inscription a été prise en compte."
  else
    # Traiter les erreurs de validation si nécessaire
    redirect_to root_path, alert: "Il y a eu un problème lors de votre inscription."
  end
end

  private

  def subscriber_params
    params.require(:subscriber).permit(:surname, :name, :email)
  end
end
