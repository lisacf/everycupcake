class Ingredient < ActiveRecord::Base
	has_many :proportions
	has_many :recipes, through: :proportions

	validates :name, presence: true

	def self.tokens(query)
		ingredients = where("name like ?", "%#{query}%")
		if ingredients.empty?
			[{id: "<<<#{query}>>>", name: "New: \"#{query}\""}]
		else
			ingredients
		end
	end

	def self.ids_from_tokens(tokens)
			tokens.gsub!(/<<<(.+?)>>>/) { create!(name: $1).id }
			tokens.split(',')
	end
end
