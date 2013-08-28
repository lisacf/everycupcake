class Cakecombo < ActiveRecord::Base
	belongs_to :mastercake
	belongs_to :recipe
end