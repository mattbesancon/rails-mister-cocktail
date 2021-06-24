class NewsletterMailer < ApplicationMailer
  default :from => "rails-mister-cocktail@gmail.com"
  # TODO: see how to integrate mailgun & use my personnal email address

  def newsletter_email(newsletter)
    @newsletter = newsletter
    mail(:to => @newsletter.email, :subject => "Congrats for your suscription to the newsletter")
  end
end
