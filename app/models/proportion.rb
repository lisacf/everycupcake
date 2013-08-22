class Proportion < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :ingredient
  belongs_to :measure
  belongs_to :unit
end
