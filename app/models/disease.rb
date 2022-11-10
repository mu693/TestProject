class Disease < ApplicationRecord
  include Allmodels
  enum :status, %i[active inactive]

  validates_presence_of :code, :status

  # Association
  belongs_to :user
  has_many :categories
  has_many :medicine_diseases
  has_many :medicines, through: :medicine_diseases, dependent: :destroy
  has_many :disease_doctors
  has_many :doctors, through: :disease_doctors, dependent: :destroy

  # class method
  # def self.get_all_diseases
  #  disease = self.all
  # end

  # instance method
  def get_all_diseases
   disease = self.all
  end
end
