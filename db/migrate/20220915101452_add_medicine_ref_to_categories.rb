class AddMedicineRefToCategories < ActiveRecord::Migration[7.0]
  def change
    add_reference :categories, :medicine, foreign_key: true
  end
end
