class CreateUnits < ActiveRecord::Migration
  def change
    create_table :units do |t|
      t.string :name
      t.integer :measure_id
      t.belongs_to :measure, index: true


      t.timestamps
    end
  end
end
