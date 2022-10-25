class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # after_create :send_admin_mail

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :timeoutable, :trackable

  enum approved: [:false, :true]

  # User roles
  enum role: [:admin, :patient, :doctor]
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
  has_many :doctors, through: :patient_appointments

  has_one_attached :avatar 

  validates_presence_of :name, :lname, :avatar 
  
  ## Admin Approval

  # def active_for_authentication? 
  #   super && approved?
  # end 
    
  # def inactive_message 
  #   approved? ? super : :not_approved
  # end

  # def send_admin_mail
  #   AdminMailer.new_user_waiting_for_approval(email).deliver
  # end

  # def self.send_reset_password_instructions(attributes={})
  #   recoverable = find_or_initialize_with_errors(reset_password_keys, attributes, :not_found)
  #   if recoverable.persisted?
  #     if recoverable.approved?
  #       recoverable.send_reset_password_instructions
  #     else
  #       recoverable.errors.add(:base, :not_approved)
  #     end
  #   end
  #   recoverable
  # end
  
end
