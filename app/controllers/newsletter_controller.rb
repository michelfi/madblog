# app/controllers/newsletters_controller.rb
class NewslettersController < ApplicationController
  def index
    @newsletters = Newsletter.all
  end

  def new
    @newsletter = Newsletter.new
  end

  def create
    @subscriber = Subscriber.new(subscriber_params)

    respond_to do |format|
      if @subscriber.save
        # Tell the NewsletterMailer to send a welcome email after save
        NewsletterMailer.welcome_subscriber(@subscriber).deliver_later

        format.html { redirect_to root_path, notice: 'Votre inscription a été prise en compte.' }
        format.json { render json: @subscriber, status: :created, location: @subscriber }
      else
        format.html { redirect_to root_path, alert: 'Vous êtes déjà inscrit à notre Newsletter !' }
        format.json { render json: @subscriber.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def newsletter_params
    params.require(:newsletter).permit(:subject, :content)
  end
end
