class Measure < ActiveRecord::Base
	has_many :proportions
	has_many :ingredients, through: :proportions
	has_many :units
end
