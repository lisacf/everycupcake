class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :star
      t.belongs_to :rateable, polymorphic: true

      t.timestamps
    end
    add_index :ratings, [:rateable_id, :rateable_type]
  end
end
