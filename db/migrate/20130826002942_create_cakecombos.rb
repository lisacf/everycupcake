class CreateCakecombos < ActiveRecord::Migration
  def change
    create_table :cakecombos do |t|
      t.integer :recipe_id
      t.integer :mastercake_id
      t.belongs_to :mastercake, index: true
      t.belongs_to :recipe, index: true

      t.timestamps
    end
  end
end
