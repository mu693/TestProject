class Category < ApplicationRecord
  include Searchqueries
  belongs_to :user
  belongs_to :disease
  belongs_to :medicine
end
