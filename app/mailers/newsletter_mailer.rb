class NewsletterMailer < ApplicationMailer
  default from: 'michel.figueres@gmail.com'

  def welcome_subscriber(subscriber)
    @subscriber = subscriber
    @url = 'http://example.com/login' # Lien pour se connecter à votre site
    mail(to: @subscriber.email, subject: 'Bienvenue à notre Newsletter !')
  end
end
