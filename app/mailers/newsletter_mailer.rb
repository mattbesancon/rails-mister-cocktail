class NewsletterMailer < ApplicationMailer
  default :from => "rails-mister-cocktail@gmail.com"

  def newsletter_email(newsletter)
    @newsletter = newsletter
    mail(:to => @newsletter.email, :subject => "Congrats for your suscription to the newsletter")
  end
end
