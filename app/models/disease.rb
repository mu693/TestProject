class Disease < ApplicationRecord
  include Searchqueries
  enum :status, %i[active inactive]

  validates_presence_of :code, :status

  # Association
  belongs_to :user
  has_many :categories
  has_many :medicine_diseases
  has_many :medicines, through: :medicine_diseases, dependent: :destroy

  has_many :user_diseases
  has_many :users, through: :user_diseases, dependent: :destroy

  # class method
  # def self.get_all_diseases
  #  disease = self.all
  # end

  # instance method
  def get_all_diseases
    disease = all
  end
end
