class CreateMedicines < ActiveRecord::Migration[7.0]
  def change
    create_table :medicines do |t|
      t.string :name
      t.text :description
      t.integer :quantity
      t.decimal :price
      t.date :manfucturing_date
      t.date :expiry_date

      t.timestamps
    end
  end
end
