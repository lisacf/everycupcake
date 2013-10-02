module RecipesHelper
	def ingredient_order
		ordered = []
		@recipe.proportions.each do |proportion|
			ordered << proportion.ingredient
		end
		ordered
	end
end
