class AddUserToDiseases < ActiveRecord::Migration[7.0]
  def change
    add_reference :diseases, :user, foreign_key: true
  end
end
