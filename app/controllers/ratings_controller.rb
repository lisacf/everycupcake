class RatingsController < ApplicationController
	before_filter :load_rateable
  def index
  	@ratings = @rateable.ratings
  end

  def new
  	@rating = @rateable.ratings.new
  end

  def create
  	@rating = @rateable.ratings.new(rating_params)
  	if @rating.save
      @rateable.update_attribute(:average_rating, @rateable.ratings.average(:star))
  		redirect_to @rateable, notice: "Rating created"
  	else
  		render :new
  	end
  end


  def edit
  	@rating = @rateable.ratings
  end
  def update
  end

  private
  def rating_params
  	params.require(:rating).permit(:star, :review, :user_id)
  end

  def load_rateable
  	klass = [Mastercake].detect { |r| params["#{r.name.underscore}_id"] }
  	@rateable = klass.find(params["#{klass.name.underscore}_id"])
  end
end
