class UnitsController < ApplicationController
  before_action :set_unit, only: [:show, :edit, :update, :destroy]

  def index
    @units = Unit.all
  end

  def show
  end

  def new
    @unit = Unit.new
  end

  def edit
  end

  def create
    @unit = Unit.new(unit_params)

    respond_to do |format|
      if @unit.save
        format.html { redirect_to @unit, notice: 'Unit was successfully created.' }
        format.json { render action: 'show', status: :created, location: @unit }
      else
        format.html { render action: 'new' }
        format.json { render json: @unit.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @unit.update(unit_params)
        format.html { redirect_to @unit, notice: 'Unit was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @unit.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @unit.destroy
    respond_to do |format|
      format.html { redirect_to units_url }
      format.json { head :no_content }
    end
  end

  private
    def set_unit
      @unit = Unit.find(params[:id])
    end

    def unit_params
      params.require(:unit).permit(:name)
    end
end
