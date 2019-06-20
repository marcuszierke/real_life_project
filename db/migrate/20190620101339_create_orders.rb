class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.boolean :delivered
      t.date :due_date
      t.integer :campaign_id
      t.integer :pharmacy_id

      t.timestamps
    end
  end
end
