class MastercakesController < ApplicationController
  before_action :set_mastercake, only: [:show, :edit, :update, :destroy]

  def index
    @mastercakes = Mastercake.all
    # @uploader = Mastercake.new.image
    # @uploader.success_action_redirect = new_mastercake_url
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
    # @mastercake = Mastercake.new(key: params[:key])
  end

  def edit
  end

  def create
    # if params[:mastercake][:image_url]
    #   @image_url = params[:mastercake][:image_url]
    #   @current_cake_id = request.referer.split("/").last
    #   @mastercake= Mastercake.find(@current_cake_id)
    #   @mastercake.update_attribute(:image_url, @image_url)
    # else
      @mastercake = Mastercake.new(mastercake_params)
      @mastercake.update_attribute(:user_id, current_user.id)
    # end
    respond_to do |format|
      if @mastercake.save
        format.html { redirect_to @mastercake, notice: 'Cupcake was successfully created.' }
        format.json { render action: 'show', status: :created, location: @mastercake }
      else
        format.html { render action: 'new' }
        format.json { render json: @mastercake.errors, status: :unprocessable_entity }
      end
      format.js
    end
  end

  def update
    respond_to do |format|
      if @mastercake.update(mastercake_params)
        format.html { redirect_to @mastercake, notice: 'Cupcake recipe was successfully updated.' }
        format.js
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.js 
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
      params.require(:mastercake).permit(:name, :description, :source, :image_url, :image, :remote_image_url, :key,
                                         :recipe_ids, :user_id, :average_rating, :complete)
    end
end
