class RemoveCategoryTypeCategories < ActiveRecord::Migration[7.0]
  def change
    remove_column :categories, :category_type
  end
end
