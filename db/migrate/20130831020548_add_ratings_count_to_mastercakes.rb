class AddRatingsCountToMastercakes < ActiveRecord::Migration
  def change
    add_column :mastercakes, :ratings_count, :integer, :default => 0
		
		Mastercake.reset_column_information
    Mastercake.find(:all).each do |c|
    	c.update_attribute :ratings_count, c.ratings.length
    end
  end
end
