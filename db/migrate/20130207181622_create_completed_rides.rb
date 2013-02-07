class CreateCompletedRides < ActiveRecord::Migration
  def change
    create_table :completed_rides do |t|
      t.integer :user_id
      t.integer :ride_id

      t.timestamps
    end
  end
end
