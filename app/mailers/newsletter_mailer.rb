class NewsletterMailer < ApplicationMailer
  default :from => "rails-mister-cocktail@gmail.com", :content_type => "multipart/mixed"

  def newsletter_email
    @newsletter = newsletter
    mail(:to => newsletter.email, :subject => newsletter.subject)
  end
end
