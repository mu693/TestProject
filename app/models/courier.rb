class Courier < ApplicationRecord
  include Allmodels
  belongs_to :user
  validates_presence_of :address, :code, :contact_no

  scope :searched, ->(name) { where('name ILIKE ?', "%#{name}%") }
end
