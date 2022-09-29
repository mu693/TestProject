class CreateDiseaseDoctors < ActiveRecord::Migration[7.0]
  def change
    create_table :disease_doctors do |t|
      t.references :disease, null: false, foreign_key: true
      t.references :doctor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
