class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :fbookid
      t.text :image
      t.integer :location_id
      t.timestamp

    end
  end
end
