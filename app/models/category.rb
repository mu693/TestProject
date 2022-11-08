class Category < ApplicationRecord
  belongs_to :user
  belongs_to :disease
  belongs_to :medicine
end
