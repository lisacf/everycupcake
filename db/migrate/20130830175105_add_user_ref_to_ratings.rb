class AddUserRefToRatings < ActiveRecord::Migration
  def change
    add_reference :ratings, :user, index: true
    add_column :ratings, :review, :text, index: true
  end
end
