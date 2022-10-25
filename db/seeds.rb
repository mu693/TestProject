# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


Doctor.create!([{
  name: "Nasim Ashraf",
  description: "Viral Diseases"
},
{
  name: "Mohsin Mighiana",
  description: "Asthma"
},
{
  name: "Shazia Aslam",
  description: "Dengue"
},
{
  name: "Shafiq-ur-Rahman",
  description: "Cardiologist"
},
{
  name: "Amar Moosa",
  description: "Diphtheria"
},
{
  name: "Mohammad Rashid Zia",
  description: "ENT"
},
{
  name: "Faisal Masood",
  description: "Diabetes"
},  
{
    name: "Hafiz Abdul Majid",
    description: "Neurologist"
}])
p "Created #{Doctor.count} Doctors"


User.create(
  :name => "Irum",
  :lname => "Mushtaq",
  :email => "admin_rtc@gmail.com",
  :role => "admin",
  :approved => "true",
  :password => "123456",
  :password_confirmation => "123456"
)
p "Created #{User.count} Users"