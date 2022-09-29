# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


Doctor.create!([{
  name: "Nasim Ashraf",
  description: "Covid-19"
},
{
  name: "Shazia Khalid",
  description: "Dengue"
},
{
  name: "Amar Moosa",
  description: "Diphtheria"
},
{
  name: "Faisal Masood",
  description: "Diabetes"
}])
p "Created #{Doctor.count} Doctors"
