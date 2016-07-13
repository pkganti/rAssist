class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.text :description
      t.integer :user_id
      t.integer :location_id
      t.integer :rassistratings
      t.timestamp
    end
  end
end
