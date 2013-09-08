class AddAverageRatingColumnToMastercake < ActiveRecord::Migration
  def change
    add_column :mastercakes, :average_rating, :float, :default => 0.0, :null=> false
    add_index :mastercakes, :average_rating
  end
end
