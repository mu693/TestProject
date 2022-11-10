class Category < ApplicationRecord
  include Allmodels
  belongs_to :user
  belongs_to :disease
  belongs_to :medicine
end
