# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create!([{
               name: 'Dr.Amar',
               lname: 'Moosa',
               email: 'doctor1@gmail.com',
               role: 'doctor',
               specialization: 'Diagnostic Survey',
               password: '123456',
               password_confirmation: '123456'
             },
              {
                name: 'Dr.Ali',
                lname: 'Shakeel',
                email: 'doctor2@gmail.com',
                role: 'doctor',
                specialization: 'Management Of Diabetis',
                password: '123456',
                password_confirmation: '123456'
              },
              {
                name: 'Dr.Brig.Khalid',
                lname: 'Amjad',
                email: 'doctor3@gmail.com',
                role: 'doctor',
                specialization: 'Electrocardiogram(Ecg/Ekg)',
                password: '123456',
                password_confirmation: '123456'
              },
              {
                name: 'Dr.Ajmal',
                lname: 'Osman',
                email: 'doctor4@gmail.com',
                role: 'doctor',
                specialization: 'Diagnosing, Electrocardiogram(Ecg/Ekg)',
                password: '123456',
                password_confirmation: '123456'
              },
              {
                name: 'Dr.Shahbaz',
                lname: 'Ashraf',
                email: 'doctor5@gmail.com',
                role: 'doctor',
                specialization: 'Pulmonary Disease',
                password: '123456',
                password_confirmation: '123456'
              },
              {
                name: 'Dr.Amna',
                lname: 'Iqbal',
                email: 'doctor6@gmail.com',
                role: 'doctor',
                specialization: 'MCPS(Community Medicine)',
                password: '123456',
                password_confirmation: '123456'
              }])

# p "Created #{Doctor.count} Doctors"

User.create(
  name: 'Irum',
  lname: 'Mushtaq',
  email: 'admin_rtc@gmail.com',
  role: 'admin',
  password: '123456',
  password_confirmation: '123456'
)
p "Created #{User.count} Users"
