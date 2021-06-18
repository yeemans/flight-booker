class CreateTrips < ActiveRecord::Migration[6.1]
  def change
    create_table :trips do |t|
      t.references :airport, foreign_key: true, index: true 
      t.references :flight, index: true, foreign_key: true
      t.timestamps
    end
  end
end
