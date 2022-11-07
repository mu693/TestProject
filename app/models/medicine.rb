class Medicine < ApplicationRecord
  belongs_to :user

  # Association
  has_many :categories
  has_many :medicine_diseases
  has_many :diseases, through: :medicine_diseases

  validates_presence_of :name, :description, :quantity, :price, :manfucturing_date, :expiry_date

  scope :searched, ->(name) { where('name ILIKE ?', "%#{name}%") }
end
