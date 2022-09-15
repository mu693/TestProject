class RemoveDiseaseTypeToDiseases < ActiveRecord::Migration[7.0]
  def change
    remove_column :diseases, :disease_type
  end
end
