class CreateMedicineDiseases < ActiveRecord::Migration[7.0]
  def change
    create_table :medicine_diseases do |t|
      t.references :medicine, null: false, foreign_key: true
      t.references :disease, null: false, foreign_key: true

      t.timestamps
    end
  end
end
