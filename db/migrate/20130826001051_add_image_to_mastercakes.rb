class AddImageToMastercakes < ActiveRecord::Migration
  def change
    add_column :mastercakes, :image, :string
  end
end
