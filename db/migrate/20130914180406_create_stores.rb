class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :name
      t.string :url
      t.string :phone
      t.string :address
      t.string :city
      t.string :state
      t.integer :zipcode
      t.string :facebook
      t.string :email
      t.belongs_to :user, index: true
      t.float :average_rating, :default => 0.0, :null=> false

      t.timestamps
    end
  end
end
