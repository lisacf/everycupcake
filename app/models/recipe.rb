class Recipe < ActiveRecord::Base
  belongs_to :user
  has_many :mastercakes, through: :cakecombos
  has_many :proportions
  has_many :ingredients, through: :proportions
  has_many :instructions
  has_many :cakecombos

  accepts_nested_attributes_for :proportions, allow_destroy: true
  accepts_nested_attributes_for :ingredients
  accepts_nested_attributes_for :instructions, allow_destroy: true
  # accepts_nested_attributes_for :cakecombos, allow_destroy: true
end
