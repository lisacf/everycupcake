class CreateProportions < ActiveRecord::Migration
  def change
    create_table :proportions do |t|
      t.integer :recipe_id
      t.integer :ingredient_id
      t.integer :measure_id
      t.integer :unit_id
      t.belongs_to :recipe, index: true
      t.belongs_to :ingredient, index: true
      t.belongs_to :measure, index: true
      t.belongs_to :unit, index: true

      t.timestamps
    end
  end
end
