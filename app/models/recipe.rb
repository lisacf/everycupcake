class Recipe < ActiveRecord::Base
  belongs_to :user
  has_many :proportions
  has_many :ingredients, through: :proportions
  accepts_nested_attributes_for :proportions, allow_destroy: true
  has_many :instructions
  accepts_nested_attributes_for :instructions, allow_destroy: true


  validates :description, presence: true
  validates :name, presence: true
  validates :source, presence: true
  attr_reader :ingredient_tokens

  def ingredient_tokens=(tokens)
  	self.ingredient_ids = Ingredient.ids_from_tokens(tokens)
  end
end
