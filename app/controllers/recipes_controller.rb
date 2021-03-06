class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user,  only: [:new, :create, :edit, :update, :destroy]

  def index
    @recipes = Recipe.all
  end

  def show
  end

  def new
  end
  def cake
    @recipe = Recipe.new
    @cupcake_part = "cake"
  end
  def filling
    @recipe = Recipe.new
    @cupcake_part = "filling"
  end
  def frosting
    @recipe = Recipe.new
    @cupcake_part = "frosting"
  end

  def edit
    @cupcake_part = @recipe.cupcake_part
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.update_attribute(:user_id, current_user.id)

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to mastercake_path(@recipe.mastercakes.last), notice: 'Recipe was successfully created.' }
        format.json { render action: 'show', status: :created, location: @recipe }
      else
        format.html { render action: 'new' }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html { redirect_to mastercake_path(@recipe.mastercakes[0]), notice: 'Recipe was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @recipe.destroy
    respond_to do |format|
      format.html { redirect_to recipes_url }
      format.json { head :no_content }
    end
  end

  private
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    def recipe_params
      params.require(:recipe).permit( :name, :user_id, :cupcake_part, :ingredient_tokens, :mastercake_ids,
                                      proportions_attributes: [:_destroy, :id, :recipe_id, :ingredient_id, :measure_id, :unit_id, :ingredient_token],
                                      instructions_attributes: [:_destroy, :id, :recipe_id, :content, :preheat, :baketemp, :baketime, :preptime],
                                      ingredients_attributes: [:ingredient_tokens, :id, :name])
    end
end
