class CreateDiseases < ActiveRecord::Migration[7.0]
  def change
    create_table :diseases do |t|
      t.string :name
      t.string :code
      t.integer :status

      t.timestamps
    end
  end
end
