class NewslettersController < ApplicationController
  before_action :set_newsletter, only: [:destroy]

  def new
    @newsletter = Newsletter.new
  end

  def create
    @newsletter = Newsletter.create(newsletter_params)
    if @newsletter.save
      NewsletterMailer.newsletter_email(@newsletter).deliver
      redirect_to root_path, notice: "Thank you, you can check your inbox, you should have received an email."
    else
      redirect_to new_newsletter_path, notice: "There is an issue with your email. Please try again."      
    end
  end

  # def destroy
  #  @newsletter.destroy
  #  redirect_to newsletters_path
  # end

  private

  def set_newsletter
    @newsletter = Newsletter.find(params[:id])
  end

  def newsletter_params
    params.require(:newsletter).permit(:email)
  end
end
