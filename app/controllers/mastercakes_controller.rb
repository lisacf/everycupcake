class MastercakesController < ApplicationController
  before_action :set_mastercake, only: [:show, :edit, :update, :destroy]

  def index
    @mastercakes = Mastercake.all
  end

  def show
    @cake_recipes = @mastercake.recipes.where(cupcake_part: "cake")
    @filling_recipes = @mastercake.recipes.where(cupcake_part: "filling")
    @frosting_recipes = @mastercake.recipes.where(cupcake_part: "frosting")
    @rateable = @mastercake
    @ratings = @rateable.ratings
    @rating = Rating.new
  end

  def new
    @mastercake = Mastercake.new
  end

  def edit
  end

  def create
    @mastercake = Mastercake.new(mastercake_params)
    @mastercake.update_attribute(:user_id, current_user.id)

    respond_to do |format|
      if @mastercake.save
        logger.debug "THIS IS IN CREATE: #{@mastercake.key}"

        format.html { redirect_to @mastercake, notice: 'Mastercake was successfully created.' }
        format.json { render action: 'show', status: :created, location: @mastercake }
      else
        format.html { render action: 'new' }
        format.json { render json: @mastercake.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @mastercake.update(mastercake_params)
        format.html { redirect_to @mastercake, notice: 'Mastercake was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @mastercake.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @mastercake.destroy
    respond_to do |format|
      format.html { redirect_to mastercakes_url }
      format.json { head :no_content }
    end
  end

  private
    def set_mastercake
      @mastercake = Mastercake.find(params[:id])
    end

    def mastercake_params
      params.require(:mastercake).permit(:name, :description, :source, :image, :remote_image_url,
                                         :recipe_ids, :user_id, :average_rating)
    end
end
