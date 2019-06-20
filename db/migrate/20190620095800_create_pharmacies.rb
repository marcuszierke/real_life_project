class CreatePharmacies < ActiveRecord::Migration[5.2]
  def change
    create_table :pharmacies do |t|
      t.string :name
      t.string :street
      t.string :zip
      t.string :city
      t.string :phone
      t.string :fax
      t.string :email

      t.timestamps
    end
  end
end
