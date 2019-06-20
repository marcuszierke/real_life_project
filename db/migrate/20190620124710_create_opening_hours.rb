class CreateOpeningHours < ActiveRecord::Migration[5.2]
  def change
    create_table :opening_hours do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.date :day
      t.integer :pharmacy_id

      t.timestamps
    end
  end
end
