class CreateMastercakes < ActiveRecord::Migration
  def change
    create_table :mastercakes do |t|
      t.string :name
      t.string :description
      t.string :source
      t.integer :user_id
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
