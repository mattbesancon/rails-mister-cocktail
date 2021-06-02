class NewslettersController < ApplicationController
  before_action :set_newsletter, only: [:show, :edit, :update, :destroy]

  def index
    @newsletters = Newsletter.all
  end

  def new
    @newsletter = Newsletter.new
  end

  def create
    @newsletter = Newsletter.new(newsletter_params)
    @newsletter.save
    redirect_to newsletters_path(@newsletter)
  end

  def show
  end

  def edit
  end

  def update
    @newsletter = Newsletter.update(newsletter_params)
    redirect_to newsletters_path(@newsletter)
  end

  def destroy
    @newsletter.destroy
    redirect_to newsletters_path
  end

  def send
    @newsletter = Newsletter.find(:params[:id])
    @users = User.all
    @users.each do |user|
      Newsletter.newsletter_email(user, @newsletter).deliver
    end
  end

  private

  def set_newsletter
    @newsletter = Newsletter.find(params[:id])
  end

  def newsletter_params
    params.require(:newsletter).permit(:email)
  end
end
