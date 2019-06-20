class CreateCampaigns < ActiveRecord::Migration[5.2]
  def change
    create_table :campaigns do |t|
      t.date :start
      t.date :end
      t.string :name

      t.timestamps
    end
  end
end
