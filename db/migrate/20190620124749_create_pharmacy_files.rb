class CreatePharmacyFiles < ActiveRecord::Migration[5.2]
  def change
    create_table :pharmacy_files do |t|
      t.string :file_path
      t.integer :pharmacy_id

      t.timestamps
    end
  end
end
