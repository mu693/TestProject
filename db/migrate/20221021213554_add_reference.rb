class AddReference < ActiveRecord::Migration[7.0]
  def change
    add_reference :appointment_dates, :user, null: true, foreign_key: true
  end
end
