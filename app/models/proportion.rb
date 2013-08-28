class Proportion < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :ingredient
  belongs_to :measure
  belongs_to :unit

  attr_reader :ingredient_token

  def ingredient_token=(tokens)
  	if tokens =~ /^\d/ 
  		self.ingredient_id = tokens
  	else
  		Ingredient.ids_from_tokens(tokens)
  		self.ingredient_id = Ingredient.last.id
  	end
  end
end
