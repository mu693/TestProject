class Category < ApplicationRecord
  
  belongs_to :disease
  belongs_to :medicine
end
