class NewslettersController < ApplicationController
  before_action :set_newsletter, only: [:destroy]

  def new
    @newsletter = Newsletter.new
  end

  def create
    @newsletter = Newsletter.new(newsletter_params)
    @newsletter.save
    redirect_to newsletters_path(@newsletter)
  end

  def destroy
    @newsletter.destroy
    redirect_to newsletters_path
  end

  def send
    @newsletter = Newsletter.find(:params[:email])
    Newsletter.newsletter_email(@newsletter.email, @newsletter).deliver
  end

  private

  def set_newsletter
    @newsletter = Newsletter.find(params[:id])
  end

  def newsletter_params
    params.require(:newsletter).permit(:email)
  end
end
