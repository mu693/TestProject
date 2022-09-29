class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :timeoutable, :trackable

  # User roles
  enum role: [:admin, :patient]
  after_initialize :set_default_role, :if => :new_record?
  
  def set_default_role
    self.role ||= :admin
  end

  # Associations       
  has_many :diseases
  has_many :medicines
  has_many :couriers
  has_many :categories
  has_many :patient_appointments

  has_one_attached :avatar 

  validates_presence_of :name, :lname, :avatar 
  #validates :password :format => {:with => /^[([a-z]|[A-Z])0-9_-]{6,40}$/, message: "Must be at least 6 characters and include one number and one letter."}
 end
