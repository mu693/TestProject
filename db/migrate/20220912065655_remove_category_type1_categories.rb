class RemoveCategoryType1Categories < ActiveRecord::Migration[7.0]
  def change
    remove_column :categories, :category_type1
  end
end
