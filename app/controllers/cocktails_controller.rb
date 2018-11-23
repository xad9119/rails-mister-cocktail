class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:show, :update, :destroy, :edit]
  def show
    @dose = Dose.new(cocktail_id: @cocktail.id)
  end

  def index
    @cocktails = Cocktail.all
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    cocktail = Cocktail.new(cocktail_params)
    if cocktail.valid?
      @cocktail = cocktail
      @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      @cocktail = cocktail
      render new_cocktail_path
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo)
  end
end
