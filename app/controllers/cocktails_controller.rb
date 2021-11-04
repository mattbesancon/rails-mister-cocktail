class CocktailsController < ApplicationController
  # Full check of controllers
  def index
    if params[:query].present?
      sql_query = " \
        cocktails.name ILIKE :query \
        OR ingredients.name ILIKE :query \
      "
      @cocktails = Cocktail.joins(:ingredients).where(sql_query, query: "%#{params[:query]}%")
    else
      @cocktails = Cocktail.all
    end
  end

  def show
    @cocktail = Cocktail.find(params[:id])
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    @cocktail.save
    redirect_to cocktails_path
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo)
  end
end
