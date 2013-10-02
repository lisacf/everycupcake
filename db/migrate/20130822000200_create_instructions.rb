class CreateInstructions < ActiveRecord::Migration
  def change
    create_table :instructions do |t|
      t.text :content
      t.integer :baketemp
      t.integer :baketime
      t.integer :preptime
      t.integer :recipe_id
      t.belongs_to :recipe, index: true

      t.timestamps
    end
  end
end
