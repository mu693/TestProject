class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # after_create :send_admin_mail

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :timeoutable, :trackable

  # User roles
  enum role: %i[admin patient doctor]
  after_initialize :set_default_role, if: :new_record?

  def set_default_role
    self.role ||= :admin
  end

  # Associations
  has_many :diseases
  has_many :medicines
  has_many :couriers
  has_many :categories
  has_many :patient_appointments
  has_many :appointment_dates
  has_many :user_diseases
  has_many :diseases, through: :user_diseases, dependent: :destroy
  has_many :notifications, :as => :notifiable
  has_one_attached :avatar

  validates_presence_of :name, :lname

  scope :all_except, ->(user) { where.not(id: user) }
end
