class IngredientsController < ApplicationController
  before_action :set_ingredient, only: [:show, :edit, :update, :destroy]

  def index
    @ingredients = Ingredient.order(:name)
    respond_to do |format|
      format.html
      format.json { render json: @ingredients.tokens(params[:q])}
    end
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)

    respond_to do |format|
      if @ingredient.save
        format.html { redirect_to @ingredient }
        format.json { render action: 'show', status: :created, location: @ingredient }
      else
        format.html { render action: 'new' }
        format.json { render json: @ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @ingredient.update(ingredient_params)
        format.html { redirect_to @ingredient }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @ingredient.destroy
    respond_to do |format|
      format.html { redirect_to ingredients_url }
      format.json { head :no_content }
    end
  end

  private
    def set_ingredient
      @ingredient = Ingredient.find(params[:id])
    end

    def ingredient_params
      params.require(:ingredient).permit(:name, :ingredient_tokens => [])
    end
end
