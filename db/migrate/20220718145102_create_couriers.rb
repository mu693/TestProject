class CreateCouriers < ActiveRecord::Migration[7.0]
  def change
    create_table :couriers do |t|
      t.string :name
      t.string :address
      t.integer :code
      t.integer :contact_no

      t.timestamps
    end
  end
end
