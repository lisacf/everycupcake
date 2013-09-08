class MeasuresController < ApplicationController
  before_action :set_measure, only: [:show, :edit, :update, :destroy]

  def index
    @measures = Measure.all
  end

  def show
    
  end

  def new
    @measure = Measure.new
  end

  def edit
  end

  def create
    @measure = Measure.new(measure_params)

    respond_to do |format|
      if @measure.save
        format.html { redirect_to @measure, notice: 'Measure was successfully created.' }
        format.json { render action: 'show', status: :created, location: @measure }
      else
        format.html { render action: 'new' }
        format.json { render json: @measure.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @measure.update(measure_params)
        format.html { redirect_to @measure, notice: 'Measure was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @measure.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @measure.destroy
    respond_to do |format|
      format.html { redirect_to measures_url }
      format.json { head :no_content }
    end
  end

  private
    def set_measure
      @measure = Measure.find(params[:id])
    end

    def measure_params
      params.require(:measure).permit(:name)
    end
end
