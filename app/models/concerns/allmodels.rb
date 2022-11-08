module Allmodels
  extend ActiveSupport::Concern
  included do
    validates_presence_of :name
    scope :searched, ->(name) { where('name ILIKE ?', "%#{name}%") }    
  end
end  