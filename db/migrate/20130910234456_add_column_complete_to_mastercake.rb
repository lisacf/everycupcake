class AddColumnCompleteToMastercake < ActiveRecord::Migration
  def change
    add_column :mastercakes, :complete, :boolean, default: false
  end
end
