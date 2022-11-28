class Medicine < ApplicationRecord
  include Searchqueries
  belongs_to :user

  # Association
  has_many :categories
  has_many :medicine_diseases
  has_many :diseases, through: :medicine_diseases

  validates_presence_of :description, :quantity, :price, :manfucturing_date, :expiry_date
end
