class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :cupcake_part
      t.integer :user_id
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
