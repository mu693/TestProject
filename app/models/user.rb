class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :timeoutable, :trackable
  
  # Associations       
  has_many :diseases
  has_many :medicines
  has_many :couriers
  has_many :categories
 
  has_one_attached :avatar 

  validates_presence_of :name, :lname, :avatar
 end
