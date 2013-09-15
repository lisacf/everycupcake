class StoresController < ApplicationController
  http_basic_authenticate_with :name => ENV["NAME"], :password => ENV["PASSWORD"]
  def index
    @stores = Store.all
  end

  def show

  end

  def new
    @store = Store.new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
  private
  def store_params
    params.require(:store).permit(:name, :address, :city, :state, :zipcode, :phone, :url, :facebook, :email)
  end
end
