class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.references :disease, foreign_key: true, default: 0

      t.timestamps
    end
  end
end
