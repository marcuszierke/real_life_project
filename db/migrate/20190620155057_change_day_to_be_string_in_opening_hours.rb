class ChangeDayToBeStringInOpeningHours < ActiveRecord::Migration[5.2]
  def change
    change_column :opening_hours, :day, :string
  end
end