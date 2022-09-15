class AddCategoryType1ToCategories < ActiveRecord::Migration[7.0]
  def change
    add_column :categories, :category_type1, :integer
  end
end
