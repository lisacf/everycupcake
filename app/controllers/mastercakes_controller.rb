class MastercakesController < ApplicationController
  before_action :set_mastercake, only: [:show, :edit, :update, :destroy]

  # GET /mastercakes
  # GET /mastercakes.json
  def index
    @mastercakes = Mastercake.all
  end

  # GET /mastercakes/1
  # GET /mastercakes/1.json
  def show
    @cake_recipes = @mastercake.recipes.where(cupcake_part: "cake")
    @filling_recipes = @mastercake.recipes.where(cupcake_part: "filling")
    @frosting_recipes = @mastercake.recipes.where(cupcake_part: "frosting")
  end

  # GET /mastercakes/new
  def new
    @mastercake = Mastercake.new
  end

  # GET /mastercakes/1/edit
  def edit
  end

  # POST /mastercakes
  # POST /mastercakes.json
  def create
    @mastercake = Mastercake.new(mastercake_params)
    @mastercake.update_attribute(:user_id, current_user.id)

    respond_to do |format|
      if @mastercake.save
        format.html { redirect_to @mastercake, notice: 'Mastercake was successfully created.' }
        format.json { render action: 'show', status: :created, location: @mastercake }
      else
        format.html { render action: 'new' }
        format.json { render json: @mastercake.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mastercakes/1
  # PATCH/PUT /mastercakes/1.json
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

  # DELETE /mastercakes/1
  # DELETE /mastercakes/1.json
  def destroy
    @mastercake.destroy
    respond_to do |format|
      format.html { redirect_to mastercakes_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mastercake
      @mastercake = Mastercake.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mastercake_params
      params.require(:mastercake).permit(:name, :description, :source, :image, :remote_image_url, :recipe_ids, :user_id)
    end
end
